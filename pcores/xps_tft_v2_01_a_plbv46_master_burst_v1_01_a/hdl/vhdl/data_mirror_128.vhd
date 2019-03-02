-------------------------------------------------------------------------------
-- $Id: data_mirror_128.vhd,v 1.2.4.1 2008/12/16 22:08:36 dougt Exp $
-------------------------------------------------------------------------------
-- data_mirror_128.vhd
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
-- Filename:        data_mirror_128.vhd
--
-- Description:     
--   This file implements the logic needed to mirror the Master's Write Data
-- bus to a 32/64/128 bit PLBV46 Bus. This module assumes that the data 
-- width adapter module is being used to adapt the Master's write data bus
-- width to the PLB bus data width using the PLB defined scheme.
--                
--                  
--                  
--                  
--                  
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:   
--              data_mirror_128.vhd
--
-------------------------------------------------------------------------------
-- Change Log:
--
--
-------------------------------------------------------------------------------
-- Revision History:
--
--
-- Author:          DET
-- Revision:        $$
-- Date:            $$
--
-- History:
--   DET   5/12/2008       Version 1_01_a
--                      
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


library unisim; -- Required for Xilinx primitives
use unisim.all;  


-------------------------------------------------------------------------------

entity data_mirror_128 is
  generic (
    --C_MPLB_AWIDTH  : Integer range 32 to 64 := 32;
    C_MPLB_DWIDTH  : Integer range 32 to 128 := 128;
    C_MIPIF_DWIDTH : Integer range 32 to 128 := 64
    );
  port (
    
    Mstr2Mirror_ABus    : In  std_logic_vector(0 to 3);
    
    Mstr2Mirror_WrDBus  : in  std_logic_vector(0 to C_MPLB_DWIDTH-1);
    Mirror2Bus_WrDBus   : out std_logic_vector(0 to C_MPLB_DWIDTH-1);
    
    Mstr2Mirror_BE      : in  std_logic_vector(0 to C_MPLB_DWIDTH/8-1);
    Mirror2Bus_BE       : out std_logic_vector(0 to C_MPLB_DWIDTH/8-1)
    
    );

end entity data_mirror_128;


architecture implementation of data_mirror_128 is

  -- Constants
    Constant STEER_ADDR_WIDTH : integer := 4;
    
    Constant BYTE_ADDR_OFFSET : integer := 1;
    Constant HWRD_ADDR_OFFSET : integer := 2;
    Constant WRD_OFFSET       : integer := 3;
    Constant DBLWRD_OFFSET    : integer := 4;
    
  -- Signals
    signal sig_addr_bits_A28_A29 : std_logic_vector(0 to 1);
    signal sig_addr_bit_A29      : std_logic;
    signal sig_addr_bit_A28      : std_logic;
  

