-------------------------------------------------------------------------------
-- $Id: plb_mstr_addr_gen.vhd,v 1.2.4.1 2008/12/16 22:08:36 dougt Exp $
-------------------------------------------------------------------------------
-- plb_mstr_addr_gen.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
-- DISCLAIMER OF LIABILITY
--
-- This file contains proprietary and confidential information of
-- Xilinx, Inc. ("Xilinx"), that is distributed under a license
-- from Xilinx, and may be used, copied and/or disclosed only
-- pursuant to the terms of a valid license agreement with Xilinx.
--
-- XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
-- ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-- EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
-- LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
-- MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
-- does not warrant that functions included in the Materials will
-- meet the requirements of Licensee, or that the operation of the
-- Materials will be uninterrupted or error-free, or that defects
-- in the Materials will be corrected. Furthermore, Xilinx does
-- not warrant or make any representations regarding use, or the
-- results of the use, of the Materials in terms of correctness,
-- accuracy, reliability or otherwise.
--
-- Xilinx products are not designed or intended to be fail-safe,
-- or for use in any application requiring fail-safe performance,
-- such as life-support or safety devices or systems, Class III
-- medical devices, nuclear facilities, applications related to
-- the deployment of airbags, or any other applications that could
-- lead to death, personal injury or severe property or
-- environmental damage (individually and collectively, "critical
-- applications"). Customer assumes the sole risk and liability
-- of any use of Xilinx products in critical applications,
-- subject only to applicable laws and regulations governing
-- limitations on product liability.
--
-- Copyright  2008, 2009 Xilinx, Inc.
-- All rights reserved.
--
-- This disclaimer and copyright notice must be retained as part
-- of this file at all times.
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        plb_mstr_addr_gen.vhd
--
-- Description:     
--  This VHDL design implements a PLB Master Address Generator.                
--                  
--                  
--                  
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:   
--              plb_mstr_addr_gen.vhd
--
-------------------------------------------------------------------------------
-- Revision History:
--
--
-- Author:          DET
-- Revision:        $Revision: 1.2.4.1 $
-- Date:            $$
--
-- History:
--   DET   5/12/2008    Version 1_01_a
-- 
--     DET     5/14/2008     v1_01_a
-- ~~~~~~
--     - Added code coverage exclusions
-- ^^^^^^
--
--     DET     12/16/2008     v1_01_a
-- ~~~~~~
--     - Updated eula/header to latest version.
-- ^^^^^^
--
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_com" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library xps_tft_v2_01_a_proc_common_v3_00_a;
use xps_tft_v2_01_a_proc_common_v3_00_a.proc_common_pkg.log2; -- log2 function


library unisim; -- Required for Xilinx primitives
use unisim.vcomponents.all;  


-------------------------------------------------------------------------------

entity plb_mstr_addr_gen is
  generic (
    C_AWIDTH             : Integer := 32;
    C_INCR_WIDTH         : Integer := 12;
    C_REM_ADDR_LSB_WIDTH : Integer := 3;
    C_BUS_DWIDTH         : Integer := 64
    );
  port (
   -- inputs 
    Bus_Clk             : In  std_logic;
    Bus_Rst             : In  std_logic;
    Parent_is_Burst     : In  std_logic;
    Address_Ld_Enable   : In  std_logic;
    Address_In          : In  std_logic_vector(0 to C_AWIDTH-1);
    Address_Incr_Enable : In  std_logic;
    Strt_BE_In          : In  std_logic_vector(0 to (C_BUS_DWIDTH/8)-1);
    Incr_Ld_Enable      : In  std_logic;
    Increment_In        : In  std_logic_vector(0 to C_INCR_WIDTH-1);
    Use_Rem_Addr_Lsb    : In  boolean;
    Rem_addr_lsb        : In  std_logic_vector(0 to C_REM_ADDR_LSB_WIDTH-1); 

   -- Outputs 
    Address_Out         : Out std_logic_vector(0 to C_AWIDTH-1);
    BE_Out              : Out std_logic_vector(0 to (C_BUS_DWIDTH/8)-1)
    );

end entity plb_mstr_addr_gen;


architecture implementation of plb_mstr_addr_gen is

  -- Constants
    Constant BE_WIDTH                 : integer := C_BUS_DWIDTH/8;
    Constant NUM_ADDR_BITS_FOR_BE_GEN : integer := log2(C_BUS_DWIDTH/8);
    Constant NUM_INCR_BITS_FOR_BE_GEN : integer := log2(C_BUS_DWIDTH/8)+1;
    Constant INCR_PAD_SIZE            : integer := C_AWIDTH - C_INCR_WIDTH;
    
  
  
  -- Signals
  
    signal current_be_i                 : std_logic_vector(0 to BE_WIDTH-1);
    
    signal strt_be_reg                  : std_logic_vector(0 to 
                                                       (C_BUS_DWIDTH/8)-1);
                                                       
    signal rem_address_unsigned         : unsigned(0 to C_AWIDTH-1);
    
    
    signal current_address_unsigned     : unsigned(0 to C_AWIDTH-1);
    
    Signal increment_reg_unsigned       : unsigned(0 to C_INCR_WIDTH-1);
    
    Signal current_addr_lsb_unsigned    : unsigned(0 to 
                                          NUM_ADDR_BITS_FOR_BE_GEN-1);
                                                   
    Signal current_incr_lsb_unsigned    : unsigned(0 to 
                                          NUM_INCR_BITS_FOR_BE_GEN-1);
                                                   
    Signal addr_plus_incr_lsb_unsigned  : unsigned(0 to 
                                          NUM_ADDR_BITS_FOR_BE_GEN);
 
    Signal current_addr_lsb_int         : integer;
    Signal addr_plus_incr_lsb_int       : integer;
           
           
           

begin -- (architecture implementation)

    
  -- Port output assignments
    
    Address_Out <=  STD_LOGIC_VECTOR(current_address_unsigned);
   
    BE_Out      <=  current_be_i;
   
   
   
   
  -- misc assignments
  
   current_addr_lsb_unsigned <= 
              current_address_unsigned(C_AWIDTH-NUM_ADDR_BITS_FOR_BE_GEN to 
                                       C_AWIDTH-1);
  
   current_incr_lsb_unsigned <=
               increment_reg_unsigned(C_INCR_WIDTH-NUM_INCR_BITS_FOR_BE_GEN to
                                      C_INCR_WIDTH-1);                        
  
 
    addr_plus_incr_lsb_unsigned <=  ('0' & current_addr_lsb_unsigned) +
                                    (current_incr_lsb_unsigned);
 
 
    
    current_addr_lsb_int   <= TO_INTEGER(current_addr_lsb_unsigned);
    addr_plus_incr_lsb_int <= TO_INTEGER(addr_plus_incr_lsb_unsigned);
    
    
    
  
   -------------------------------------------------------------
   -- Synchronous Process with Sync Reset
   --
   -- Label: REG_THE_INCR
   --
   -- Process Description:
   --   This process registers the input increment value.
   --
   -------------------------------------------------------------
   REG_THE_INCR : process (bus_clk)
      begin
        if (Bus_Clk'event and Bus_Clk = '1') then
           if (Bus_Rst = '1') then
             increment_reg_unsigned <= (others => '0');
           elsif (Incr_Ld_Enable = '1') then
             increment_reg_unsigned <= UNSIGNED(Increment_In);
           else
             null; -- hold the last loaded value
           end if;        
        end if;
      end process REG_THE_INCR; 
   
   
   -------------------------------------------------------------
   -- Synchronous Process with Sync Reset
   --
   -- Label: REG_BE_IN
   --
   -- Process Description:
   --
   --
   -------------------------------------------------------------
   REG_BE_IN : process (bus_clk)
      begin
        if (Bus_Clk'event and Bus_Clk = '1') then
           if (Bus_Rst = '1') then
             strt_be_reg <= (others => '0');
           elsif (Address_Ld_Enable = '1') then
             strt_be_reg <= Strt_BE_In;
           else
             null;  -- hold the last value loaded
           end if;        
        end if;
      end process REG_BE_IN; 
   
   
   
  -- Create a modified starting address of a transfer that has a REM overide
  -- on the first databeat 
   rem_address_unsigned <=  current_address_unsigned(0 to  
                            (C_AWIDTH - C_REM_ADDR_LSB_WIDTH)-1)
                            &  unsigned(Rem_addr_lsb);
   
   
   -------------------------------------------------------------
   -- Synchronous Process with Sync Reset
   --
   -- Label: GEN_ADDRESS
   --
   -- Process Description:
   --   This process implements the basic address generator.
   --
   -------------------------------------------------------------
   GEN_ADDRESS : process (bus_clk)
      begin
        if (Bus_Clk'event and Bus_Clk = '1') then
           if (Bus_Rst = '1') then
             current_address_unsigned <= (others => '0');
           elsif (Address_Ld_Enable = '1') then
             current_address_unsigned <= UNSIGNED(Address_In);
           
-- coverage off           
           Elsif (Address_Incr_Enable = '1' and
                  Use_Rem_Addr_Lsb ) Then  -- use REM derived addr LSBs
           
             current_address_unsigned <= rem_address_unsigned +
                                         RESIZE(increment_reg_unsigned,
                                                C_AWIDTH);
-- coverage on
           
           elsif (Address_Incr_Enable = '1') Then
             current_address_unsigned <= current_address_unsigned +
                                         RESIZE(increment_reg_unsigned,
                                                C_AWIDTH);
           else
             null;  -- hold last address value
           end if;        
        end if;
      end process GEN_ADDRESS; 
   



   
    -------------------------------------------------------------
    -- Combinational Process
    --
    -- Label: GEN_BE
    --
    -- Process Description:
    --  This process generates the PLB BE value based on the current
    -- address value and the commanded databeat increment value for 
    -- the transaction.
    --
    -------------------------------------------------------------
    GEN_BE : process (Parent_is_Burst,
                      strt_be_reg,
                      addr_plus_incr_lsb_int,
                      current_addr_lsb_int
                      )
       begin
    
         if (Parent_is_Burst = '1') then
           
           for be_index in 0 to BE_WIDTH-1 loop
           
             if (be_index >= current_addr_lsb_int and 
                 be_index < addr_plus_incr_lsb_int) then
          
                current_be_i(be_index) <=  '1';
                
             else

                current_be_i(be_index) <=  '0';
             
             End if;
            
           end loop;
           
         else
           
           current_be_i <= strt_be_reg;
         
         end if;
    
       end process GEN_BE; 
    

  
  
end implementation;