begin --(architecture implementation)


   
   sig_addr_bit_A28      <=  Mstr2Mirror_ABus(STEER_ADDR_WIDTH - DBLWRD_OFFSET);
   sig_addr_bit_A29      <=  Mstr2Mirror_ABus(STEER_ADDR_WIDTH - WRD_OFFSET);
    
    
   sig_addr_bits_A28_A29 <=  sig_addr_bit_A28 &
                             sig_addr_bit_A29;

    Mirror2Bus_BE        <=  Mstr2Mirror_BE;  -- Be Bus is not Mirrored
                                              -- based on address
   
   ------------------------------------------------------------
   -- If Generate
   --
   -- Label: CASE_B128_M128
   --
   -- If Generate Description:
   --  Bus Data width is 128 bits and the Master Data width is
   -- 128 bits.
   --
   ------------------------------------------------------------
   CASE_M128_B128 : if (C_MPLB_DWIDTH  = 128 and
                        C_MIPIF_DWIDTH = 128) generate
   
   
      begin
   
       -- direct connect for byte lanes 8 - 15 
        Mirror2Bus_WrDBus(64 to 127) <= Mstr2Mirror_WrDBus(64 to 127);
         
        
        
        -------------------------------------------------------------
        -- Combinational Process
        --
        -- Label: MIRROR_MUX_0_3
        --
        -- Process Description:
        -- Mirror mux for byte lanes 0-3. 
        --
        -------------------------------------------------------------
        MIRROR_MUX_0_3 : process (sig_addr_bits_A28_A29,
                                  Mstr2Mirror_WrDBus)
           begin
        
             case sig_addr_bits_A28_A29 is
               -- when "00" =>
               --   Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(0 to 31);
               when "01" =>
                 Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(32 to 63);
               when "10" =>
                 Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(64 to 95);
               when "11" =>
                 Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(96 to 127);
               when others => -- '00' case
                 Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(0 to 31);
             end case;

           end process MIRROR_MUX_0_3; 
        
         
        -------------------------------------------------------------
        -- Combinational Process
        --
        -- Label: MIRROR_MUX_4_7
        --
        -- Process Description:
        -- Mirror mux for byte lanes 4-7. 
        --
        -------------------------------------------------------------
        MIRROR_MUX_4_7 : process (sig_addr_bit_A28,
                                  Mstr2Mirror_WrDBus)
           begin
             
             If (sig_addr_bit_A28 = '1') Then
    
               Mirror2Bus_WrDBus(32 to 63) <= Mstr2Mirror_WrDBus(96 to 127);
               
             else

               Mirror2Bus_WrDBus(32 to 63) <= Mstr2Mirror_WrDBus(32 to 63);
                 
             End if;
             
           end process MIRROR_MUX_4_7; 

         
      end generate CASE_M128_B128;
  
  
   
   
   ------------------------------------------------------------
   -- If Generate
   --
   -- Label: CASE_B128_M64
   --
   -- If Generate Description:
   --  Bus is 128 bits and Master is 64 bits
   --
   --
   ------------------------------------------------------------
   CASE_B128_M64 : if (C_MPLB_DWIDTH = 128 and C_MIPIF_DWIDTH = 64) generate
   
      begin
   
       -- direct connect for byte lanes 4 - 15 
        Mirror2Bus_WrDBus(32 to 127) <= Mstr2Mirror_WrDBus(32 to 127);
         
         
        -------------------------------------------------------------
        -- Combinational Process
        --
        -- Label: MIRROR_MUX_0_3
        --
        -- Process Description:
        -- Mirror mux for byte lanes 0-3. 
        --
        -------------------------------------------------------------
        MIRROR_MUX_0_3 : process (sig_addr_bit_A29,
                                  Mstr2Mirror_WrDBus)
           begin
        
             
             If (sig_addr_bit_A29 = '1') Then
    
               Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(32 to 63);
               
             else

               Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(0 to 31);
                 
             End if;
             
           end process MIRROR_MUX_0_3; 
           
           
      end generate CASE_B128_M64;
  
  
  
  
  
  
   ------------------------------------------------------------
   -- If Generate
   --
   -- Label: CASE_B64_M64
   --
   -- If Generate Description:
   --  Bus is 64 bits and Master is 64 bits
   --
   --
   ------------------------------------------------------------
   CASE_B64_M64 : if (C_MPLB_DWIDTH = 64 and C_MIPIF_DWIDTH = 64) generate
   
      begin
   
       -- direct connect for byte lanes 4 - 7 
        Mirror2Bus_WrDBus(32 to 63) <= Mstr2Mirror_WrDBus(32 to 63);
         
         
        -------------------------------------------------------------
        -- Combinational Process
        --
        -- Label: MIRROR_MUX_0_3
        --
        -- Process Description:
        -- Mirror mux for byte lanes 0-3. 
        --
        -------------------------------------------------------------
        MIRROR_MUX_0_3 : process (sig_addr_bit_A29,
                                  Mstr2Mirror_WrDBus)
           begin
        
             
             If (sig_addr_bit_A29 = '1') Then
    
               Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(32 to 63);
               
             else

               Mirror2Bus_WrDBus(0 to 31) <= Mstr2Mirror_WrDBus(0 to 31);
                 
             End if;
             
           end process MIRROR_MUX_0_3; 
         
           
      end generate CASE_B64_M64;
  
   
   
   
   
   
    
   ------------------------------------------------------------
   -- If Generate
   --
   -- Label: CASE_MSTR_IS_32
   --
   -- If Generate Description:
   --  Bus is 32, 64, or 128 bits and Master is 32 bits
   --
   --
   ------------------------------------------------------------
   --CASE_MSTR_IS_32 : if (C_MPLB_DWIDTH = 128 and C_MIPIF_DWIDTH = 32) generate
   CASE_MSTR_IS_32 : if (C_MIPIF_DWIDTH = 32) generate
   
      begin
   
       -- Just a direct connection because the mirroring
       -- will have been done in Bus Width Adapter
        Mirror2Bus_WrDBus <= Mstr2Mirror_WrDBus;
        
      end generate CASE_MSTR_IS_32;
  


end implementation;
