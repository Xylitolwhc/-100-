-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    aclSS : inout std_logic;
    aclSCK : inout std_logic;
    aclMOSI : inout std_logic;
    aclMISO : inout std_logic;
    RsTx : out std_logic;
    RsRx : in std_logic;
    RESET : in std_logic;
    clk : in std_logic;
    axi_gpio_0_GPIO_IO_pin : inout std_logic_vector(7 downto 0);
    axi_gpio_0_GPIO2_IO_pin : inout std_logic_vector(7 downto 0);
    xps_mch_emc_0_Mem_A_pin : out std_logic_vector(22 downto 0);
    xps_mch_emc_0_Mem_CEN_pin : out std_logic;
    xps_mch_emc_0_Mem_OEN_pin : out std_logic;
    xps_mch_emc_0_Mem_WEN_pin : out std_logic;
    xps_mch_emc_0_Mem_BEN_pin : out std_logic_vector(0 to 1);
    xps_mch_emc_0_Mem_DQ_pin : inout std_logic_vector(0 to 15);
    xps_tft_0_TFT_VGA_R_pin : out std_logic_vector(5 downto 0);
    xps_tft_0_TFT_VGA_G_pin : out std_logic_vector(5 downto 0);
    xps_tft_0_TFT_VGA_B_pin : out std_logic_vector(5 downto 0);
    xps_tft_0_TFT_HSYNC_pin : out std_logic;
    xps_tft_0_TFT_VSYNC_pin : out std_logic;
    RamCLK : out std_logic
  );
end system;

architecture STRUCTURE of system is

  component system_proc_sys_reset_0_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      MB_Debug_Sys_Rst : in std_logic;
      Core_Reset_Req_0 : in std_logic;
      Chip_Reset_Req_0 : in std_logic;
      System_Reset_Req_0 : in std_logic;
      Core_Reset_Req_1 : in std_logic;
      Chip_Reset_Req_1 : in std_logic;
      System_Reset_Req_1 : in std_logic;
      Dcm_locked : in std_logic;
      RstcPPCresetcore_0 : out std_logic;
      RstcPPCresetchip_0 : out std_logic;
      RstcPPCresetsys_0 : out std_logic;
      RstcPPCresetcore_1 : out std_logic;
      RstcPPCresetchip_1 : out std_logic;
      RstcPPCresetsys_1 : out std_logic;
      MB_Reset : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0);
      Interconnect_aresetn : out std_logic_vector(0 to 0);
      Peripheral_aresetn : out std_logic_vector(0 to 0)
    );
  end component;

  component system_microblaze_0_ilmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      Sl_Wait : in std_logic_vector(0 to 0);
      Sl_UE : in std_logic_vector(0 to 0);
      Sl_CE : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_Wait : out std_logic;
      LMB_UE : out std_logic;
      LMB_CE : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;

  component system_microblaze_0_i_bram_ctrl_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      Sl_Wait : out std_logic;
      Sl_UE : out std_logic;
      Sl_CE : out std_logic;
      LMB1_ABus : in std_logic_vector(0 to 31);
      LMB1_WriteDBus : in std_logic_vector(0 to 31);
      LMB1_AddrStrobe : in std_logic;
      LMB1_ReadStrobe : in std_logic;
      LMB1_WriteStrobe : in std_logic;
      LMB1_BE : in std_logic_vector(0 to 3);
      Sl1_DBus : out std_logic_vector(0 to 31);
      Sl1_Ready : out std_logic;
      Sl1_Wait : out std_logic;
      Sl1_UE : out std_logic;
      Sl1_CE : out std_logic;
      LMB2_ABus : in std_logic_vector(0 to 31);
      LMB2_WriteDBus : in std_logic_vector(0 to 31);
      LMB2_AddrStrobe : in std_logic;
      LMB2_ReadStrobe : in std_logic;
      LMB2_WriteStrobe : in std_logic;
      LMB2_BE : in std_logic_vector(0 to 3);
      Sl2_DBus : out std_logic_vector(0 to 31);
      Sl2_Ready : out std_logic;
      Sl2_Wait : out std_logic;
      Sl2_UE : out std_logic;
      Sl2_CE : out std_logic;
      LMB3_ABus : in std_logic_vector(0 to 31);
      LMB3_WriteDBus : in std_logic_vector(0 to 31);
      LMB3_AddrStrobe : in std_logic;
      LMB3_ReadStrobe : in std_logic;
      LMB3_WriteStrobe : in std_logic;
      LMB3_BE : in std_logic_vector(0 to 3);
      Sl3_DBus : out std_logic_vector(0 to 31);
      Sl3_Ready : out std_logic;
      Sl3_Wait : out std_logic;
      Sl3_UE : out std_logic;
      Sl3_CE : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31);
      Interrupt : out std_logic;
      UE : out std_logic;
      CE : out std_logic;
      SPLB_CTRL_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_PAValid : in std_logic;
      SPLB_CTRL_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_RNW : in std_logic;
      SPLB_CTRL_PLB_BE : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_size : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_type : in std_logic_vector(0 to 2);
      SPLB_CTRL_PLB_wrDBus : in std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_addrAck : out std_logic;
      SPLB_CTRL_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB_CTRL_Sl_wait : out std_logic;
      SPLB_CTRL_Sl_rearbitrate : out std_logic;
      SPLB_CTRL_Sl_wrDAck : out std_logic;
      SPLB_CTRL_Sl_wrComp : out std_logic;
      SPLB_CTRL_Sl_rdDBus : out std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_rdDAck : out std_logic;
      SPLB_CTRL_Sl_rdComp : out std_logic;
      SPLB_CTRL_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_SAValid : in std_logic;
      SPLB_CTRL_PLB_rdPrim : in std_logic;
      SPLB_CTRL_PLB_wrPrim : in std_logic;
      SPLB_CTRL_PLB_abort : in std_logic;
      SPLB_CTRL_PLB_busLock : in std_logic;
      SPLB_CTRL_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_lockErr : in std_logic;
      SPLB_CTRL_PLB_wrBurst : in std_logic;
      SPLB_CTRL_PLB_rdBurst : in std_logic;
      SPLB_CTRL_PLB_wrPendReq : in std_logic;
      SPLB_CTRL_PLB_rdPendReq : in std_logic;
      SPLB_CTRL_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB_CTRL_Sl_wrBTerm : out std_logic;
      SPLB_CTRL_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB_CTRL_Sl_rdBTerm : out std_logic;
      SPLB_CTRL_Sl_MIRQ : out std_logic_vector(0 to 0);
      S_AXI_CTRL_ACLK : in std_logic;
      S_AXI_CTRL_ARESETN : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic
    );
  end component;

  component system_microblaze_0_dlmb_wrapper is
    port (
      LMB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      LMB_Rst : out std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_ReadStrobe : in std_logic;
      M_WriteStrobe : in std_logic;
      M_AddrStrobe : in std_logic;
      M_DBus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 3);
      Sl_DBus : in std_logic_vector(0 to 31);
      Sl_Ready : in std_logic_vector(0 to 0);
      Sl_Wait : in std_logic_vector(0 to 0);
      Sl_UE : in std_logic_vector(0 to 0);
      Sl_CE : in std_logic_vector(0 to 0);
      LMB_ABus : out std_logic_vector(0 to 31);
      LMB_ReadStrobe : out std_logic;
      LMB_WriteStrobe : out std_logic;
      LMB_AddrStrobe : out std_logic;
      LMB_ReadDBus : out std_logic_vector(0 to 31);
      LMB_WriteDBus : out std_logic_vector(0 to 31);
      LMB_Ready : out std_logic;
      LMB_Wait : out std_logic;
      LMB_UE : out std_logic;
      LMB_CE : out std_logic;
      LMB_BE : out std_logic_vector(0 to 3)
    );
  end component;

  component system_microblaze_0_d_bram_ctrl_wrapper is
    port (
      LMB_Clk : in std_logic;
      LMB_Rst : in std_logic;
      LMB_ABus : in std_logic_vector(0 to 31);
      LMB_WriteDBus : in std_logic_vector(0 to 31);
      LMB_AddrStrobe : in std_logic;
      LMB_ReadStrobe : in std_logic;
      LMB_WriteStrobe : in std_logic;
      LMB_BE : in std_logic_vector(0 to 3);
      Sl_DBus : out std_logic_vector(0 to 31);
      Sl_Ready : out std_logic;
      Sl_Wait : out std_logic;
      Sl_UE : out std_logic;
      Sl_CE : out std_logic;
      LMB1_ABus : in std_logic_vector(0 to 31);
      LMB1_WriteDBus : in std_logic_vector(0 to 31);
      LMB1_AddrStrobe : in std_logic;
      LMB1_ReadStrobe : in std_logic;
      LMB1_WriteStrobe : in std_logic;
      LMB1_BE : in std_logic_vector(0 to 3);
      Sl1_DBus : out std_logic_vector(0 to 31);
      Sl1_Ready : out std_logic;
      Sl1_Wait : out std_logic;
      Sl1_UE : out std_logic;
      Sl1_CE : out std_logic;
      LMB2_ABus : in std_logic_vector(0 to 31);
      LMB2_WriteDBus : in std_logic_vector(0 to 31);
      LMB2_AddrStrobe : in std_logic;
      LMB2_ReadStrobe : in std_logic;
      LMB2_WriteStrobe : in std_logic;
      LMB2_BE : in std_logic_vector(0 to 3);
      Sl2_DBus : out std_logic_vector(0 to 31);
      Sl2_Ready : out std_logic;
      Sl2_Wait : out std_logic;
      Sl2_UE : out std_logic;
      Sl2_CE : out std_logic;
      LMB3_ABus : in std_logic_vector(0 to 31);
      LMB3_WriteDBus : in std_logic_vector(0 to 31);
      LMB3_AddrStrobe : in std_logic;
      LMB3_ReadStrobe : in std_logic;
      LMB3_WriteStrobe : in std_logic;
      LMB3_BE : in std_logic_vector(0 to 3);
      Sl3_DBus : out std_logic_vector(0 to 31);
      Sl3_Ready : out std_logic;
      Sl3_Wait : out std_logic;
      Sl3_UE : out std_logic;
      Sl3_CE : out std_logic;
      BRAM_Rst_A : out std_logic;
      BRAM_Clk_A : out std_logic;
      BRAM_EN_A : out std_logic;
      BRAM_WEN_A : out std_logic_vector(0 to 3);
      BRAM_Addr_A : out std_logic_vector(0 to 31);
      BRAM_Din_A : in std_logic_vector(0 to 31);
      BRAM_Dout_A : out std_logic_vector(0 to 31);
      Interrupt : out std_logic;
      UE : out std_logic;
      CE : out std_logic;
      SPLB_CTRL_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_PAValid : in std_logic;
      SPLB_CTRL_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_RNW : in std_logic;
      SPLB_CTRL_PLB_BE : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_size : in std_logic_vector(0 to 3);
      SPLB_CTRL_PLB_type : in std_logic_vector(0 to 2);
      SPLB_CTRL_PLB_wrDBus : in std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_addrAck : out std_logic;
      SPLB_CTRL_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB_CTRL_Sl_wait : out std_logic;
      SPLB_CTRL_Sl_rearbitrate : out std_logic;
      SPLB_CTRL_Sl_wrDAck : out std_logic;
      SPLB_CTRL_Sl_wrComp : out std_logic;
      SPLB_CTRL_Sl_rdDBus : out std_logic_vector(0 to 31);
      SPLB_CTRL_Sl_rdDAck : out std_logic;
      SPLB_CTRL_Sl_rdComp : out std_logic;
      SPLB_CTRL_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB_CTRL_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB_CTRL_PLB_SAValid : in std_logic;
      SPLB_CTRL_PLB_rdPrim : in std_logic;
      SPLB_CTRL_PLB_wrPrim : in std_logic;
      SPLB_CTRL_PLB_abort : in std_logic;
      SPLB_CTRL_PLB_busLock : in std_logic;
      SPLB_CTRL_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_lockErr : in std_logic;
      SPLB_CTRL_PLB_wrBurst : in std_logic;
      SPLB_CTRL_PLB_rdBurst : in std_logic;
      SPLB_CTRL_PLB_wrPendReq : in std_logic;
      SPLB_CTRL_PLB_rdPendReq : in std_logic;
      SPLB_CTRL_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB_CTRL_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB_CTRL_Sl_wrBTerm : out std_logic;
      SPLB_CTRL_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB_CTRL_Sl_rdBTerm : out std_logic;
      SPLB_CTRL_Sl_MIRQ : out std_logic_vector(0 to 0);
      S_AXI_CTRL_ACLK : in std_logic;
      S_AXI_CTRL_ARESETN : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic
    );
  end component;

  component system_microblaze_0_bram_block_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 3);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 31);
      BRAM_Dout_A : in std_logic_vector(0 to 31);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 3);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 31);
      BRAM_Dout_B : in std_logic_vector(0 to 31)
    );
  end component;

  component system_microblaze_0_wrapper is
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      MB_RESET : in std_logic;
      INTERRUPT : in std_logic;
      INTERRUPT_ADDRESS : in std_logic_vector(0 to 31);
      INTERRUPT_ACK : out std_logic_vector(0 to 1);
      EXT_BRK : in std_logic;
      EXT_NM_BRK : in std_logic;
      DBG_STOP : in std_logic;
      MB_Halted : out std_logic;
      MB_Error : out std_logic;
      WAKEUP : in std_logic_vector(0 to 1);
      SLEEP : out std_logic;
      DBG_WAKEUP : out std_logic;
      LOCKSTEP_MASTER_OUT : out std_logic_vector(0 to 4095);
      LOCKSTEP_SLAVE_IN : in std_logic_vector(0 to 4095);
      LOCKSTEP_OUT : out std_logic_vector(0 to 4095);
      INSTR : in std_logic_vector(0 to 31);
      IREADY : in std_logic;
      IWAIT : in std_logic;
      ICE : in std_logic;
      IUE : in std_logic;
      INSTR_ADDR : out std_logic_vector(0 to 31);
      IFETCH : out std_logic;
      I_AS : out std_logic;
      IPLB_M_ABort : out std_logic;
      IPLB_M_ABus : out std_logic_vector(0 to 31);
      IPLB_M_UABus : out std_logic_vector(0 to 31);
      IPLB_M_BE : out std_logic_vector(0 to 3);
      IPLB_M_busLock : out std_logic;
      IPLB_M_lockErr : out std_logic;
      IPLB_M_MSize : out std_logic_vector(0 to 1);
      IPLB_M_priority : out std_logic_vector(0 to 1);
      IPLB_M_rdBurst : out std_logic;
      IPLB_M_request : out std_logic;
      IPLB_M_RNW : out std_logic;
      IPLB_M_size : out std_logic_vector(0 to 3);
      IPLB_M_TAttribute : out std_logic_vector(0 to 15);
      IPLB_M_type : out std_logic_vector(0 to 2);
      IPLB_M_wrBurst : out std_logic;
      IPLB_M_wrDBus : out std_logic_vector(0 to 31);
      IPLB_MBusy : in std_logic;
      IPLB_MRdErr : in std_logic;
      IPLB_MWrErr : in std_logic;
      IPLB_MIRQ : in std_logic;
      IPLB_MWrBTerm : in std_logic;
      IPLB_MWrDAck : in std_logic;
      IPLB_MAddrAck : in std_logic;
      IPLB_MRdBTerm : in std_logic;
      IPLB_MRdDAck : in std_logic;
      IPLB_MRdDBus : in std_logic_vector(0 to 31);
      IPLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB_MRearbitrate : in std_logic;
      IPLB_MSSize : in std_logic_vector(0 to 1);
      IPLB_MTimeout : in std_logic;
      DATA_READ : in std_logic_vector(0 to 31);
      DREADY : in std_logic;
      DWAIT : in std_logic;
      DCE : in std_logic;
      DUE : in std_logic;
      DATA_WRITE : out std_logic_vector(0 to 31);
      DATA_ADDR : out std_logic_vector(0 to 31);
      D_AS : out std_logic;
      READ_STROBE : out std_logic;
      WRITE_STROBE : out std_logic;
      BYTE_ENABLE : out std_logic_vector(0 to 3);
      DPLB_M_ABort : out std_logic;
      DPLB_M_ABus : out std_logic_vector(0 to 31);
      DPLB_M_UABus : out std_logic_vector(0 to 31);
      DPLB_M_BE : out std_logic_vector(0 to 3);
      DPLB_M_busLock : out std_logic;
      DPLB_M_lockErr : out std_logic;
      DPLB_M_MSize : out std_logic_vector(0 to 1);
      DPLB_M_priority : out std_logic_vector(0 to 1);
      DPLB_M_rdBurst : out std_logic;
      DPLB_M_request : out std_logic;
      DPLB_M_RNW : out std_logic;
      DPLB_M_size : out std_logic_vector(0 to 3);
      DPLB_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB_M_type : out std_logic_vector(0 to 2);
      DPLB_M_wrBurst : out std_logic;
      DPLB_M_wrDBus : out std_logic_vector(0 to 31);
      DPLB_MBusy : in std_logic;
      DPLB_MRdErr : in std_logic;
      DPLB_MWrErr : in std_logic;
      DPLB_MIRQ : in std_logic;
      DPLB_MWrBTerm : in std_logic;
      DPLB_MWrDAck : in std_logic;
      DPLB_MAddrAck : in std_logic;
      DPLB_MRdBTerm : in std_logic;
      DPLB_MRdDAck : in std_logic;
      DPLB_MRdDBus : in std_logic_vector(0 to 31);
      DPLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB_MRearbitrate : in std_logic;
      DPLB_MSSize : in std_logic_vector(0 to 1);
      DPLB_MTimeout : in std_logic;
      M_AXI_IP_AWID : out std_logic_vector(0 downto 0);
      M_AXI_IP_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_IP_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_IP_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IP_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_IP_AWLOCK : out std_logic;
      M_AXI_IP_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IP_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_IP_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_IP_AWVALID : out std_logic;
      M_AXI_IP_AWREADY : in std_logic;
      M_AXI_IP_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_IP_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_IP_WLAST : out std_logic;
      M_AXI_IP_WVALID : out std_logic;
      M_AXI_IP_WREADY : in std_logic;
      M_AXI_IP_BID : in std_logic_vector(0 downto 0);
      M_AXI_IP_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_IP_BVALID : in std_logic;
      M_AXI_IP_BREADY : out std_logic;
      M_AXI_IP_ARID : out std_logic_vector(0 downto 0);
      M_AXI_IP_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_IP_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_IP_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IP_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_IP_ARLOCK : out std_logic;
      M_AXI_IP_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IP_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_IP_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_IP_ARVALID : out std_logic;
      M_AXI_IP_ARREADY : in std_logic;
      M_AXI_IP_RID : in std_logic_vector(0 downto 0);
      M_AXI_IP_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_IP_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_IP_RLAST : in std_logic;
      M_AXI_IP_RVALID : in std_logic;
      M_AXI_IP_RREADY : out std_logic;
      M_AXI_DP_AWID : out std_logic_vector(0 downto 0);
      M_AXI_DP_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_DP_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_DP_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DP_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_DP_AWLOCK : out std_logic;
      M_AXI_DP_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DP_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_DP_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_DP_AWVALID : out std_logic;
      M_AXI_DP_AWREADY : in std_logic;
      M_AXI_DP_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_DP_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_DP_WLAST : out std_logic;
      M_AXI_DP_WVALID : out std_logic;
      M_AXI_DP_WREADY : in std_logic;
      M_AXI_DP_BID : in std_logic_vector(0 downto 0);
      M_AXI_DP_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_DP_BVALID : in std_logic;
      M_AXI_DP_BREADY : out std_logic;
      M_AXI_DP_ARID : out std_logic_vector(0 downto 0);
      M_AXI_DP_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_DP_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_DP_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DP_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_DP_ARLOCK : out std_logic;
      M_AXI_DP_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DP_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_DP_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_DP_ARVALID : out std_logic;
      M_AXI_DP_ARREADY : in std_logic;
      M_AXI_DP_RID : in std_logic_vector(0 downto 0);
      M_AXI_DP_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_DP_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_DP_RLAST : in std_logic;
      M_AXI_DP_RVALID : in std_logic;
      M_AXI_DP_RREADY : out std_logic;
      M_AXI_IC_AWID : out std_logic_vector(0 downto 0);
      M_AXI_IC_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_IC_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_IC_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_IC_AWLOCK : out std_logic;
      M_AXI_IC_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IC_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_IC_AWVALID : out std_logic;
      M_AXI_IC_AWREADY : in std_logic;
      M_AXI_IC_AWUSER : out std_logic_vector(4 downto 0);
      M_AXI_IC_AWDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_IC_AWSNOOP : out std_logic_vector(2 downto 0);
      M_AXI_IC_AWBAR : out std_logic_vector(1 downto 0);
      M_AXI_IC_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_IC_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_IC_WLAST : out std_logic;
      M_AXI_IC_WVALID : out std_logic;
      M_AXI_IC_WREADY : in std_logic;
      M_AXI_IC_WUSER : out std_logic_vector(0 downto 0);
      M_AXI_IC_BID : in std_logic_vector(0 downto 0);
      M_AXI_IC_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_IC_BVALID : in std_logic;
      M_AXI_IC_BREADY : out std_logic;
      M_AXI_IC_BUSER : in std_logic_vector(0 downto 0);
      M_AXI_IC_WACK : out std_logic;
      M_AXI_IC_ARID : out std_logic_vector(0 downto 0);
      M_AXI_IC_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_IC_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_IC_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_IC_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_IC_ARLOCK : out std_logic;
      M_AXI_IC_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_IC_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARVALID : out std_logic;
      M_AXI_IC_ARREADY : in std_logic;
      M_AXI_IC_ARUSER : out std_logic_vector(4 downto 0);
      M_AXI_IC_ARDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_IC_ARSNOOP : out std_logic_vector(3 downto 0);
      M_AXI_IC_ARBAR : out std_logic_vector(1 downto 0);
      M_AXI_IC_RID : in std_logic_vector(0 downto 0);
      M_AXI_IC_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_IC_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_IC_RLAST : in std_logic;
      M_AXI_IC_RVALID : in std_logic;
      M_AXI_IC_RREADY : out std_logic;
      M_AXI_IC_RUSER : in std_logic_vector(0 downto 0);
      M_AXI_IC_RACK : out std_logic;
      M_AXI_IC_ACVALID : in std_logic;
      M_AXI_IC_ACADDR : in std_logic_vector(31 downto 0);
      M_AXI_IC_ACSNOOP : in std_logic_vector(3 downto 0);
      M_AXI_IC_ACPROT : in std_logic_vector(2 downto 0);
      M_AXI_IC_ACREADY : out std_logic;
      M_AXI_IC_CRREADY : in std_logic;
      M_AXI_IC_CRVALID : out std_logic;
      M_AXI_IC_CRRESP : out std_logic_vector(4 downto 0);
      M_AXI_IC_CDVALID : out std_logic;
      M_AXI_IC_CDREADY : in std_logic;
      M_AXI_IC_CDDATA : out std_logic_vector(31 downto 0);
      M_AXI_IC_CDLAST : out std_logic;
      M_AXI_DC_AWID : out std_logic_vector(0 downto 0);
      M_AXI_DC_AWADDR : out std_logic_vector(31 downto 0);
      M_AXI_DC_AWLEN : out std_logic_vector(7 downto 0);
      M_AXI_DC_AWSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWBURST : out std_logic_vector(1 downto 0);
      M_AXI_DC_AWLOCK : out std_logic;
      M_AXI_DC_AWCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DC_AWPROT : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWQOS : out std_logic_vector(3 downto 0);
      M_AXI_DC_AWVALID : out std_logic;
      M_AXI_DC_AWREADY : in std_logic;
      M_AXI_DC_AWUSER : out std_logic_vector(4 downto 0);
      M_AXI_DC_AWDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_DC_AWSNOOP : out std_logic_vector(2 downto 0);
      M_AXI_DC_AWBAR : out std_logic_vector(1 downto 0);
      M_AXI_DC_WDATA : out std_logic_vector(31 downto 0);
      M_AXI_DC_WSTRB : out std_logic_vector(3 downto 0);
      M_AXI_DC_WLAST : out std_logic;
      M_AXI_DC_WVALID : out std_logic;
      M_AXI_DC_WREADY : in std_logic;
      M_AXI_DC_WUSER : out std_logic_vector(0 downto 0);
      M_AXI_DC_BID : in std_logic_vector(0 downto 0);
      M_AXI_DC_BRESP : in std_logic_vector(1 downto 0);
      M_AXI_DC_BVALID : in std_logic;
      M_AXI_DC_BREADY : out std_logic;
      M_AXI_DC_BUSER : in std_logic_vector(0 downto 0);
      M_AXI_DC_WACK : out std_logic;
      M_AXI_DC_ARID : out std_logic_vector(0 downto 0);
      M_AXI_DC_ARADDR : out std_logic_vector(31 downto 0);
      M_AXI_DC_ARLEN : out std_logic_vector(7 downto 0);
      M_AXI_DC_ARSIZE : out std_logic_vector(2 downto 0);
      M_AXI_DC_ARBURST : out std_logic_vector(1 downto 0);
      M_AXI_DC_ARLOCK : out std_logic;
      M_AXI_DC_ARCACHE : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARPROT : out std_logic_vector(2 downto 0);
      M_AXI_DC_ARQOS : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARVALID : out std_logic;
      M_AXI_DC_ARREADY : in std_logic;
      M_AXI_DC_ARUSER : out std_logic_vector(4 downto 0);
      M_AXI_DC_ARDOMAIN : out std_logic_vector(1 downto 0);
      M_AXI_DC_ARSNOOP : out std_logic_vector(3 downto 0);
      M_AXI_DC_ARBAR : out std_logic_vector(1 downto 0);
      M_AXI_DC_RID : in std_logic_vector(0 downto 0);
      M_AXI_DC_RDATA : in std_logic_vector(31 downto 0);
      M_AXI_DC_RRESP : in std_logic_vector(1 downto 0);
      M_AXI_DC_RLAST : in std_logic;
      M_AXI_DC_RVALID : in std_logic;
      M_AXI_DC_RREADY : out std_logic;
      M_AXI_DC_RUSER : in std_logic_vector(0 downto 0);
      M_AXI_DC_RACK : out std_logic;
      M_AXI_DC_ACVALID : in std_logic;
      M_AXI_DC_ACADDR : in std_logic_vector(31 downto 0);
      M_AXI_DC_ACSNOOP : in std_logic_vector(3 downto 0);
      M_AXI_DC_ACPROT : in std_logic_vector(2 downto 0);
      M_AXI_DC_ACREADY : out std_logic;
      M_AXI_DC_CRREADY : in std_logic;
      M_AXI_DC_CRVALID : out std_logic;
      M_AXI_DC_CRRESP : out std_logic_vector(4 downto 0);
      M_AXI_DC_CDVALID : out std_logic;
      M_AXI_DC_CDREADY : in std_logic;
      M_AXI_DC_CDDATA : out std_logic_vector(31 downto 0);
      M_AXI_DC_CDLAST : out std_logic;
      DBG_CLK : in std_logic;
      DBG_TDI : in std_logic;
      DBG_TDO : out std_logic;
      DBG_REG_EN : in std_logic_vector(0 to 7);
      DBG_SHIFT : in std_logic;
      DBG_CAPTURE : in std_logic;
      DBG_UPDATE : in std_logic;
      DEBUG_RST : in std_logic;
      Trace_Instruction : out std_logic_vector(0 to 31);
      Trace_Valid_Instr : out std_logic;
      Trace_PC : out std_logic_vector(0 to 31);
      Trace_Reg_Write : out std_logic;
      Trace_Reg_Addr : out std_logic_vector(0 to 4);
      Trace_MSR_Reg : out std_logic_vector(0 to 14);
      Trace_PID_Reg : out std_logic_vector(0 to 7);
      Trace_New_Reg_Value : out std_logic_vector(0 to 31);
      Trace_Exception_Taken : out std_logic;
      Trace_Exception_Kind : out std_logic_vector(0 to 4);
      Trace_Jump_Taken : out std_logic;
      Trace_Delay_Slot : out std_logic;
      Trace_Data_Address : out std_logic_vector(0 to 31);
      Trace_Data_Access : out std_logic;
      Trace_Data_Read : out std_logic;
      Trace_Data_Write : out std_logic;
      Trace_Data_Write_Value : out std_logic_vector(0 to 31);
      Trace_Data_Byte_Enable : out std_logic_vector(0 to 3);
      Trace_DCache_Req : out std_logic;
      Trace_DCache_Hit : out std_logic;
      Trace_DCache_Rdy : out std_logic;
      Trace_DCache_Read : out std_logic;
      Trace_ICache_Req : out std_logic;
      Trace_ICache_Hit : out std_logic;
      Trace_ICache_Rdy : out std_logic;
      Trace_OF_PipeRun : out std_logic;
      Trace_EX_PipeRun : out std_logic;
      Trace_MEM_PipeRun : out std_logic;
      Trace_MB_Halted : out std_logic;
      Trace_Jump_Hit : out std_logic;
      FSL0_S_CLK : out std_logic;
      FSL0_S_READ : out std_logic;
      FSL0_S_DATA : in std_logic_vector(0 to 31);
      FSL0_S_CONTROL : in std_logic;
      FSL0_S_EXISTS : in std_logic;
      FSL0_M_CLK : out std_logic;
      FSL0_M_WRITE : out std_logic;
      FSL0_M_DATA : out std_logic_vector(0 to 31);
      FSL0_M_CONTROL : out std_logic;
      FSL0_M_FULL : in std_logic;
      FSL1_S_CLK : out std_logic;
      FSL1_S_READ : out std_logic;
      FSL1_S_DATA : in std_logic_vector(0 to 31);
      FSL1_S_CONTROL : in std_logic;
      FSL1_S_EXISTS : in std_logic;
      FSL1_M_CLK : out std_logic;
      FSL1_M_WRITE : out std_logic;
      FSL1_M_DATA : out std_logic_vector(0 to 31);
      FSL1_M_CONTROL : out std_logic;
      FSL1_M_FULL : in std_logic;
      FSL2_S_CLK : out std_logic;
      FSL2_S_READ : out std_logic;
      FSL2_S_DATA : in std_logic_vector(0 to 31);
      FSL2_S_CONTROL : in std_logic;
      FSL2_S_EXISTS : in std_logic;
      FSL2_M_CLK : out std_logic;
      FSL2_M_WRITE : out std_logic;
      FSL2_M_DATA : out std_logic_vector(0 to 31);
      FSL2_M_CONTROL : out std_logic;
      FSL2_M_FULL : in std_logic;
      FSL3_S_CLK : out std_logic;
      FSL3_S_READ : out std_logic;
      FSL3_S_DATA : in std_logic_vector(0 to 31);
      FSL3_S_CONTROL : in std_logic;
      FSL3_S_EXISTS : in std_logic;
      FSL3_M_CLK : out std_logic;
      FSL3_M_WRITE : out std_logic;
      FSL3_M_DATA : out std_logic_vector(0 to 31);
      FSL3_M_CONTROL : out std_logic;
      FSL3_M_FULL : in std_logic;
      FSL4_S_CLK : out std_logic;
      FSL4_S_READ : out std_logic;
      FSL4_S_DATA : in std_logic_vector(0 to 31);
      FSL4_S_CONTROL : in std_logic;
      FSL4_S_EXISTS : in std_logic;
      FSL4_M_CLK : out std_logic;
      FSL4_M_WRITE : out std_logic;
      FSL4_M_DATA : out std_logic_vector(0 to 31);
      FSL4_M_CONTROL : out std_logic;
      FSL4_M_FULL : in std_logic;
      FSL5_S_CLK : out std_logic;
      FSL5_S_READ : out std_logic;
      FSL5_S_DATA : in std_logic_vector(0 to 31);
      FSL5_S_CONTROL : in std_logic;
      FSL5_S_EXISTS : in std_logic;
      FSL5_M_CLK : out std_logic;
      FSL5_M_WRITE : out std_logic;
      FSL5_M_DATA : out std_logic_vector(0 to 31);
      FSL5_M_CONTROL : out std_logic;
      FSL5_M_FULL : in std_logic;
      FSL6_S_CLK : out std_logic;
      FSL6_S_READ : out std_logic;
      FSL6_S_DATA : in std_logic_vector(0 to 31);
      FSL6_S_CONTROL : in std_logic;
      FSL6_S_EXISTS : in std_logic;
      FSL6_M_CLK : out std_logic;
      FSL6_M_WRITE : out std_logic;
      FSL6_M_DATA : out std_logic_vector(0 to 31);
      FSL6_M_CONTROL : out std_logic;
      FSL6_M_FULL : in std_logic;
      FSL7_S_CLK : out std_logic;
      FSL7_S_READ : out std_logic;
      FSL7_S_DATA : in std_logic_vector(0 to 31);
      FSL7_S_CONTROL : in std_logic;
      FSL7_S_EXISTS : in std_logic;
      FSL7_M_CLK : out std_logic;
      FSL7_M_WRITE : out std_logic;
      FSL7_M_DATA : out std_logic_vector(0 to 31);
      FSL7_M_CONTROL : out std_logic;
      FSL7_M_FULL : in std_logic;
      FSL8_S_CLK : out std_logic;
      FSL8_S_READ : out std_logic;
      FSL8_S_DATA : in std_logic_vector(0 to 31);
      FSL8_S_CONTROL : in std_logic;
      FSL8_S_EXISTS : in std_logic;
      FSL8_M_CLK : out std_logic;
      FSL8_M_WRITE : out std_logic;
      FSL8_M_DATA : out std_logic_vector(0 to 31);
      FSL8_M_CONTROL : out std_logic;
      FSL8_M_FULL : in std_logic;
      FSL9_S_CLK : out std_logic;
      FSL9_S_READ : out std_logic;
      FSL9_S_DATA : in std_logic_vector(0 to 31);
      FSL9_S_CONTROL : in std_logic;
      FSL9_S_EXISTS : in std_logic;
      FSL9_M_CLK : out std_logic;
      FSL9_M_WRITE : out std_logic;
      FSL9_M_DATA : out std_logic_vector(0 to 31);
      FSL9_M_CONTROL : out std_logic;
      FSL9_M_FULL : in std_logic;
      FSL10_S_CLK : out std_logic;
      FSL10_S_READ : out std_logic;
      FSL10_S_DATA : in std_logic_vector(0 to 31);
      FSL10_S_CONTROL : in std_logic;
      FSL10_S_EXISTS : in std_logic;
      FSL10_M_CLK : out std_logic;
      FSL10_M_WRITE : out std_logic;
      FSL10_M_DATA : out std_logic_vector(0 to 31);
      FSL10_M_CONTROL : out std_logic;
      FSL10_M_FULL : in std_logic;
      FSL11_S_CLK : out std_logic;
      FSL11_S_READ : out std_logic;
      FSL11_S_DATA : in std_logic_vector(0 to 31);
      FSL11_S_CONTROL : in std_logic;
      FSL11_S_EXISTS : in std_logic;
      FSL11_M_CLK : out std_logic;
      FSL11_M_WRITE : out std_logic;
      FSL11_M_DATA : out std_logic_vector(0 to 31);
      FSL11_M_CONTROL : out std_logic;
      FSL11_M_FULL : in std_logic;
      FSL12_S_CLK : out std_logic;
      FSL12_S_READ : out std_logic;
      FSL12_S_DATA : in std_logic_vector(0 to 31);
      FSL12_S_CONTROL : in std_logic;
      FSL12_S_EXISTS : in std_logic;
      FSL12_M_CLK : out std_logic;
      FSL12_M_WRITE : out std_logic;
      FSL12_M_DATA : out std_logic_vector(0 to 31);
      FSL12_M_CONTROL : out std_logic;
      FSL12_M_FULL : in std_logic;
      FSL13_S_CLK : out std_logic;
      FSL13_S_READ : out std_logic;
      FSL13_S_DATA : in std_logic_vector(0 to 31);
      FSL13_S_CONTROL : in std_logic;
      FSL13_S_EXISTS : in std_logic;
      FSL13_M_CLK : out std_logic;
      FSL13_M_WRITE : out std_logic;
      FSL13_M_DATA : out std_logic_vector(0 to 31);
      FSL13_M_CONTROL : out std_logic;
      FSL13_M_FULL : in std_logic;
      FSL14_S_CLK : out std_logic;
      FSL14_S_READ : out std_logic;
      FSL14_S_DATA : in std_logic_vector(0 to 31);
      FSL14_S_CONTROL : in std_logic;
      FSL14_S_EXISTS : in std_logic;
      FSL14_M_CLK : out std_logic;
      FSL14_M_WRITE : out std_logic;
      FSL14_M_DATA : out std_logic_vector(0 to 31);
      FSL14_M_CONTROL : out std_logic;
      FSL14_M_FULL : in std_logic;
      FSL15_S_CLK : out std_logic;
      FSL15_S_READ : out std_logic;
      FSL15_S_DATA : in std_logic_vector(0 to 31);
      FSL15_S_CONTROL : in std_logic;
      FSL15_S_EXISTS : in std_logic;
      FSL15_M_CLK : out std_logic;
      FSL15_M_WRITE : out std_logic;
      FSL15_M_DATA : out std_logic_vector(0 to 31);
      FSL15_M_CONTROL : out std_logic;
      FSL15_M_FULL : in std_logic;
      M0_AXIS_TLAST : out std_logic;
      M0_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M0_AXIS_TVALID : out std_logic;
      M0_AXIS_TREADY : in std_logic;
      S0_AXIS_TLAST : in std_logic;
      S0_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S0_AXIS_TVALID : in std_logic;
      S0_AXIS_TREADY : out std_logic;
      M1_AXIS_TLAST : out std_logic;
      M1_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M1_AXIS_TVALID : out std_logic;
      M1_AXIS_TREADY : in std_logic;
      S1_AXIS_TLAST : in std_logic;
      S1_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S1_AXIS_TVALID : in std_logic;
      S1_AXIS_TREADY : out std_logic;
      M2_AXIS_TLAST : out std_logic;
      M2_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M2_AXIS_TVALID : out std_logic;
      M2_AXIS_TREADY : in std_logic;
      S2_AXIS_TLAST : in std_logic;
      S2_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S2_AXIS_TVALID : in std_logic;
      S2_AXIS_TREADY : out std_logic;
      M3_AXIS_TLAST : out std_logic;
      M3_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M3_AXIS_TVALID : out std_logic;
      M3_AXIS_TREADY : in std_logic;
      S3_AXIS_TLAST : in std_logic;
      S3_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S3_AXIS_TVALID : in std_logic;
      S3_AXIS_TREADY : out std_logic;
      M4_AXIS_TLAST : out std_logic;
      M4_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M4_AXIS_TVALID : out std_logic;
      M4_AXIS_TREADY : in std_logic;
      S4_AXIS_TLAST : in std_logic;
      S4_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S4_AXIS_TVALID : in std_logic;
      S4_AXIS_TREADY : out std_logic;
      M5_AXIS_TLAST : out std_logic;
      M5_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M5_AXIS_TVALID : out std_logic;
      M5_AXIS_TREADY : in std_logic;
      S5_AXIS_TLAST : in std_logic;
      S5_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S5_AXIS_TVALID : in std_logic;
      S5_AXIS_TREADY : out std_logic;
      M6_AXIS_TLAST : out std_logic;
      M6_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M6_AXIS_TVALID : out std_logic;
      M6_AXIS_TREADY : in std_logic;
      S6_AXIS_TLAST : in std_logic;
      S6_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S6_AXIS_TVALID : in std_logic;
      S6_AXIS_TREADY : out std_logic;
      M7_AXIS_TLAST : out std_logic;
      M7_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M7_AXIS_TVALID : out std_logic;
      M7_AXIS_TREADY : in std_logic;
      S7_AXIS_TLAST : in std_logic;
      S7_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S7_AXIS_TVALID : in std_logic;
      S7_AXIS_TREADY : out std_logic;
      M8_AXIS_TLAST : out std_logic;
      M8_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M8_AXIS_TVALID : out std_logic;
      M8_AXIS_TREADY : in std_logic;
      S8_AXIS_TLAST : in std_logic;
      S8_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S8_AXIS_TVALID : in std_logic;
      S8_AXIS_TREADY : out std_logic;
      M9_AXIS_TLAST : out std_logic;
      M9_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M9_AXIS_TVALID : out std_logic;
      M9_AXIS_TREADY : in std_logic;
      S9_AXIS_TLAST : in std_logic;
      S9_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S9_AXIS_TVALID : in std_logic;
      S9_AXIS_TREADY : out std_logic;
      M10_AXIS_TLAST : out std_logic;
      M10_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M10_AXIS_TVALID : out std_logic;
      M10_AXIS_TREADY : in std_logic;
      S10_AXIS_TLAST : in std_logic;
      S10_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S10_AXIS_TVALID : in std_logic;
      S10_AXIS_TREADY : out std_logic;
      M11_AXIS_TLAST : out std_logic;
      M11_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M11_AXIS_TVALID : out std_logic;
      M11_AXIS_TREADY : in std_logic;
      S11_AXIS_TLAST : in std_logic;
      S11_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S11_AXIS_TVALID : in std_logic;
      S11_AXIS_TREADY : out std_logic;
      M12_AXIS_TLAST : out std_logic;
      M12_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M12_AXIS_TVALID : out std_logic;
      M12_AXIS_TREADY : in std_logic;
      S12_AXIS_TLAST : in std_logic;
      S12_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S12_AXIS_TVALID : in std_logic;
      S12_AXIS_TREADY : out std_logic;
      M13_AXIS_TLAST : out std_logic;
      M13_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M13_AXIS_TVALID : out std_logic;
      M13_AXIS_TREADY : in std_logic;
      S13_AXIS_TLAST : in std_logic;
      S13_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S13_AXIS_TVALID : in std_logic;
      S13_AXIS_TREADY : out std_logic;
      M14_AXIS_TLAST : out std_logic;
      M14_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M14_AXIS_TVALID : out std_logic;
      M14_AXIS_TREADY : in std_logic;
      S14_AXIS_TLAST : in std_logic;
      S14_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S14_AXIS_TVALID : in std_logic;
      S14_AXIS_TREADY : out std_logic;
      M15_AXIS_TLAST : out std_logic;
      M15_AXIS_TDATA : out std_logic_vector(31 downto 0);
      M15_AXIS_TVALID : out std_logic;
      M15_AXIS_TREADY : in std_logic;
      S15_AXIS_TLAST : in std_logic;
      S15_AXIS_TDATA : in std_logic_vector(31 downto 0);
      S15_AXIS_TVALID : in std_logic;
      S15_AXIS_TREADY : out std_logic;
      ICACHE_FSL_IN_CLK : out std_logic;
      ICACHE_FSL_IN_READ : out std_logic;
      ICACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      ICACHE_FSL_IN_CONTROL : in std_logic;
      ICACHE_FSL_IN_EXISTS : in std_logic;
      ICACHE_FSL_OUT_CLK : out std_logic;
      ICACHE_FSL_OUT_WRITE : out std_logic;
      ICACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      ICACHE_FSL_OUT_CONTROL : out std_logic;
      ICACHE_FSL_OUT_FULL : in std_logic;
      DCACHE_FSL_IN_CLK : out std_logic;
      DCACHE_FSL_IN_READ : out std_logic;
      DCACHE_FSL_IN_DATA : in std_logic_vector(0 to 31);
      DCACHE_FSL_IN_CONTROL : in std_logic;
      DCACHE_FSL_IN_EXISTS : in std_logic;
      DCACHE_FSL_OUT_CLK : out std_logic;
      DCACHE_FSL_OUT_WRITE : out std_logic;
      DCACHE_FSL_OUT_DATA : out std_logic_vector(0 to 31);
      DCACHE_FSL_OUT_CONTROL : out std_logic;
      DCACHE_FSL_OUT_FULL : in std_logic
    );
  end component;

  component system_debug_module_wrapper is
    port (
      Interrupt : out std_logic;
      Debug_SYS_Rst : out std_logic;
      Ext_BRK : out std_logic;
      Ext_NM_BRK : out std_logic;
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 2);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 3);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 31);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 31);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 7);
      Sl_MWrErr : out std_logic_vector(0 to 7);
      Sl_MRdErr : out std_logic_vector(0 to 7);
      Sl_MIRQ : out std_logic_vector(0 to 7);
      Dbg_Clk_0 : out std_logic;
      Dbg_TDI_0 : out std_logic;
      Dbg_TDO_0 : in std_logic;
      Dbg_Reg_En_0 : out std_logic_vector(0 to 7);
      Dbg_Capture_0 : out std_logic;
      Dbg_Shift_0 : out std_logic;
      Dbg_Update_0 : out std_logic;
      Dbg_Rst_0 : out std_logic;
      Dbg_Clk_1 : out std_logic;
      Dbg_TDI_1 : out std_logic;
      Dbg_TDO_1 : in std_logic;
      Dbg_Reg_En_1 : out std_logic_vector(0 to 7);
      Dbg_Capture_1 : out std_logic;
      Dbg_Shift_1 : out std_logic;
      Dbg_Update_1 : out std_logic;
      Dbg_Rst_1 : out std_logic;
      Dbg_Clk_2 : out std_logic;
      Dbg_TDI_2 : out std_logic;
      Dbg_TDO_2 : in std_logic;
      Dbg_Reg_En_2 : out std_logic_vector(0 to 7);
      Dbg_Capture_2 : out std_logic;
      Dbg_Shift_2 : out std_logic;
      Dbg_Update_2 : out std_logic;
      Dbg_Rst_2 : out std_logic;
      Dbg_Clk_3 : out std_logic;
      Dbg_TDI_3 : out std_logic;
      Dbg_TDO_3 : in std_logic;
      Dbg_Reg_En_3 : out std_logic_vector(0 to 7);
      Dbg_Capture_3 : out std_logic;
      Dbg_Shift_3 : out std_logic;
      Dbg_Update_3 : out std_logic;
      Dbg_Rst_3 : out std_logic;
      Dbg_Clk_4 : out std_logic;
      Dbg_TDI_4 : out std_logic;
      Dbg_TDO_4 : in std_logic;
      Dbg_Reg_En_4 : out std_logic_vector(0 to 7);
      Dbg_Capture_4 : out std_logic;
      Dbg_Shift_4 : out std_logic;
      Dbg_Update_4 : out std_logic;
      Dbg_Rst_4 : out std_logic;
      Dbg_Clk_5 : out std_logic;
      Dbg_TDI_5 : out std_logic;
      Dbg_TDO_5 : in std_logic;
      Dbg_Reg_En_5 : out std_logic_vector(0 to 7);
      Dbg_Capture_5 : out std_logic;
      Dbg_Shift_5 : out std_logic;
      Dbg_Update_5 : out std_logic;
      Dbg_Rst_5 : out std_logic;
      Dbg_Clk_6 : out std_logic;
      Dbg_TDI_6 : out std_logic;
      Dbg_TDO_6 : in std_logic;
      Dbg_Reg_En_6 : out std_logic_vector(0 to 7);
      Dbg_Capture_6 : out std_logic;
      Dbg_Shift_6 : out std_logic;
      Dbg_Update_6 : out std_logic;
      Dbg_Rst_6 : out std_logic;
      Dbg_Clk_7 : out std_logic;
      Dbg_TDI_7 : out std_logic;
      Dbg_TDO_7 : in std_logic;
      Dbg_Reg_En_7 : out std_logic_vector(0 to 7);
      Dbg_Capture_7 : out std_logic;
      Dbg_Shift_7 : out std_logic;
      Dbg_Update_7 : out std_logic;
      Dbg_Rst_7 : out std_logic;
      Dbg_Clk_8 : out std_logic;
      Dbg_TDI_8 : out std_logic;
      Dbg_TDO_8 : in std_logic;
      Dbg_Reg_En_8 : out std_logic_vector(0 to 7);
      Dbg_Capture_8 : out std_logic;
      Dbg_Shift_8 : out std_logic;
      Dbg_Update_8 : out std_logic;
      Dbg_Rst_8 : out std_logic;
      Dbg_Clk_9 : out std_logic;
      Dbg_TDI_9 : out std_logic;
      Dbg_TDO_9 : in std_logic;
      Dbg_Reg_En_9 : out std_logic_vector(0 to 7);
      Dbg_Capture_9 : out std_logic;
      Dbg_Shift_9 : out std_logic;
      Dbg_Update_9 : out std_logic;
      Dbg_Rst_9 : out std_logic;
      Dbg_Clk_10 : out std_logic;
      Dbg_TDI_10 : out std_logic;
      Dbg_TDO_10 : in std_logic;
      Dbg_Reg_En_10 : out std_logic_vector(0 to 7);
      Dbg_Capture_10 : out std_logic;
      Dbg_Shift_10 : out std_logic;
      Dbg_Update_10 : out std_logic;
      Dbg_Rst_10 : out std_logic;
      Dbg_Clk_11 : out std_logic;
      Dbg_TDI_11 : out std_logic;
      Dbg_TDO_11 : in std_logic;
      Dbg_Reg_En_11 : out std_logic_vector(0 to 7);
      Dbg_Capture_11 : out std_logic;
      Dbg_Shift_11 : out std_logic;
      Dbg_Update_11 : out std_logic;
      Dbg_Rst_11 : out std_logic;
      Dbg_Clk_12 : out std_logic;
      Dbg_TDI_12 : out std_logic;
      Dbg_TDO_12 : in std_logic;
      Dbg_Reg_En_12 : out std_logic_vector(0 to 7);
      Dbg_Capture_12 : out std_logic;
      Dbg_Shift_12 : out std_logic;
      Dbg_Update_12 : out std_logic;
      Dbg_Rst_12 : out std_logic;
      Dbg_Clk_13 : out std_logic;
      Dbg_TDI_13 : out std_logic;
      Dbg_TDO_13 : in std_logic;
      Dbg_Reg_En_13 : out std_logic_vector(0 to 7);
      Dbg_Capture_13 : out std_logic;
      Dbg_Shift_13 : out std_logic;
      Dbg_Update_13 : out std_logic;
      Dbg_Rst_13 : out std_logic;
      Dbg_Clk_14 : out std_logic;
      Dbg_TDI_14 : out std_logic;
      Dbg_TDO_14 : in std_logic;
      Dbg_Reg_En_14 : out std_logic_vector(0 to 7);
      Dbg_Capture_14 : out std_logic;
      Dbg_Shift_14 : out std_logic;
      Dbg_Update_14 : out std_logic;
      Dbg_Rst_14 : out std_logic;
      Dbg_Clk_15 : out std_logic;
      Dbg_TDI_15 : out std_logic;
      Dbg_TDO_15 : in std_logic;
      Dbg_Reg_En_15 : out std_logic_vector(0 to 7);
      Dbg_Capture_15 : out std_logic;
      Dbg_Shift_15 : out std_logic;
      Dbg_Update_15 : out std_logic;
      Dbg_Rst_15 : out std_logic;
      Dbg_Clk_16 : out std_logic;
      Dbg_TDI_16 : out std_logic;
      Dbg_TDO_16 : in std_logic;
      Dbg_Reg_En_16 : out std_logic_vector(0 to 7);
      Dbg_Capture_16 : out std_logic;
      Dbg_Shift_16 : out std_logic;
      Dbg_Update_16 : out std_logic;
      Dbg_Rst_16 : out std_logic;
      Dbg_Clk_17 : out std_logic;
      Dbg_TDI_17 : out std_logic;
      Dbg_TDO_17 : in std_logic;
      Dbg_Reg_En_17 : out std_logic_vector(0 to 7);
      Dbg_Capture_17 : out std_logic;
      Dbg_Shift_17 : out std_logic;
      Dbg_Update_17 : out std_logic;
      Dbg_Rst_17 : out std_logic;
      Dbg_Clk_18 : out std_logic;
      Dbg_TDI_18 : out std_logic;
      Dbg_TDO_18 : in std_logic;
      Dbg_Reg_En_18 : out std_logic_vector(0 to 7);
      Dbg_Capture_18 : out std_logic;
      Dbg_Shift_18 : out std_logic;
      Dbg_Update_18 : out std_logic;
      Dbg_Rst_18 : out std_logic;
      Dbg_Clk_19 : out std_logic;
      Dbg_TDI_19 : out std_logic;
      Dbg_TDO_19 : in std_logic;
      Dbg_Reg_En_19 : out std_logic_vector(0 to 7);
      Dbg_Capture_19 : out std_logic;
      Dbg_Shift_19 : out std_logic;
      Dbg_Update_19 : out std_logic;
      Dbg_Rst_19 : out std_logic;
      Dbg_Clk_20 : out std_logic;
      Dbg_TDI_20 : out std_logic;
      Dbg_TDO_20 : in std_logic;
      Dbg_Reg_En_20 : out std_logic_vector(0 to 7);
      Dbg_Capture_20 : out std_logic;
      Dbg_Shift_20 : out std_logic;
      Dbg_Update_20 : out std_logic;
      Dbg_Rst_20 : out std_logic;
      Dbg_Clk_21 : out std_logic;
      Dbg_TDI_21 : out std_logic;
      Dbg_TDO_21 : in std_logic;
      Dbg_Reg_En_21 : out std_logic_vector(0 to 7);
      Dbg_Capture_21 : out std_logic;
      Dbg_Shift_21 : out std_logic;
      Dbg_Update_21 : out std_logic;
      Dbg_Rst_21 : out std_logic;
      Dbg_Clk_22 : out std_logic;
      Dbg_TDI_22 : out std_logic;
      Dbg_TDO_22 : in std_logic;
      Dbg_Reg_En_22 : out std_logic_vector(0 to 7);
      Dbg_Capture_22 : out std_logic;
      Dbg_Shift_22 : out std_logic;
      Dbg_Update_22 : out std_logic;
      Dbg_Rst_22 : out std_logic;
      Dbg_Clk_23 : out std_logic;
      Dbg_TDI_23 : out std_logic;
      Dbg_TDO_23 : in std_logic;
      Dbg_Reg_En_23 : out std_logic_vector(0 to 7);
      Dbg_Capture_23 : out std_logic;
      Dbg_Shift_23 : out std_logic;
      Dbg_Update_23 : out std_logic;
      Dbg_Rst_23 : out std_logic;
      Dbg_Clk_24 : out std_logic;
      Dbg_TDI_24 : out std_logic;
      Dbg_TDO_24 : in std_logic;
      Dbg_Reg_En_24 : out std_logic_vector(0 to 7);
      Dbg_Capture_24 : out std_logic;
      Dbg_Shift_24 : out std_logic;
      Dbg_Update_24 : out std_logic;
      Dbg_Rst_24 : out std_logic;
      Dbg_Clk_25 : out std_logic;
      Dbg_TDI_25 : out std_logic;
      Dbg_TDO_25 : in std_logic;
      Dbg_Reg_En_25 : out std_logic_vector(0 to 7);
      Dbg_Capture_25 : out std_logic;
      Dbg_Shift_25 : out std_logic;
      Dbg_Update_25 : out std_logic;
      Dbg_Rst_25 : out std_logic;
      Dbg_Clk_26 : out std_logic;
      Dbg_TDI_26 : out std_logic;
      Dbg_TDO_26 : in std_logic;
      Dbg_Reg_En_26 : out std_logic_vector(0 to 7);
      Dbg_Capture_26 : out std_logic;
      Dbg_Shift_26 : out std_logic;
      Dbg_Update_26 : out std_logic;
      Dbg_Rst_26 : out std_logic;
      Dbg_Clk_27 : out std_logic;
      Dbg_TDI_27 : out std_logic;
      Dbg_TDO_27 : in std_logic;
      Dbg_Reg_En_27 : out std_logic_vector(0 to 7);
      Dbg_Capture_27 : out std_logic;
      Dbg_Shift_27 : out std_logic;
      Dbg_Update_27 : out std_logic;
      Dbg_Rst_27 : out std_logic;
      Dbg_Clk_28 : out std_logic;
      Dbg_TDI_28 : out std_logic;
      Dbg_TDO_28 : in std_logic;
      Dbg_Reg_En_28 : out std_logic_vector(0 to 7);
      Dbg_Capture_28 : out std_logic;
      Dbg_Shift_28 : out std_logic;
      Dbg_Update_28 : out std_logic;
      Dbg_Rst_28 : out std_logic;
      Dbg_Clk_29 : out std_logic;
      Dbg_TDI_29 : out std_logic;
      Dbg_TDO_29 : in std_logic;
      Dbg_Reg_En_29 : out std_logic_vector(0 to 7);
      Dbg_Capture_29 : out std_logic;
      Dbg_Shift_29 : out std_logic;
      Dbg_Update_29 : out std_logic;
      Dbg_Rst_29 : out std_logic;
      Dbg_Clk_30 : out std_logic;
      Dbg_TDI_30 : out std_logic;
      Dbg_TDO_30 : in std_logic;
      Dbg_Reg_En_30 : out std_logic_vector(0 to 7);
      Dbg_Capture_30 : out std_logic;
      Dbg_Shift_30 : out std_logic;
      Dbg_Update_30 : out std_logic;
      Dbg_Rst_30 : out std_logic;
      Dbg_Clk_31 : out std_logic;
      Dbg_TDI_31 : out std_logic;
      Dbg_TDO_31 : in std_logic;
      Dbg_Reg_En_31 : out std_logic_vector(0 to 7);
      Dbg_Capture_31 : out std_logic;
      Dbg_Shift_31 : out std_logic;
      Dbg_Update_31 : out std_logic;
      Dbg_Rst_31 : out std_logic;
      bscan_tdi : out std_logic;
      bscan_reset : out std_logic;
      bscan_shift : out std_logic;
      bscan_update : out std_logic;
      bscan_capture : out std_logic;
      bscan_sel1 : out std_logic;
      bscan_drck1 : out std_logic;
      bscan_tdo1 : in std_logic;
      bscan_ext_tdi : in std_logic;
      bscan_ext_reset : in std_logic;
      bscan_ext_shift : in std_logic;
      bscan_ext_update : in std_logic;
      bscan_ext_capture : in std_logic;
      bscan_ext_sel : in std_logic;
      bscan_ext_drck : in std_logic;
      bscan_ext_tdo : out std_logic;
      Ext_JTAG_DRCK : out std_logic;
      Ext_JTAG_RESET : out std_logic;
      Ext_JTAG_SEL : out std_logic;
      Ext_JTAG_CAPTURE : out std_logic;
      Ext_JTAG_SHIFT : out std_logic;
      Ext_JTAG_UPDATE : out std_logic;
      Ext_JTAG_TDI : out std_logic;
      Ext_JTAG_TDO : in std_logic
    );
  end component;

  component system_clock_generator_0_wrapper is
    port (
      CLKIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBIN : in std_logic;
      CLKFBOUT : out std_logic;
      PSCLK : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSDONE : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

  component system_axi4lite_0_wrapper is
    port (
      INTERCONNECT_ACLK : in std_logic;
      INTERCONNECT_ARESETN : in std_logic;
      S_AXI_ARESET_OUT_N : out std_logic_vector(0 to 0);
      M_AXI_ARESET_OUT_N : out std_logic_vector(6 downto 0);
      IRQ : out std_logic;
      S_AXI_ACLK : in std_logic_vector(0 to 0);
      S_AXI_AWID : in std_logic_vector(0 to 0);
      S_AXI_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_AWLEN : in std_logic_vector(7 downto 0);
      S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
      S_AXI_AWBURST : in std_logic_vector(1 downto 0);
      S_AXI_AWLOCK : in std_logic_vector(1 downto 0);
      S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
      S_AXI_AWPROT : in std_logic_vector(2 downto 0);
      S_AXI_AWQOS : in std_logic_vector(3 downto 0);
      S_AXI_AWUSER : in std_logic_vector(0 to 0);
      S_AXI_AWVALID : in std_logic_vector(0 to 0);
      S_AXI_AWREADY : out std_logic_vector(0 to 0);
      S_AXI_WID : in std_logic_vector(0 to 0);
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WLAST : in std_logic_vector(0 to 0);
      S_AXI_WUSER : in std_logic_vector(0 to 0);
      S_AXI_WVALID : in std_logic_vector(0 to 0);
      S_AXI_WREADY : out std_logic_vector(0 to 0);
      S_AXI_BID : out std_logic_vector(0 to 0);
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BUSER : out std_logic_vector(0 to 0);
      S_AXI_BVALID : out std_logic_vector(0 to 0);
      S_AXI_BREADY : in std_logic_vector(0 to 0);
      S_AXI_ARID : in std_logic_vector(0 to 0);
      S_AXI_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_ARLEN : in std_logic_vector(7 downto 0);
      S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
      S_AXI_ARBURST : in std_logic_vector(1 downto 0);
      S_AXI_ARLOCK : in std_logic_vector(1 downto 0);
      S_AXI_ARCACHE : in std_logic_vector(3 downto 0);
      S_AXI_ARPROT : in std_logic_vector(2 downto 0);
      S_AXI_ARQOS : in std_logic_vector(3 downto 0);
      S_AXI_ARUSER : in std_logic_vector(0 to 0);
      S_AXI_ARVALID : in std_logic_vector(0 to 0);
      S_AXI_ARREADY : out std_logic_vector(0 to 0);
      S_AXI_RID : out std_logic_vector(0 to 0);
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RLAST : out std_logic_vector(0 to 0);
      S_AXI_RUSER : out std_logic_vector(0 to 0);
      S_AXI_RVALID : out std_logic_vector(0 to 0);
      S_AXI_RREADY : in std_logic_vector(0 to 0);
      M_AXI_ACLK : in std_logic_vector(6 downto 0);
      M_AXI_AWID : out std_logic_vector(6 downto 0);
      M_AXI_AWADDR : out std_logic_vector(223 downto 0);
      M_AXI_AWLEN : out std_logic_vector(55 downto 0);
      M_AXI_AWSIZE : out std_logic_vector(20 downto 0);
      M_AXI_AWBURST : out std_logic_vector(13 downto 0);
      M_AXI_AWLOCK : out std_logic_vector(13 downto 0);
      M_AXI_AWCACHE : out std_logic_vector(27 downto 0);
      M_AXI_AWPROT : out std_logic_vector(20 downto 0);
      M_AXI_AWREGION : out std_logic_vector(27 downto 0);
      M_AXI_AWQOS : out std_logic_vector(27 downto 0);
      M_AXI_AWUSER : out std_logic_vector(6 downto 0);
      M_AXI_AWVALID : out std_logic_vector(6 downto 0);
      M_AXI_AWREADY : in std_logic_vector(6 downto 0);
      M_AXI_WID : out std_logic_vector(6 downto 0);
      M_AXI_WDATA : out std_logic_vector(223 downto 0);
      M_AXI_WSTRB : out std_logic_vector(27 downto 0);
      M_AXI_WLAST : out std_logic_vector(6 downto 0);
      M_AXI_WUSER : out std_logic_vector(6 downto 0);
      M_AXI_WVALID : out std_logic_vector(6 downto 0);
      M_AXI_WREADY : in std_logic_vector(6 downto 0);
      M_AXI_BID : in std_logic_vector(6 downto 0);
      M_AXI_BRESP : in std_logic_vector(13 downto 0);
      M_AXI_BUSER : in std_logic_vector(6 downto 0);
      M_AXI_BVALID : in std_logic_vector(6 downto 0);
      M_AXI_BREADY : out std_logic_vector(6 downto 0);
      M_AXI_ARID : out std_logic_vector(6 downto 0);
      M_AXI_ARADDR : out std_logic_vector(223 downto 0);
      M_AXI_ARLEN : out std_logic_vector(55 downto 0);
      M_AXI_ARSIZE : out std_logic_vector(20 downto 0);
      M_AXI_ARBURST : out std_logic_vector(13 downto 0);
      M_AXI_ARLOCK : out std_logic_vector(13 downto 0);
      M_AXI_ARCACHE : out std_logic_vector(27 downto 0);
      M_AXI_ARPROT : out std_logic_vector(20 downto 0);
      M_AXI_ARREGION : out std_logic_vector(27 downto 0);
      M_AXI_ARQOS : out std_logic_vector(27 downto 0);
      M_AXI_ARUSER : out std_logic_vector(6 downto 0);
      M_AXI_ARVALID : out std_logic_vector(6 downto 0);
      M_AXI_ARREADY : in std_logic_vector(6 downto 0);
      M_AXI_RID : in std_logic_vector(6 downto 0);
      M_AXI_RDATA : in std_logic_vector(223 downto 0);
      M_AXI_RRESP : in std_logic_vector(13 downto 0);
      M_AXI_RLAST : in std_logic_vector(6 downto 0);
      M_AXI_RUSER : in std_logic_vector(6 downto 0);
      M_AXI_RVALID : in std_logic_vector(6 downto 0);
      M_AXI_RREADY : out std_logic_vector(6 downto 0);
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic;
      INTERCONNECT_ARESET_OUT_N : out std_logic;
      DEBUG_AW_TRANS_SEQ : out std_logic_vector(7 downto 0);
      DEBUG_AW_ARB_GRANT : out std_logic_vector(7 downto 0);
      DEBUG_AR_TRANS_SEQ : out std_logic_vector(7 downto 0);
      DEBUG_AR_ARB_GRANT : out std_logic_vector(7 downto 0);
      DEBUG_AW_TRANS_QUAL : out std_logic_vector(0 to 0);
      DEBUG_AW_ACCEPT_CNT : out std_logic_vector(7 downto 0);
      DEBUG_AW_ACTIVE_THREAD : out std_logic_vector(15 downto 0);
      DEBUG_AW_ACTIVE_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_AW_ACTIVE_REGION : out std_logic_vector(7 downto 0);
      DEBUG_AW_ERROR : out std_logic_vector(7 downto 0);
      DEBUG_AW_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_AR_TRANS_QUAL : out std_logic_vector(0 to 0);
      DEBUG_AR_ACCEPT_CNT : out std_logic_vector(7 downto 0);
      DEBUG_AR_ACTIVE_THREAD : out std_logic_vector(15 downto 0);
      DEBUG_AR_ACTIVE_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_AR_ACTIVE_REGION : out std_logic_vector(7 downto 0);
      DEBUG_AR_ERROR : out std_logic_vector(7 downto 0);
      DEBUG_AR_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_B_TRANS_SEQ : out std_logic_vector(7 downto 0);
      DEBUG_R_BEAT_CNT : out std_logic_vector(7 downto 0);
      DEBUG_R_TRANS_SEQ : out std_logic_vector(7 downto 0);
      DEBUG_AW_ISSUING_CNT : out std_logic_vector(7 downto 0);
      DEBUG_AR_ISSUING_CNT : out std_logic_vector(7 downto 0);
      DEBUG_W_BEAT_CNT : out std_logic_vector(7 downto 0);
      DEBUG_W_TRANS_SEQ : out std_logic_vector(7 downto 0);
      DEBUG_BID_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_BID_ERROR : out std_logic;
      DEBUG_RID_TARGET : out std_logic_vector(7 downto 0);
      DEBUG_RID_ERROR : out std_logic;
      DEBUG_SR_SC_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_SR_SC_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SR_SC_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_SR_SC_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SR_SC_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_SR_SC_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_SR_SC_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_SR_SC_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_SR_SC_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_SC_SF_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_SC_SF_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SC_SF_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_SC_SF_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SC_SF_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_SC_SF_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_SC_SF_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_SC_SF_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_SC_SF_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_SF_CB_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_SF_CB_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SF_CB_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_SF_CB_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_SF_CB_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_SF_CB_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_SF_CB_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_SF_CB_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_SF_CB_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_CB_MF_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_CB_MF_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_CB_MF_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_CB_MF_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_CB_MF_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_CB_MF_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_CB_MF_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_CB_MF_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_CB_MF_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_MF_MC_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_MF_MC_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MF_MC_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_MF_MC_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MF_MC_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_MF_MC_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_MF_MC_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_MF_MC_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_MF_MC_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_MC_MP_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_MC_MP_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MC_MP_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_MC_MP_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MC_MP_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_MC_MP_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_MC_MP_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_MC_MP_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_MC_MP_WDATACONTROL : out std_logic_vector(6 downto 0);
      DEBUG_MP_MR_ARADDR : out std_logic_vector(31 downto 0);
      DEBUG_MP_MR_ARADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MP_MR_AWADDR : out std_logic_vector(31 downto 0);
      DEBUG_MP_MR_AWADDRCONTROL : out std_logic_vector(23 downto 0);
      DEBUG_MP_MR_BRESP : out std_logic_vector(4 downto 0);
      DEBUG_MP_MR_RDATA : out std_logic_vector(31 downto 0);
      DEBUG_MP_MR_RDATACONTROL : out std_logic_vector(5 downto 0);
      DEBUG_MP_MR_WDATA : out std_logic_vector(31 downto 0);
      DEBUG_MP_MR_WDATACONTROL : out std_logic_vector(6 downto 0)
    );
  end component;

  component system_rs232_wrapper is
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      Interrupt : out std_logic;
      S_AXI_AWADDR : in std_logic_vector(3 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(3 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      RX : in std_logic;
      TX : out std_logic
    );
  end component;

  component system_generic_spi_wrapper is
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      SCK_I : in std_logic;
      SCK_O : out std_logic;
      SCK_T : out std_logic;
      MISO_I : in std_logic;
      MISO_O : out std_logic;
      MISO_T : out std_logic;
      MOSI_I : in std_logic;
      MOSI_O : out std_logic;
      MOSI_T : out std_logic;
      SPISEL : in std_logic;
      SS_I : in std_logic_vector(0 downto 0);
      SS_O : out std_logic_vector(0 downto 0);
      SS_T : out std_logic;
      IP2INTC_Irpt : out std_logic
    );
  end component;

  component system_axi_gpio_0_wrapper is
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector(8 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(8 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(7 downto 0);
      GPIO_IO_O : out std_logic_vector(7 downto 0);
      GPIO_IO_T : out std_logic_vector(7 downto 0);
      GPIO2_IO_I : in std_logic_vector(7 downto 0);
      GPIO2_IO_O : out std_logic_vector(7 downto 0);
      GPIO2_IO_T : out std_logic_vector(7 downto 0)
    );
  end component;

  component system_axi_plbv46_bridge_0_wrapper is
    port (
      S_AXI_AWID : in std_logic_vector(0 downto 0);
      S_AXI_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_AWLEN : in std_logic_vector(7 downto 0);
      S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
      S_AXI_AWBURST : in std_logic_vector(1 downto 0);
      S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WLAST : in std_logic;
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BID : out std_logic_vector(0 downto 0);
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARID : in std_logic_vector(0 downto 0);
      S_AXI_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_ARLEN : in std_logic_vector(7 downto 0);
      S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
      S_AXI_ARBURST : in std_logic_vector(1 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RID : out std_logic_vector(0 downto 0);
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RLAST : out std_logic;
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector(31 downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_CTRL_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_RVALID : out std_logic;
      S_AXI_CTRL_RREADY : in std_logic;
      MPLB_Clk : in std_logic;
      MPLB_Rst : in std_logic;
      Bridge_Interrupt : out std_logic;
      MD_Error : out std_logic;
      M_request : out std_logic;
      M_priority : out std_logic_vector(0 to 1);
      M_busLock : out std_logic;
      M_RNW : out std_logic;
      M_BE : out std_logic_vector(0 to 7);
      M_MSize : out std_logic_vector(0 to 1);
      M_size : out std_logic_vector(0 to 3);
      M_type : out std_logic_vector(0 to 2);
      M_ABus : out std_logic_vector(0 to 31);
      M_wrBurst : out std_logic;
      M_rdBurst : out std_logic;
      M_wrDBus : out std_logic_vector(0 to 63);
      PLB_MAddrAck : in std_logic;
      PLB_MSSize : in std_logic_vector(0 to 1);
      PLB_MRearbitrate : in std_logic;
      PLB_MTimeout : in std_logic;
      PLB_MRdErr : in std_logic;
      PLB_MWrErr : in std_logic;
      PLB_MRdDBus : in std_logic_vector(0 to 63);
      PLB_MRdDAck : in std_logic;
      PLB_MRdBTerm : in std_logic;
      PLB_MWrDAck : in std_logic;
      PLB_MWrBTerm : in std_logic;
      PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      M_TAttribute : out std_logic_vector(0 to 15);
      M_lockErr : out std_logic;
      M_abort : out std_logic;
      M_UABus : out std_logic_vector(0 to 31);
      PLB_MBusy : in std_logic;
      PLB_MIRQ : in std_logic
    );
  end component;

  component system_axi_timer_0_wrapper is
    port (
      CaptureTrig0 : in std_logic;
      CaptureTrig1 : in std_logic;
      GenerateOut0 : out std_logic;
      GenerateOut1 : out std_logic;
      PWM0 : out std_logic;
      Interrupt : out std_logic;
      Freeze : in std_logic;
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector(4 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(4 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic
    );
  end component;

  component system_plb_v46_0_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 1);
      MPLB_Rst : out std_logic_vector(0 to 1);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_UABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 15);
      M_RNW : in std_logic_vector(0 to 1);
      M_abort : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_TAttribute : in std_logic_vector(0 to 31);
      M_lockErr : in std_logic_vector(0 to 1);
      M_MSize : in std_logic_vector(0 to 3);
      M_priority : in std_logic_vector(0 to 3);
      M_rdBurst : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_size : in std_logic_vector(0 to 7);
      M_type : in std_logic_vector(0 to 5);
      M_wrBurst : in std_logic_vector(0 to 1);
      M_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : in std_logic_vector(0 to 1);
      Sl_MRdErr : in std_logic_vector(0 to 3);
      Sl_MWrErr : in std_logic_vector(0 to 3);
      Sl_MBusy : in std_logic_vector(0 to 3);
      Sl_rdBTerm : in std_logic_vector(0 to 1);
      Sl_rdComp : in std_logic_vector(0 to 1);
      Sl_rdDAck : in std_logic_vector(0 to 1);
      Sl_rdDBus : in std_logic_vector(0 to 127);
      Sl_rdWdAddr : in std_logic_vector(0 to 7);
      Sl_rearbitrate : in std_logic_vector(0 to 1);
      Sl_SSize : in std_logic_vector(0 to 3);
      Sl_wait : in std_logic_vector(0 to 1);
      Sl_wrBTerm : in std_logic_vector(0 to 1);
      Sl_wrComp : in std_logic_vector(0 to 1);
      Sl_wrDAck : in std_logic_vector(0 to 1);
      Sl_MIRQ : in std_logic_vector(0 to 3);
      PLB_MIRQ : out std_logic_vector(0 to 1);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 1);
      PLB_MTimeout : out std_logic_vector(0 to 1);
      PLB_MBusy : out std_logic_vector(0 to 1);
      PLB_MRdErr : out std_logic_vector(0 to 1);
      PLB_MWrErr : out std_logic_vector(0 to 1);
      PLB_MRdBTerm : out std_logic_vector(0 to 1);
      PLB_MRdDAck : out std_logic_vector(0 to 1);
      PLB_MRdDBus : out std_logic_vector(0 to 127);
      PLB_MRdWdAddr : out std_logic_vector(0 to 7);
      PLB_MRearbitrate : out std_logic_vector(0 to 1);
      PLB_MWrBTerm : out std_logic_vector(0 to 1);
      PLB_MWrDAck : out std_logic_vector(0 to 1);
      PLB_MSSize : out std_logic_vector(0 to 3);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 1);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic_vector(0 to 1);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 1);
      PLB_SMWrErr : out std_logic_vector(0 to 1);
      PLB_SMBusy : out std_logic_vector(0 to 1);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component system_xps_tft_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      MPLB_Clk : in std_logic;
      MPLB_Rst : in std_logic;
      MD_error : out std_logic;
      IP2INTC_Irpt : out std_logic;
      M_request : out std_logic;
      M_priority : out std_logic_vector(0 to 1);
      M_busLock : out std_logic;
      M_RNW : out std_logic;
      M_BE : out std_logic_vector(0 to 7);
      M_MSize : out std_logic_vector(0 to 1);
      M_size : out std_logic_vector(0 to 3);
      M_type : out std_logic_vector(0 to 2);
      M_ABus : out std_logic_vector(0 to 31);
      M_wrBurst : out std_logic;
      M_rdBurst : out std_logic;
      M_wrDBus : out std_logic_vector(0 to 63);
      PLB_MSSize : in std_logic_vector(0 to 1);
      PLB_MAddrAck : in std_logic;
      PLB_MRearbitrate : in std_logic;
      PLB_MTimeout : in std_logic;
      PLB_MRdErr : in std_logic;
      PLB_MWrErr : in std_logic;
      PLB_MRdDBus : in std_logic_vector(0 to 63);
      PLB_MRdDAck : in std_logic;
      PLB_MWrDAck : in std_logic;
      PLB_MRdBTerm : in std_logic;
      PLB_MWrBTerm : in std_logic;
      M_TAttribute : out std_logic_vector(0 to 15);
      M_lockErr : out std_logic;
      M_abort : out std_logic;
      M_UABus : out std_logic_vector(0 to 31);
      PLB_MBusy : in std_logic;
      PLB_MIRQ : in std_logic;
      PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 63);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      DCR_Clk : in std_logic;
      DCR_Rst : in std_logic;
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_Sl_DBus : in std_logic_vector(0 to 31);
      Sl_DCRDBus : out std_logic_vector(0 to 31);
      Sl_DCRAck : out std_logic;
      SYS_TFT_Clk : in std_logic;
      TFT_HSYNC : out std_logic;
      TFT_VSYNC : out std_logic;
      TFT_DE : out std_logic;
      TFT_DPS : out std_logic;
      TFT_VGA_CLK : out std_logic;
      TFT_VGA_R : out std_logic_vector(5 downto 0);
      TFT_VGA_G : out std_logic_vector(5 downto 0);
      TFT_VGA_B : out std_logic_vector(5 downto 0);
      TFT_DVI_CLK_P : out std_logic;
      TFT_DVI_CLK_N : out std_logic;
      TFT_DVI_DATA : out std_logic_vector(11 downto 0);
      TFT_IIC_SCL_I : in std_logic;
      TFT_IIC_SCL_O : out std_logic;
      TFT_IIC_SCL_T : out std_logic;
      TFT_IIC_SDA_I : in std_logic;
      TFT_IIC_SDA_O : out std_logic;
      TFT_IIC_SDA_T : out std_logic
    );
  end component;

  component system_xps_mch_emc_0_wrapper is
    port (
      MCH_SPLB_Clk : in std_logic;
      RdClk : in std_logic;
      MCH_SPLB_Rst : in std_logic;
      MCH0_Access_Control : in std_logic;
      MCH0_Access_Data : in std_logic_vector(0 to 31);
      MCH0_Access_Write : in std_logic;
      MCH0_Access_Full : out std_logic;
      MCH0_ReadData_Control : out std_logic;
      MCH0_ReadData_Data : out std_logic_vector(0 to 31);
      MCH0_ReadData_Read : in std_logic;
      MCH0_ReadData_Exists : out std_logic;
      MCH1_Access_Control : in std_logic;
      MCH1_Access_Data : in std_logic_vector(0 to 31);
      MCH1_Access_Write : in std_logic;
      MCH1_Access_Full : out std_logic;
      MCH1_ReadData_Control : out std_logic;
      MCH1_ReadData_Data : out std_logic_vector(0 to 31);
      MCH1_ReadData_Read : in std_logic;
      MCH1_ReadData_Exists : out std_logic;
      MCH2_Access_Control : in std_logic;
      MCH2_Access_Data : in std_logic_vector(0 to 31);
      MCH2_Access_Write : in std_logic;
      MCH2_Access_Full : out std_logic;
      MCH2_ReadData_Control : out std_logic;
      MCH2_ReadData_Data : out std_logic_vector(0 to 31);
      MCH2_ReadData_Read : in std_logic;
      MCH2_ReadData_Exists : out std_logic;
      MCH3_Access_Control : in std_logic;
      MCH3_Access_Data : in std_logic_vector(0 to 31);
      MCH3_Access_Write : in std_logic;
      MCH3_Access_Full : out std_logic;
      MCH3_ReadData_Control : out std_logic;
      MCH3_ReadData_Data : out std_logic_vector(0 to 31);
      MCH3_ReadData_Read : in std_logic;
      MCH3_ReadData_Exists : out std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      Mem_DQ_I : in std_logic_vector(0 to 15);
      Mem_DQ_O : out std_logic_vector(0 to 15);
      Mem_DQ_T : out std_logic_vector(0 to 15);
      Mem_A : out std_logic_vector(0 to 31);
      Mem_RPN : out std_logic;
      Mem_CEN : out std_logic_vector(0 to 0);
      Mem_OEN : out std_logic_vector(0 to 0);
      Mem_WEN : out std_logic;
      Mem_QWEN : out std_logic_vector(0 to 1);
      Mem_BEN : out std_logic_vector(0 to 1);
      Mem_CE : out std_logic_vector(0 to 0);
      Mem_ADV_LDN : out std_logic;
      Mem_LBON : out std_logic;
      Mem_CKEN : out std_logic;
      Mem_RNW : out std_logic
    );
  end component;

  component system_axi_intc_0_wrapper is
    port (
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector(8 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector(31 downto 0);
      S_AXI_WSTRB : in std_logic_vector(3 downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector(8 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector(31 downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      Intr : in std_logic_vector(0 downto 0);
      Irq : out std_logic;
      Interrupt_address : out std_logic_vector(31 downto 0);
      Processor_ack : in std_logic_vector(1 downto 0);
      Processor_clk : in std_logic;
      Processor_rst : in std_logic;
      Interrupt_address_in : in std_logic_vector(31 downto 0);
      Processor_ack_out : out std_logic_vector(1 downto 0)
    );
  end component;

  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;

  -- Internal signals

  signal Ext_BRK : std_logic;
  signal Ext_NM_BRK : std_logic;
  signal RS232_Uart_1_sin : std_logic;
  signal RS232_Uart_1_sout : std_logic;
  signal SPI_FLASH_MISO_I : std_logic;
  signal SPI_FLASH_MISO_O : std_logic;
  signal SPI_FLASH_MISO_T : std_logic;
  signal SPI_FLASH_MOSI_I : std_logic;
  signal SPI_FLASH_MOSI_O : std_logic;
  signal SPI_FLASH_MOSI_T : std_logic;
  signal SPI_FLASH_SCLK_I : std_logic;
  signal SPI_FLASH_SCLK_O : std_logic;
  signal SPI_FLASH_SCLK_T : std_logic;
  signal SPI_FLASH_SS_I : std_logic_vector(0 to 0);
  signal SPI_FLASH_SS_O : std_logic_vector(0 to 0);
  signal SPI_FLASH_SS_T : std_logic;
  signal axi4lite_0_M_ARADDR : std_logic_vector(223 downto 0);
  signal axi4lite_0_M_ARBURST : std_logic_vector(13 downto 0);
  signal axi4lite_0_M_ARESETN : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_ARID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_ARLEN : std_logic_vector(55 downto 0);
  signal axi4lite_0_M_ARREADY : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_ARSIZE : std_logic_vector(20 downto 0);
  signal axi4lite_0_M_ARVALID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_AWADDR : std_logic_vector(223 downto 0);
  signal axi4lite_0_M_AWBURST : std_logic_vector(13 downto 0);
  signal axi4lite_0_M_AWCACHE : std_logic_vector(27 downto 0);
  signal axi4lite_0_M_AWID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_AWLEN : std_logic_vector(55 downto 0);
  signal axi4lite_0_M_AWREADY : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_AWSIZE : std_logic_vector(20 downto 0);
  signal axi4lite_0_M_AWVALID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_BID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_BREADY : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_BRESP : std_logic_vector(13 downto 0);
  signal axi4lite_0_M_BVALID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_RDATA : std_logic_vector(223 downto 0);
  signal axi4lite_0_M_RID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_RLAST : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_RREADY : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_RRESP : std_logic_vector(13 downto 0);
  signal axi4lite_0_M_RVALID : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_WDATA : std_logic_vector(223 downto 0);
  signal axi4lite_0_M_WLAST : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_WREADY : std_logic_vector(6 downto 0);
  signal axi4lite_0_M_WSTRB : std_logic_vector(27 downto 0);
  signal axi4lite_0_M_WVALID : std_logic_vector(6 downto 0);
  signal axi4lite_0_S_ARADDR : std_logic_vector(31 downto 0);
  signal axi4lite_0_S_ARBURST : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_ARCACHE : std_logic_vector(3 downto 0);
  signal axi4lite_0_S_ARID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_ARLEN : std_logic_vector(7 downto 0);
  signal axi4lite_0_S_ARLOCK : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_ARPROT : std_logic_vector(2 downto 0);
  signal axi4lite_0_S_ARQOS : std_logic_vector(3 downto 0);
  signal axi4lite_0_S_ARREADY : std_logic_vector(0 to 0);
  signal axi4lite_0_S_ARSIZE : std_logic_vector(2 downto 0);
  signal axi4lite_0_S_ARVALID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_AWADDR : std_logic_vector(31 downto 0);
  signal axi4lite_0_S_AWBURST : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_AWCACHE : std_logic_vector(3 downto 0);
  signal axi4lite_0_S_AWID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_AWLEN : std_logic_vector(7 downto 0);
  signal axi4lite_0_S_AWLOCK : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_AWPROT : std_logic_vector(2 downto 0);
  signal axi4lite_0_S_AWQOS : std_logic_vector(3 downto 0);
  signal axi4lite_0_S_AWREADY : std_logic_vector(0 to 0);
  signal axi4lite_0_S_AWSIZE : std_logic_vector(2 downto 0);
  signal axi4lite_0_S_AWVALID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_BID : std_logic_vector(0 downto 0);
  signal axi4lite_0_S_BREADY : std_logic_vector(0 to 0);
  signal axi4lite_0_S_BRESP : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_BVALID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_RDATA : std_logic_vector(31 downto 0);
  signal axi4lite_0_S_RID : std_logic_vector(0 downto 0);
  signal axi4lite_0_S_RLAST : std_logic_vector(0 to 0);
  signal axi4lite_0_S_RREADY : std_logic_vector(0 to 0);
  signal axi4lite_0_S_RRESP : std_logic_vector(1 downto 0);
  signal axi4lite_0_S_RVALID : std_logic_vector(0 to 0);
  signal axi4lite_0_S_WDATA : std_logic_vector(31 downto 0);
  signal axi4lite_0_S_WLAST : std_logic_vector(0 to 0);
  signal axi4lite_0_S_WREADY : std_logic_vector(0 to 0);
  signal axi4lite_0_S_WSTRB : std_logic_vector(3 downto 0);
  signal axi4lite_0_S_WVALID : std_logic_vector(0 to 0);
  signal axi_gpio_0_GPIO2_IO_I : std_logic_vector(7 downto 0);
  signal axi_gpio_0_GPIO2_IO_O : std_logic_vector(7 downto 0);
  signal axi_gpio_0_GPIO2_IO_T : std_logic_vector(7 downto 0);
  signal axi_gpio_0_GPIO_IO_I : std_logic_vector(7 downto 0);
  signal axi_gpio_0_GPIO_IO_O : std_logic_vector(7 downto 0);
  signal axi_gpio_0_GPIO_IO_T : std_logic_vector(7 downto 0);
  signal axi_intc_0_INTERRUPT_Interrupt : std_logic;
  signal axi_intc_0_INTERRUPT_Interrupt_Ack : std_logic_vector(1 downto 0);
  signal axi_intc_0_INTERRUPT_Interrupt_Address : std_logic_vector(0 to 31);
  signal axi_timer_0_Interrupt : std_logic_vector(0 downto 0);
  signal clk_100_0000MHz : std_logic_vector(0 to 0);
  signal clock_generator_0_CLKOUT1 : std_logic;
  signal clock_generator_0_CLKOUT2 : std_logic;
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr : std_logic_vector(0 to 31);
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk : std_logic;
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din : std_logic_vector(0 to 31);
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout : std_logic_vector(0 to 31);
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN : std_logic;
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst : std_logic;
  signal microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN : std_logic_vector(0 to 3);
  signal microblaze_0_debug_Dbg_Capture : std_logic;
  signal microblaze_0_debug_Dbg_Clk : std_logic;
  signal microblaze_0_debug_Dbg_Reg_En : std_logic_vector(0 to 7);
  signal microblaze_0_debug_Dbg_Shift : std_logic;
  signal microblaze_0_debug_Dbg_TDI : std_logic;
  signal microblaze_0_debug_Dbg_TDO : std_logic;
  signal microblaze_0_debug_Dbg_Update : std_logic;
  signal microblaze_0_debug_Debug_Rst : std_logic;
  signal microblaze_0_dlmb_LMB_ABus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_LMB_AddrStrobe : std_logic;
  signal microblaze_0_dlmb_LMB_BE : std_logic_vector(0 to 3);
  signal microblaze_0_dlmb_LMB_CE : std_logic;
  signal microblaze_0_dlmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_LMB_ReadStrobe : std_logic;
  signal microblaze_0_dlmb_LMB_Ready : std_logic;
  signal microblaze_0_dlmb_LMB_Rst : std_logic;
  signal microblaze_0_dlmb_LMB_UE : std_logic;
  signal microblaze_0_dlmb_LMB_Wait : std_logic;
  signal microblaze_0_dlmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_LMB_WriteStrobe : std_logic;
  signal microblaze_0_dlmb_M_ABus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_M_AddrStrobe : std_logic;
  signal microblaze_0_dlmb_M_BE : std_logic_vector(0 to 3);
  signal microblaze_0_dlmb_M_DBus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_M_ReadStrobe : std_logic;
  signal microblaze_0_dlmb_M_WriteStrobe : std_logic;
  signal microblaze_0_dlmb_Sl_CE : std_logic_vector(0 to 0);
  signal microblaze_0_dlmb_Sl_DBus : std_logic_vector(0 to 31);
  signal microblaze_0_dlmb_Sl_Ready : std_logic_vector(0 to 0);
  signal microblaze_0_dlmb_Sl_UE : std_logic_vector(0 to 0);
  signal microblaze_0_dlmb_Sl_Wait : std_logic_vector(0 to 0);
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr : std_logic_vector(0 to 31);
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk : std_logic;
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din : std_logic_vector(0 to 31);
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout : std_logic_vector(0 to 31);
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN : std_logic;
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst : std_logic;
  signal microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN : std_logic_vector(0 to 3);
  signal microblaze_0_ilmb_LMB_ABus : std_logic_vector(0 to 31);
  signal microblaze_0_ilmb_LMB_AddrStrobe : std_logic;
  signal microblaze_0_ilmb_LMB_BE : std_logic_vector(0 to 3);
  signal microblaze_0_ilmb_LMB_CE : std_logic;
  signal microblaze_0_ilmb_LMB_ReadDBus : std_logic_vector(0 to 31);
  signal microblaze_0_ilmb_LMB_ReadStrobe : std_logic;
  signal microblaze_0_ilmb_LMB_Ready : std_logic;
  signal microblaze_0_ilmb_LMB_Rst : std_logic;
  signal microblaze_0_ilmb_LMB_UE : std_logic;
  signal microblaze_0_ilmb_LMB_Wait : std_logic;
  signal microblaze_0_ilmb_LMB_WriteDBus : std_logic_vector(0 to 31);
  signal microblaze_0_ilmb_LMB_WriteStrobe : std_logic;
  signal microblaze_0_ilmb_M_ABus : std_logic_vector(0 to 31);
  signal microblaze_0_ilmb_M_AddrStrobe : std_logic;
  signal microblaze_0_ilmb_M_ReadStrobe : std_logic;
  signal microblaze_0_ilmb_Sl_CE : std_logic_vector(0 to 0);
  signal microblaze_0_ilmb_Sl_DBus : std_logic_vector(0 to 31);
  signal microblaze_0_ilmb_Sl_Ready : std_logic_vector(0 to 0);
  signal microblaze_0_ilmb_Sl_UE : std_logic_vector(0 to 0);
  signal microblaze_0_ilmb_Sl_Wait : std_logic_vector(0 to 0);
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd7 : std_logic_vector(6 downto 0);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd16 : std_logic_vector(0 to 15);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_gnd4096 : std_logic_vector(0 to 4095);
  signal net_vcc0 : std_logic;
  signal pgassign1 : std_logic_vector(0 to 7);
  signal pgassign2 : std_logic_vector(0 to 0);
  signal pgassign3 : std_logic_vector(6 downto 0);
  signal pgassign4 : std_logic_vector(0 to 31);
  signal plb_v46_0_MPLB_Rst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_ABus : std_logic_vector(0 to 63);
  signal plb_v46_0_M_BE : std_logic_vector(0 to 15);
  signal plb_v46_0_M_MSize : std_logic_vector(0 to 3);
  signal plb_v46_0_M_RNW : std_logic_vector(0 to 1);
  signal plb_v46_0_M_TAttribute : std_logic_vector(0 to 31);
  signal plb_v46_0_M_UABus : std_logic_vector(0 to 63);
  signal plb_v46_0_M_abort : std_logic_vector(0 to 1);
  signal plb_v46_0_M_busLock : std_logic_vector(0 to 1);
  signal plb_v46_0_M_lockErr : std_logic_vector(0 to 1);
  signal plb_v46_0_M_priority : std_logic_vector(0 to 3);
  signal plb_v46_0_M_rdBurst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_request : std_logic_vector(0 to 1);
  signal plb_v46_0_M_size : std_logic_vector(0 to 7);
  signal plb_v46_0_M_type : std_logic_vector(0 to 5);
  signal plb_v46_0_M_wrBurst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_wrDBus : std_logic_vector(0 to 127);
  signal plb_v46_0_PLB_ABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_BE : std_logic_vector(0 to 7);
  signal plb_v46_0_PLB_MAddrAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MBusy : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MIRQ : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdDAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdDBus : std_logic_vector(0 to 127);
  signal plb_v46_0_PLB_MRdErr : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdWdAddr : std_logic_vector(0 to 7);
  signal plb_v46_0_PLB_MRearbitrate : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MSSize : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_MSize : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MTimeout : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrDAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrErr : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_PAValid : std_logic;
  signal plb_v46_0_PLB_RNW : std_logic;
  signal plb_v46_0_PLB_SAValid : std_logic;
  signal plb_v46_0_PLB_TAttribute : std_logic_vector(0 to 15);
  signal plb_v46_0_PLB_UABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_abort : std_logic;
  signal plb_v46_0_PLB_busLock : std_logic;
  signal plb_v46_0_PLB_lockErr : std_logic;
  signal plb_v46_0_PLB_masterID : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_rdBurst : std_logic;
  signal plb_v46_0_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_rdPendReq : std_logic;
  signal plb_v46_0_PLB_rdPrim : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_size : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_type : std_logic_vector(0 to 2);
  signal plb_v46_0_PLB_wrBurst : std_logic;
  signal plb_v46_0_PLB_wrDBus : std_logic_vector(0 to 63);
  signal plb_v46_0_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_wrPendReq : std_logic;
  signal plb_v46_0_PLB_wrPrim : std_logic_vector(0 to 1);
  signal plb_v46_0_SPLB_Rst : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_MBusy : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MIRQ : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MRdErr : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_MWrErr : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_SSize : std_logic_vector(0 to 3);
  signal plb_v46_0_Sl_addrAck : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_rdBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_rdComp : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_rdDAck : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_rdDBus : std_logic_vector(0 to 127);
  signal plb_v46_0_Sl_rdWdAddr : std_logic_vector(0 to 7);
  signal plb_v46_0_Sl_rearbitrate : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_wait : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_wrBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_wrComp : std_logic_vector(0 to 1);
  signal plb_v46_0_Sl_wrDAck : std_logic_vector(0 to 1);
  signal proc_sys_reset_0_BUS_STRUCT_RESET : std_logic_vector(0 to 0);
  signal proc_sys_reset_0_Dcm_locked : std_logic;
  signal proc_sys_reset_0_Interconnect_aresetn : std_logic_vector(0 to 0);
  signal proc_sys_reset_0_MB_Debug_Sys_Rst : std_logic;
  signal proc_sys_reset_0_MB_Reset : std_logic;
  signal proc_sys_reset_0_Peripheral_Reset : std_logic_vector(0 to 0);
  signal xps_mch_emc_0_Mem_A : std_logic_vector(22 downto 0);
  signal xps_mch_emc_0_Mem_BEN : std_logic_vector(0 to 1);
  signal xps_mch_emc_0_Mem_CEN : std_logic_vector(0 to 0);
  signal xps_mch_emc_0_Mem_DQ_I : std_logic_vector(0 to 15);
  signal xps_mch_emc_0_Mem_DQ_O : std_logic_vector(0 to 15);
  signal xps_mch_emc_0_Mem_DQ_T : std_logic_vector(0 to 15);
  signal xps_mch_emc_0_Mem_OEN : std_logic_vector(0 to 0);
  signal xps_mch_emc_0_Mem_WEN : std_logic;
  signal xps_tft_0_TFT_HSYNC : std_logic;
  signal xps_tft_0_TFT_VGA_B : std_logic_vector(5 downto 0);
  signal xps_tft_0_TFT_VGA_G : std_logic_vector(5 downto 0);
  signal xps_tft_0_TFT_VGA_R : std_logic_vector(5 downto 0);
  signal xps_tft_0_TFT_VSYNC : std_logic;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system_proc_sys_reset_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_ilmb_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_i_bram_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_dlmb_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_d_bram_ctrl_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_bram_block_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_microblaze_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_debug_module_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_clock_generator_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_axi4lite_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_rs232_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_generic_spi_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_axi_gpio_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_axi_plbv46_bridge_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_axi_timer_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_plb_v46_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_tft_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_xps_mch_emc_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of system_axi_intc_0_wrapper : component is "user_black_box";

begin

  -- Internal assignments

  RsTx <= RS232_Uart_1_sout;
  RS232_Uart_1_sin <= RsRx;
  xps_mch_emc_0_Mem_A_pin <= xps_mch_emc_0_Mem_A;
  xps_mch_emc_0_Mem_CEN_pin <= xps_mch_emc_0_Mem_CEN(0);
  xps_mch_emc_0_Mem_OEN_pin <= xps_mch_emc_0_Mem_OEN(0);
  xps_mch_emc_0_Mem_WEN_pin <= xps_mch_emc_0_Mem_WEN;
  xps_mch_emc_0_Mem_BEN_pin <= xps_mch_emc_0_Mem_BEN;
  xps_tft_0_TFT_VGA_R_pin <= xps_tft_0_TFT_VGA_R;
  xps_tft_0_TFT_VGA_G_pin <= xps_tft_0_TFT_VGA_G;
  xps_tft_0_TFT_VGA_B_pin <= xps_tft_0_TFT_VGA_B;
  xps_tft_0_TFT_HSYNC_pin <= xps_tft_0_TFT_HSYNC;
  xps_tft_0_TFT_VSYNC_pin <= xps_tft_0_TFT_VSYNC;
  RamCLK <= clock_generator_0_CLKOUT1;
  axi4lite_0_M_BID(0 downto 0) <= B"0";
  axi4lite_0_M_BID(1 downto 1) <= B"0";
  axi4lite_0_M_BID(2 downto 2) <= B"0";
  axi4lite_0_M_BID(3 downto 3) <= B"0";
  axi4lite_0_M_BID(5 downto 5) <= B"0";
  axi4lite_0_M_BID(6 downto 6) <= B"0";
  axi4lite_0_M_RID(0 downto 0) <= B"0";
  axi4lite_0_M_RID(1 downto 1) <= B"0";
  axi4lite_0_M_RID(2 downto 2) <= B"0";
  axi4lite_0_M_RID(3 downto 3) <= B"0";
  axi4lite_0_M_RID(5 downto 5) <= B"0";
  axi4lite_0_M_RID(6 downto 6) <= B"0";
  axi4lite_0_M_RLAST(0 downto 0) <= B"0";
  axi4lite_0_M_RLAST(1 downto 1) <= B"0";
  axi4lite_0_M_RLAST(2 downto 2) <= B"0";
  axi4lite_0_M_RLAST(3 downto 3) <= B"0";
  axi4lite_0_M_RLAST(5 downto 5) <= B"0";
  axi4lite_0_M_RLAST(6 downto 6) <= B"0";
  pgassign1(0 to 7) <= B"00000000";
  pgassign2(0 to 0) <= B"0";
  pgassign3(6 downto 6) <= clk_100_0000MHz(0 to 0);
  pgassign3(5 downto 5) <= clk_100_0000MHz(0 to 0);
  pgassign3(4 downto 4) <= clk_100_0000MHz(0 to 0);
  pgassign3(3 downto 3) <= clk_100_0000MHz(0 to 0);
  pgassign3(2 downto 2) <= clk_100_0000MHz(0 to 0);
  pgassign3(1 downto 1) <= clk_100_0000MHz(0 to 0);
  pgassign3(0 downto 0) <= clk_100_0000MHz(0 to 0);
  xps_mch_emc_0_Mem_A(22 downto 0) <= pgassign4(8 to 30);
  net_gnd0 <= '0';
  net_gnd1(0 to 0) <= B"0";
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd16(0 to 15) <= B"0000000000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd4096(0 to 4095) <= X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  net_gnd7(6 downto 0) <= B"0000000";
  net_vcc0 <= '1';

  proc_sys_reset_0 : system_proc_sys_reset_0_wrapper
    port map (
      Slowest_sync_clk => pgassign3(6),
      Ext_Reset_In => RESET,
      Aux_Reset_In => net_gnd0,
      MB_Debug_Sys_Rst => proc_sys_reset_0_MB_Debug_Sys_Rst,
      Core_Reset_Req_0 => net_gnd0,
      Chip_Reset_Req_0 => net_gnd0,
      System_Reset_Req_0 => net_gnd0,
      Core_Reset_Req_1 => net_gnd0,
      Chip_Reset_Req_1 => net_gnd0,
      System_Reset_Req_1 => net_gnd0,
      Dcm_locked => proc_sys_reset_0_Dcm_locked,
      RstcPPCresetcore_0 => open,
      RstcPPCresetchip_0 => open,
      RstcPPCresetsys_0 => open,
      RstcPPCresetcore_1 => open,
      RstcPPCresetchip_1 => open,
      RstcPPCresetsys_1 => open,
      MB_Reset => proc_sys_reset_0_MB_Reset,
      Bus_Struct_Reset => proc_sys_reset_0_BUS_STRUCT_RESET(0 to 0),
      Peripheral_Reset => proc_sys_reset_0_Peripheral_Reset(0 to 0),
      Interconnect_aresetn => proc_sys_reset_0_Interconnect_aresetn(0 to 0),
      Peripheral_aresetn => open
    );

  microblaze_0_ilmb : system_microblaze_0_ilmb_wrapper
    port map (
      LMB_Clk => pgassign3(6),
      SYS_Rst => proc_sys_reset_0_BUS_STRUCT_RESET(0),
      LMB_Rst => microblaze_0_ilmb_LMB_Rst,
      M_ABus => microblaze_0_ilmb_M_ABus,
      M_ReadStrobe => microblaze_0_ilmb_M_ReadStrobe,
      M_WriteStrobe => net_gnd0,
      M_AddrStrobe => microblaze_0_ilmb_M_AddrStrobe,
      M_DBus => net_gnd32,
      M_BE => net_gnd4,
      Sl_DBus => microblaze_0_ilmb_Sl_DBus,
      Sl_Ready => microblaze_0_ilmb_Sl_Ready(0 to 0),
      Sl_Wait => microblaze_0_ilmb_Sl_Wait(0 to 0),
      Sl_UE => microblaze_0_ilmb_Sl_UE(0 to 0),
      Sl_CE => microblaze_0_ilmb_Sl_CE(0 to 0),
      LMB_ABus => microblaze_0_ilmb_LMB_ABus,
      LMB_ReadStrobe => microblaze_0_ilmb_LMB_ReadStrobe,
      LMB_WriteStrobe => microblaze_0_ilmb_LMB_WriteStrobe,
      LMB_AddrStrobe => microblaze_0_ilmb_LMB_AddrStrobe,
      LMB_ReadDBus => microblaze_0_ilmb_LMB_ReadDBus,
      LMB_WriteDBus => microblaze_0_ilmb_LMB_WriteDBus,
      LMB_Ready => microblaze_0_ilmb_LMB_Ready,
      LMB_Wait => microblaze_0_ilmb_LMB_Wait,
      LMB_UE => microblaze_0_ilmb_LMB_UE,
      LMB_CE => microblaze_0_ilmb_LMB_CE,
      LMB_BE => microblaze_0_ilmb_LMB_BE
    );

  microblaze_0_i_bram_ctrl : system_microblaze_0_i_bram_ctrl_wrapper
    port map (
      LMB_Clk => pgassign3(6),
      LMB_Rst => microblaze_0_ilmb_LMB_Rst,
      LMB_ABus => microblaze_0_ilmb_LMB_ABus,
      LMB_WriteDBus => microblaze_0_ilmb_LMB_WriteDBus,
      LMB_AddrStrobe => microblaze_0_ilmb_LMB_AddrStrobe,
      LMB_ReadStrobe => microblaze_0_ilmb_LMB_ReadStrobe,
      LMB_WriteStrobe => microblaze_0_ilmb_LMB_WriteStrobe,
      LMB_BE => microblaze_0_ilmb_LMB_BE,
      Sl_DBus => microblaze_0_ilmb_Sl_DBus,
      Sl_Ready => microblaze_0_ilmb_Sl_Ready(0),
      Sl_Wait => microblaze_0_ilmb_Sl_Wait(0),
      Sl_UE => microblaze_0_ilmb_Sl_UE(0),
      Sl_CE => microblaze_0_ilmb_Sl_CE(0),
      LMB1_ABus => net_gnd32,
      LMB1_WriteDBus => net_gnd32,
      LMB1_AddrStrobe => net_gnd0,
      LMB1_ReadStrobe => net_gnd0,
      LMB1_WriteStrobe => net_gnd0,
      LMB1_BE => net_gnd4,
      Sl1_DBus => open,
      Sl1_Ready => open,
      Sl1_Wait => open,
      Sl1_UE => open,
      Sl1_CE => open,
      LMB2_ABus => net_gnd32,
      LMB2_WriteDBus => net_gnd32,
      LMB2_AddrStrobe => net_gnd0,
      LMB2_ReadStrobe => net_gnd0,
      LMB2_WriteStrobe => net_gnd0,
      LMB2_BE => net_gnd4,
      Sl2_DBus => open,
      Sl2_Ready => open,
      Sl2_Wait => open,
      Sl2_UE => open,
      Sl2_CE => open,
      LMB3_ABus => net_gnd32,
      LMB3_WriteDBus => net_gnd32,
      LMB3_AddrStrobe => net_gnd0,
      LMB3_ReadStrobe => net_gnd0,
      LMB3_WriteStrobe => net_gnd0,
      LMB3_BE => net_gnd4,
      Sl3_DBus => open,
      Sl3_Ready => open,
      Sl3_Wait => open,
      Sl3_UE => open,
      Sl3_CE => open,
      BRAM_Rst_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst,
      BRAM_Clk_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk,
      BRAM_EN_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN,
      BRAM_WEN_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN,
      BRAM_Addr_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr,
      BRAM_Din_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din,
      BRAM_Dout_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout,
      Interrupt => open,
      UE => open,
      CE => open,
      SPLB_CTRL_PLB_ABus => net_gnd32,
      SPLB_CTRL_PLB_PAValid => net_gnd0,
      SPLB_CTRL_PLB_masterID => net_gnd1(0 to 0),
      SPLB_CTRL_PLB_RNW => net_gnd0,
      SPLB_CTRL_PLB_BE => net_gnd4,
      SPLB_CTRL_PLB_size => net_gnd4,
      SPLB_CTRL_PLB_type => net_gnd3,
      SPLB_CTRL_PLB_wrDBus => net_gnd32,
      SPLB_CTRL_Sl_addrAck => open,
      SPLB_CTRL_Sl_SSize => open,
      SPLB_CTRL_Sl_wait => open,
      SPLB_CTRL_Sl_rearbitrate => open,
      SPLB_CTRL_Sl_wrDAck => open,
      SPLB_CTRL_Sl_wrComp => open,
      SPLB_CTRL_Sl_rdDBus => open,
      SPLB_CTRL_Sl_rdDAck => open,
      SPLB_CTRL_Sl_rdComp => open,
      SPLB_CTRL_Sl_MBusy => open,
      SPLB_CTRL_Sl_MWrErr => open,
      SPLB_CTRL_Sl_MRdErr => open,
      SPLB_CTRL_PLB_UABus => net_gnd32,
      SPLB_CTRL_PLB_SAValid => net_gnd0,
      SPLB_CTRL_PLB_rdPrim => net_gnd0,
      SPLB_CTRL_PLB_wrPrim => net_gnd0,
      SPLB_CTRL_PLB_abort => net_gnd0,
      SPLB_CTRL_PLB_busLock => net_gnd0,
      SPLB_CTRL_PLB_MSize => net_gnd2,
      SPLB_CTRL_PLB_lockErr => net_gnd0,
      SPLB_CTRL_PLB_wrBurst => net_gnd0,
      SPLB_CTRL_PLB_rdBurst => net_gnd0,
      SPLB_CTRL_PLB_wrPendReq => net_gnd0,
      SPLB_CTRL_PLB_rdPendReq => net_gnd0,
      SPLB_CTRL_PLB_wrPendPri => net_gnd2,
      SPLB_CTRL_PLB_rdPendPri => net_gnd2,
      SPLB_CTRL_PLB_reqPri => net_gnd2,
      SPLB_CTRL_PLB_TAttribute => net_gnd16,
      SPLB_CTRL_Sl_wrBTerm => open,
      SPLB_CTRL_Sl_rdWdAddr => open,
      SPLB_CTRL_Sl_rdBTerm => open,
      SPLB_CTRL_Sl_MIRQ => open,
      S_AXI_CTRL_ACLK => net_vcc0,
      S_AXI_CTRL_ARESETN => net_gnd0,
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WSTRB => net_gnd4(0 to 3),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0
    );

  microblaze_0_dlmb : system_microblaze_0_dlmb_wrapper
    port map (
      LMB_Clk => pgassign3(6),
      SYS_Rst => proc_sys_reset_0_BUS_STRUCT_RESET(0),
      LMB_Rst => microblaze_0_dlmb_LMB_Rst,
      M_ABus => microblaze_0_dlmb_M_ABus,
      M_ReadStrobe => microblaze_0_dlmb_M_ReadStrobe,
      M_WriteStrobe => microblaze_0_dlmb_M_WriteStrobe,
      M_AddrStrobe => microblaze_0_dlmb_M_AddrStrobe,
      M_DBus => microblaze_0_dlmb_M_DBus,
      M_BE => microblaze_0_dlmb_M_BE,
      Sl_DBus => microblaze_0_dlmb_Sl_DBus,
      Sl_Ready => microblaze_0_dlmb_Sl_Ready(0 to 0),
      Sl_Wait => microblaze_0_dlmb_Sl_Wait(0 to 0),
      Sl_UE => microblaze_0_dlmb_Sl_UE(0 to 0),
      Sl_CE => microblaze_0_dlmb_Sl_CE(0 to 0),
      LMB_ABus => microblaze_0_dlmb_LMB_ABus,
      LMB_ReadStrobe => microblaze_0_dlmb_LMB_ReadStrobe,
      LMB_WriteStrobe => microblaze_0_dlmb_LMB_WriteStrobe,
      LMB_AddrStrobe => microblaze_0_dlmb_LMB_AddrStrobe,
      LMB_ReadDBus => microblaze_0_dlmb_LMB_ReadDBus,
      LMB_WriteDBus => microblaze_0_dlmb_LMB_WriteDBus,
      LMB_Ready => microblaze_0_dlmb_LMB_Ready,
      LMB_Wait => microblaze_0_dlmb_LMB_Wait,
      LMB_UE => microblaze_0_dlmb_LMB_UE,
      LMB_CE => microblaze_0_dlmb_LMB_CE,
      LMB_BE => microblaze_0_dlmb_LMB_BE
    );

  microblaze_0_d_bram_ctrl : system_microblaze_0_d_bram_ctrl_wrapper
    port map (
      LMB_Clk => pgassign3(6),
      LMB_Rst => microblaze_0_dlmb_LMB_Rst,
      LMB_ABus => microblaze_0_dlmb_LMB_ABus,
      LMB_WriteDBus => microblaze_0_dlmb_LMB_WriteDBus,
      LMB_AddrStrobe => microblaze_0_dlmb_LMB_AddrStrobe,
      LMB_ReadStrobe => microblaze_0_dlmb_LMB_ReadStrobe,
      LMB_WriteStrobe => microblaze_0_dlmb_LMB_WriteStrobe,
      LMB_BE => microblaze_0_dlmb_LMB_BE,
      Sl_DBus => microblaze_0_dlmb_Sl_DBus,
      Sl_Ready => microblaze_0_dlmb_Sl_Ready(0),
      Sl_Wait => microblaze_0_dlmb_Sl_Wait(0),
      Sl_UE => microblaze_0_dlmb_Sl_UE(0),
      Sl_CE => microblaze_0_dlmb_Sl_CE(0),
      LMB1_ABus => net_gnd32,
      LMB1_WriteDBus => net_gnd32,
      LMB1_AddrStrobe => net_gnd0,
      LMB1_ReadStrobe => net_gnd0,
      LMB1_WriteStrobe => net_gnd0,
      LMB1_BE => net_gnd4,
      Sl1_DBus => open,
      Sl1_Ready => open,
      Sl1_Wait => open,
      Sl1_UE => open,
      Sl1_CE => open,
      LMB2_ABus => net_gnd32,
      LMB2_WriteDBus => net_gnd32,
      LMB2_AddrStrobe => net_gnd0,
      LMB2_ReadStrobe => net_gnd0,
      LMB2_WriteStrobe => net_gnd0,
      LMB2_BE => net_gnd4,
      Sl2_DBus => open,
      Sl2_Ready => open,
      Sl2_Wait => open,
      Sl2_UE => open,
      Sl2_CE => open,
      LMB3_ABus => net_gnd32,
      LMB3_WriteDBus => net_gnd32,
      LMB3_AddrStrobe => net_gnd0,
      LMB3_ReadStrobe => net_gnd0,
      LMB3_WriteStrobe => net_gnd0,
      LMB3_BE => net_gnd4,
      Sl3_DBus => open,
      Sl3_Ready => open,
      Sl3_Wait => open,
      Sl3_UE => open,
      Sl3_CE => open,
      BRAM_Rst_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst,
      BRAM_Clk_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk,
      BRAM_EN_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN,
      BRAM_WEN_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN,
      BRAM_Addr_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr,
      BRAM_Din_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din,
      BRAM_Dout_A => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout,
      Interrupt => open,
      UE => open,
      CE => open,
      SPLB_CTRL_PLB_ABus => net_gnd32,
      SPLB_CTRL_PLB_PAValid => net_gnd0,
      SPLB_CTRL_PLB_masterID => net_gnd1(0 to 0),
      SPLB_CTRL_PLB_RNW => net_gnd0,
      SPLB_CTRL_PLB_BE => net_gnd4,
      SPLB_CTRL_PLB_size => net_gnd4,
      SPLB_CTRL_PLB_type => net_gnd3,
      SPLB_CTRL_PLB_wrDBus => net_gnd32,
      SPLB_CTRL_Sl_addrAck => open,
      SPLB_CTRL_Sl_SSize => open,
      SPLB_CTRL_Sl_wait => open,
      SPLB_CTRL_Sl_rearbitrate => open,
      SPLB_CTRL_Sl_wrDAck => open,
      SPLB_CTRL_Sl_wrComp => open,
      SPLB_CTRL_Sl_rdDBus => open,
      SPLB_CTRL_Sl_rdDAck => open,
      SPLB_CTRL_Sl_rdComp => open,
      SPLB_CTRL_Sl_MBusy => open,
      SPLB_CTRL_Sl_MWrErr => open,
      SPLB_CTRL_Sl_MRdErr => open,
      SPLB_CTRL_PLB_UABus => net_gnd32,
      SPLB_CTRL_PLB_SAValid => net_gnd0,
      SPLB_CTRL_PLB_rdPrim => net_gnd0,
      SPLB_CTRL_PLB_wrPrim => net_gnd0,
      SPLB_CTRL_PLB_abort => net_gnd0,
      SPLB_CTRL_PLB_busLock => net_gnd0,
      SPLB_CTRL_PLB_MSize => net_gnd2,
      SPLB_CTRL_PLB_lockErr => net_gnd0,
      SPLB_CTRL_PLB_wrBurst => net_gnd0,
      SPLB_CTRL_PLB_rdBurst => net_gnd0,
      SPLB_CTRL_PLB_wrPendReq => net_gnd0,
      SPLB_CTRL_PLB_rdPendReq => net_gnd0,
      SPLB_CTRL_PLB_wrPendPri => net_gnd2,
      SPLB_CTRL_PLB_rdPendPri => net_gnd2,
      SPLB_CTRL_PLB_reqPri => net_gnd2,
      SPLB_CTRL_PLB_TAttribute => net_gnd16,
      SPLB_CTRL_Sl_wrBTerm => open,
      SPLB_CTRL_Sl_rdWdAddr => open,
      SPLB_CTRL_Sl_rdBTerm => open,
      SPLB_CTRL_Sl_MIRQ => open,
      S_AXI_CTRL_ACLK => net_vcc0,
      S_AXI_CTRL_ARESETN => net_gnd0,
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WSTRB => net_gnd4(0 to 3),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0
    );

  microblaze_0_bram_block : system_microblaze_0_bram_block_wrapper
    port map (
      BRAM_Rst_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst,
      BRAM_Clk_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk,
      BRAM_EN_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN,
      BRAM_WEN_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN,
      BRAM_Addr_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr,
      BRAM_Din_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din,
      BRAM_Dout_A => microblaze_0_i_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout,
      BRAM_Rst_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Rst,
      BRAM_Clk_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Clk,
      BRAM_EN_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_EN,
      BRAM_WEN_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_WEN,
      BRAM_Addr_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Addr,
      BRAM_Din_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Din,
      BRAM_Dout_B => microblaze_0_d_bram_ctrl_2_microblaze_0_bram_block_BRAM_Dout
    );

  microblaze_0 : system_microblaze_0_wrapper
    port map (
      CLK => pgassign3(6),
      RESET => microblaze_0_dlmb_LMB_Rst,
      MB_RESET => proc_sys_reset_0_MB_Reset,
      INTERRUPT => axi_intc_0_INTERRUPT_Interrupt,
      INTERRUPT_ADDRESS => axi_intc_0_INTERRUPT_Interrupt_Address,
      INTERRUPT_ACK => axi_intc_0_INTERRUPT_Interrupt_Ack(1 downto 0),
      EXT_BRK => Ext_BRK,
      EXT_NM_BRK => Ext_NM_BRK,
      DBG_STOP => net_gnd0,
      MB_Halted => open,
      MB_Error => open,
      WAKEUP => net_gnd2,
      SLEEP => open,
      DBG_WAKEUP => open,
      LOCKSTEP_MASTER_OUT => open,
      LOCKSTEP_SLAVE_IN => net_gnd4096,
      LOCKSTEP_OUT => open,
      INSTR => microblaze_0_ilmb_LMB_ReadDBus,
      IREADY => microblaze_0_ilmb_LMB_Ready,
      IWAIT => microblaze_0_ilmb_LMB_Wait,
      ICE => microblaze_0_ilmb_LMB_CE,
      IUE => microblaze_0_ilmb_LMB_UE,
      INSTR_ADDR => microblaze_0_ilmb_M_ABus,
      IFETCH => microblaze_0_ilmb_M_ReadStrobe,
      I_AS => microblaze_0_ilmb_M_AddrStrobe,
      IPLB_M_ABort => open,
      IPLB_M_ABus => open,
      IPLB_M_UABus => open,
      IPLB_M_BE => open,
      IPLB_M_busLock => open,
      IPLB_M_lockErr => open,
      IPLB_M_MSize => open,
      IPLB_M_priority => open,
      IPLB_M_rdBurst => open,
      IPLB_M_request => open,
      IPLB_M_RNW => open,
      IPLB_M_size => open,
      IPLB_M_TAttribute => open,
      IPLB_M_type => open,
      IPLB_M_wrBurst => open,
      IPLB_M_wrDBus => open,
      IPLB_MBusy => net_gnd0,
      IPLB_MRdErr => net_gnd0,
      IPLB_MWrErr => net_gnd0,
      IPLB_MIRQ => net_gnd0,
      IPLB_MWrBTerm => net_gnd0,
      IPLB_MWrDAck => net_gnd0,
      IPLB_MAddrAck => net_gnd0,
      IPLB_MRdBTerm => net_gnd0,
      IPLB_MRdDAck => net_gnd0,
      IPLB_MRdDBus => net_gnd32,
      IPLB_MRdWdAddr => net_gnd4,
      IPLB_MRearbitrate => net_gnd0,
      IPLB_MSSize => net_gnd2,
      IPLB_MTimeout => net_gnd0,
      DATA_READ => microblaze_0_dlmb_LMB_ReadDBus,
      DREADY => microblaze_0_dlmb_LMB_Ready,
      DWAIT => microblaze_0_dlmb_LMB_Wait,
      DCE => microblaze_0_dlmb_LMB_CE,
      DUE => microblaze_0_dlmb_LMB_UE,
      DATA_WRITE => microblaze_0_dlmb_M_DBus,
      DATA_ADDR => microblaze_0_dlmb_M_ABus,
      D_AS => microblaze_0_dlmb_M_AddrStrobe,
      READ_STROBE => microblaze_0_dlmb_M_ReadStrobe,
      WRITE_STROBE => microblaze_0_dlmb_M_WriteStrobe,
      BYTE_ENABLE => microblaze_0_dlmb_M_BE,
      DPLB_M_ABort => open,
      DPLB_M_ABus => open,
      DPLB_M_UABus => open,
      DPLB_M_BE => open,
      DPLB_M_busLock => open,
      DPLB_M_lockErr => open,
      DPLB_M_MSize => open,
      DPLB_M_priority => open,
      DPLB_M_rdBurst => open,
      DPLB_M_request => open,
      DPLB_M_RNW => open,
      DPLB_M_size => open,
      DPLB_M_TAttribute => open,
      DPLB_M_type => open,
      DPLB_M_wrBurst => open,
      DPLB_M_wrDBus => open,
      DPLB_MBusy => net_gnd0,
      DPLB_MRdErr => net_gnd0,
      DPLB_MWrErr => net_gnd0,
      DPLB_MIRQ => net_gnd0,
      DPLB_MWrBTerm => net_gnd0,
      DPLB_MWrDAck => net_gnd0,
      DPLB_MAddrAck => net_gnd0,
      DPLB_MRdBTerm => net_gnd0,
      DPLB_MRdDAck => net_gnd0,
      DPLB_MRdDBus => net_gnd32,
      DPLB_MRdWdAddr => net_gnd4,
      DPLB_MRearbitrate => net_gnd0,
      DPLB_MSSize => net_gnd2,
      DPLB_MTimeout => net_gnd0,
      M_AXI_IP_AWID => open,
      M_AXI_IP_AWADDR => open,
      M_AXI_IP_AWLEN => open,
      M_AXI_IP_AWSIZE => open,
      M_AXI_IP_AWBURST => open,
      M_AXI_IP_AWLOCK => open,
      M_AXI_IP_AWCACHE => open,
      M_AXI_IP_AWPROT => open,
      M_AXI_IP_AWQOS => open,
      M_AXI_IP_AWVALID => open,
      M_AXI_IP_AWREADY => net_gnd0,
      M_AXI_IP_WDATA => open,
      M_AXI_IP_WSTRB => open,
      M_AXI_IP_WLAST => open,
      M_AXI_IP_WVALID => open,
      M_AXI_IP_WREADY => net_gnd0,
      M_AXI_IP_BID => net_gnd1(0 to 0),
      M_AXI_IP_BRESP => net_gnd2(0 to 1),
      M_AXI_IP_BVALID => net_gnd0,
      M_AXI_IP_BREADY => open,
      M_AXI_IP_ARID => open,
      M_AXI_IP_ARADDR => open,
      M_AXI_IP_ARLEN => open,
      M_AXI_IP_ARSIZE => open,
      M_AXI_IP_ARBURST => open,
      M_AXI_IP_ARLOCK => open,
      M_AXI_IP_ARCACHE => open,
      M_AXI_IP_ARPROT => open,
      M_AXI_IP_ARQOS => open,
      M_AXI_IP_ARVALID => open,
      M_AXI_IP_ARREADY => net_gnd0,
      M_AXI_IP_RID => net_gnd1(0 to 0),
      M_AXI_IP_RDATA => net_gnd32(0 to 31),
      M_AXI_IP_RRESP => net_gnd2(0 to 1),
      M_AXI_IP_RLAST => net_gnd0,
      M_AXI_IP_RVALID => net_gnd0,
      M_AXI_IP_RREADY => open,
      M_AXI_DP_AWID => axi4lite_0_S_AWID(0 to 0),
      M_AXI_DP_AWADDR => axi4lite_0_S_AWADDR,
      M_AXI_DP_AWLEN => axi4lite_0_S_AWLEN,
      M_AXI_DP_AWSIZE => axi4lite_0_S_AWSIZE,
      M_AXI_DP_AWBURST => axi4lite_0_S_AWBURST,
      M_AXI_DP_AWLOCK => axi4lite_0_S_AWLOCK(0),
      M_AXI_DP_AWCACHE => axi4lite_0_S_AWCACHE,
      M_AXI_DP_AWPROT => axi4lite_0_S_AWPROT,
      M_AXI_DP_AWQOS => axi4lite_0_S_AWQOS,
      M_AXI_DP_AWVALID => axi4lite_0_S_AWVALID(0),
      M_AXI_DP_AWREADY => axi4lite_0_S_AWREADY(0),
      M_AXI_DP_WDATA => axi4lite_0_S_WDATA,
      M_AXI_DP_WSTRB => axi4lite_0_S_WSTRB,
      M_AXI_DP_WLAST => axi4lite_0_S_WLAST(0),
      M_AXI_DP_WVALID => axi4lite_0_S_WVALID(0),
      M_AXI_DP_WREADY => axi4lite_0_S_WREADY(0),
      M_AXI_DP_BID => axi4lite_0_S_BID(0 downto 0),
      M_AXI_DP_BRESP => axi4lite_0_S_BRESP,
      M_AXI_DP_BVALID => axi4lite_0_S_BVALID(0),
      M_AXI_DP_BREADY => axi4lite_0_S_BREADY(0),
      M_AXI_DP_ARID => axi4lite_0_S_ARID(0 to 0),
      M_AXI_DP_ARADDR => axi4lite_0_S_ARADDR,
      M_AXI_DP_ARLEN => axi4lite_0_S_ARLEN,
      M_AXI_DP_ARSIZE => axi4lite_0_S_ARSIZE,
      M_AXI_DP_ARBURST => axi4lite_0_S_ARBURST,
      M_AXI_DP_ARLOCK => axi4lite_0_S_ARLOCK(0),
      M_AXI_DP_ARCACHE => axi4lite_0_S_ARCACHE,
      M_AXI_DP_ARPROT => axi4lite_0_S_ARPROT,
      M_AXI_DP_ARQOS => axi4lite_0_S_ARQOS,
      M_AXI_DP_ARVALID => axi4lite_0_S_ARVALID(0),
      M_AXI_DP_ARREADY => axi4lite_0_S_ARREADY(0),
      M_AXI_DP_RID => axi4lite_0_S_RID(0 downto 0),
      M_AXI_DP_RDATA => axi4lite_0_S_RDATA,
      M_AXI_DP_RRESP => axi4lite_0_S_RRESP,
      M_AXI_DP_RLAST => axi4lite_0_S_RLAST(0),
      M_AXI_DP_RVALID => axi4lite_0_S_RVALID(0),
      M_AXI_DP_RREADY => axi4lite_0_S_RREADY(0),
      M_AXI_IC_AWID => open,
      M_AXI_IC_AWADDR => open,
      M_AXI_IC_AWLEN => open,
      M_AXI_IC_AWSIZE => open,
      M_AXI_IC_AWBURST => open,
      M_AXI_IC_AWLOCK => open,
      M_AXI_IC_AWCACHE => open,
      M_AXI_IC_AWPROT => open,
      M_AXI_IC_AWQOS => open,
      M_AXI_IC_AWVALID => open,
      M_AXI_IC_AWREADY => net_gnd0,
      M_AXI_IC_AWUSER => open,
      M_AXI_IC_AWDOMAIN => open,
      M_AXI_IC_AWSNOOP => open,
      M_AXI_IC_AWBAR => open,
      M_AXI_IC_WDATA => open,
      M_AXI_IC_WSTRB => open,
      M_AXI_IC_WLAST => open,
      M_AXI_IC_WVALID => open,
      M_AXI_IC_WREADY => net_gnd0,
      M_AXI_IC_WUSER => open,
      M_AXI_IC_BID => net_gnd1(0 to 0),
      M_AXI_IC_BRESP => net_gnd2(0 to 1),
      M_AXI_IC_BVALID => net_gnd0,
      M_AXI_IC_BREADY => open,
      M_AXI_IC_BUSER => net_gnd1(0 to 0),
      M_AXI_IC_WACK => open,
      M_AXI_IC_ARID => open,
      M_AXI_IC_ARADDR => open,
      M_AXI_IC_ARLEN => open,
      M_AXI_IC_ARSIZE => open,
      M_AXI_IC_ARBURST => open,
      M_AXI_IC_ARLOCK => open,
      M_AXI_IC_ARCACHE => open,
      M_AXI_IC_ARPROT => open,
      M_AXI_IC_ARQOS => open,
      M_AXI_IC_ARVALID => open,
      M_AXI_IC_ARREADY => net_gnd0,
      M_AXI_IC_ARUSER => open,
      M_AXI_IC_ARDOMAIN => open,
      M_AXI_IC_ARSNOOP => open,
      M_AXI_IC_ARBAR => open,
      M_AXI_IC_RID => net_gnd1(0 to 0),
      M_AXI_IC_RDATA => net_gnd32(0 to 31),
      M_AXI_IC_RRESP => net_gnd2(0 to 1),
      M_AXI_IC_RLAST => net_gnd0,
      M_AXI_IC_RVALID => net_gnd0,
      M_AXI_IC_RREADY => open,
      M_AXI_IC_RUSER => net_gnd1(0 to 0),
      M_AXI_IC_RACK => open,
      M_AXI_IC_ACVALID => net_gnd0,
      M_AXI_IC_ACADDR => net_gnd32(0 to 31),
      M_AXI_IC_ACSNOOP => net_gnd4(0 to 3),
      M_AXI_IC_ACPROT => net_gnd3(0 to 2),
      M_AXI_IC_ACREADY => open,
      M_AXI_IC_CRREADY => net_gnd0,
      M_AXI_IC_CRVALID => open,
      M_AXI_IC_CRRESP => open,
      M_AXI_IC_CDVALID => open,
      M_AXI_IC_CDREADY => net_gnd0,
      M_AXI_IC_CDDATA => open,
      M_AXI_IC_CDLAST => open,
      M_AXI_DC_AWID => open,
      M_AXI_DC_AWADDR => open,
      M_AXI_DC_AWLEN => open,
      M_AXI_DC_AWSIZE => open,
      M_AXI_DC_AWBURST => open,
      M_AXI_DC_AWLOCK => open,
      M_AXI_DC_AWCACHE => open,
      M_AXI_DC_AWPROT => open,
      M_AXI_DC_AWQOS => open,
      M_AXI_DC_AWVALID => open,
      M_AXI_DC_AWREADY => net_gnd0,
      M_AXI_DC_AWUSER => open,
      M_AXI_DC_AWDOMAIN => open,
      M_AXI_DC_AWSNOOP => open,
      M_AXI_DC_AWBAR => open,
      M_AXI_DC_WDATA => open,
      M_AXI_DC_WSTRB => open,
      M_AXI_DC_WLAST => open,
      M_AXI_DC_WVALID => open,
      M_AXI_DC_WREADY => net_gnd0,
      M_AXI_DC_WUSER => open,
      M_AXI_DC_BID => net_gnd1(0 to 0),
      M_AXI_DC_BRESP => net_gnd2(0 to 1),
      M_AXI_DC_BVALID => net_gnd0,
      M_AXI_DC_BREADY => open,
      M_AXI_DC_BUSER => net_gnd1(0 to 0),
      M_AXI_DC_WACK => open,
      M_AXI_DC_ARID => open,
      M_AXI_DC_ARADDR => open,
      M_AXI_DC_ARLEN => open,
      M_AXI_DC_ARSIZE => open,
      M_AXI_DC_ARBURST => open,
      M_AXI_DC_ARLOCK => open,
      M_AXI_DC_ARCACHE => open,
      M_AXI_DC_ARPROT => open,
      M_AXI_DC_ARQOS => open,
      M_AXI_DC_ARVALID => open,
      M_AXI_DC_ARREADY => net_gnd0,
      M_AXI_DC_ARUSER => open,
      M_AXI_DC_ARDOMAIN => open,
      M_AXI_DC_ARSNOOP => open,
      M_AXI_DC_ARBAR => open,
      M_AXI_DC_RID => net_gnd1(0 to 0),
      M_AXI_DC_RDATA => net_gnd32(0 to 31),
      M_AXI_DC_RRESP => net_gnd2(0 to 1),
      M_AXI_DC_RLAST => net_gnd0,
      M_AXI_DC_RVALID => net_gnd0,
      M_AXI_DC_RREADY => open,
      M_AXI_DC_RUSER => net_gnd1(0 to 0),
      M_AXI_DC_RACK => open,
      M_AXI_DC_ACVALID => net_gnd0,
      M_AXI_DC_ACADDR => net_gnd32(0 to 31),
      M_AXI_DC_ACSNOOP => net_gnd4(0 to 3),
      M_AXI_DC_ACPROT => net_gnd3(0 to 2),
      M_AXI_DC_ACREADY => open,
      M_AXI_DC_CRREADY => net_gnd0,
      M_AXI_DC_CRVALID => open,
      M_AXI_DC_CRRESP => open,
      M_AXI_DC_CDVALID => open,
      M_AXI_DC_CDREADY => net_gnd0,
      M_AXI_DC_CDDATA => open,
      M_AXI_DC_CDLAST => open,
      DBG_CLK => microblaze_0_debug_Dbg_Clk,
      DBG_TDI => microblaze_0_debug_Dbg_TDI,
      DBG_TDO => microblaze_0_debug_Dbg_TDO,
      DBG_REG_EN => microblaze_0_debug_Dbg_Reg_En,
      DBG_SHIFT => microblaze_0_debug_Dbg_Shift,
      DBG_CAPTURE => microblaze_0_debug_Dbg_Capture,
      DBG_UPDATE => microblaze_0_debug_Dbg_Update,
      DEBUG_RST => microblaze_0_debug_Debug_Rst,
      Trace_Instruction => open,
      Trace_Valid_Instr => open,
      Trace_PC => open,
      Trace_Reg_Write => open,
      Trace_Reg_Addr => open,
      Trace_MSR_Reg => open,
      Trace_PID_Reg => open,
      Trace_New_Reg_Value => open,
      Trace_Exception_Taken => open,
      Trace_Exception_Kind => open,
      Trace_Jump_Taken => open,
      Trace_Delay_Slot => open,
      Trace_Data_Address => open,
      Trace_Data_Access => open,
      Trace_Data_Read => open,
      Trace_Data_Write => open,
      Trace_Data_Write_Value => open,
      Trace_Data_Byte_Enable => open,
      Trace_DCache_Req => open,
      Trace_DCache_Hit => open,
      Trace_DCache_Rdy => open,
      Trace_DCache_Read => open,
      Trace_ICache_Req => open,
      Trace_ICache_Hit => open,
      Trace_ICache_Rdy => open,
      Trace_OF_PipeRun => open,
      Trace_EX_PipeRun => open,
      Trace_MEM_PipeRun => open,
      Trace_MB_Halted => open,
      Trace_Jump_Hit => open,
      FSL0_S_CLK => open,
      FSL0_S_READ => open,
      FSL0_S_DATA => net_gnd32,
      FSL0_S_CONTROL => net_gnd0,
      FSL0_S_EXISTS => net_gnd0,
      FSL0_M_CLK => open,
      FSL0_M_WRITE => open,
      FSL0_M_DATA => open,
      FSL0_M_CONTROL => open,
      FSL0_M_FULL => net_gnd0,
      FSL1_S_CLK => open,
      FSL1_S_READ => open,
      FSL1_S_DATA => net_gnd32,
      FSL1_S_CONTROL => net_gnd0,
      FSL1_S_EXISTS => net_gnd0,
      FSL1_M_CLK => open,
      FSL1_M_WRITE => open,
      FSL1_M_DATA => open,
      FSL1_M_CONTROL => open,
      FSL1_M_FULL => net_gnd0,
      FSL2_S_CLK => open,
      FSL2_S_READ => open,
      FSL2_S_DATA => net_gnd32,
      FSL2_S_CONTROL => net_gnd0,
      FSL2_S_EXISTS => net_gnd0,
      FSL2_M_CLK => open,
      FSL2_M_WRITE => open,
      FSL2_M_DATA => open,
      FSL2_M_CONTROL => open,
      FSL2_M_FULL => net_gnd0,
      FSL3_S_CLK => open,
      FSL3_S_READ => open,
      FSL3_S_DATA => net_gnd32,
      FSL3_S_CONTROL => net_gnd0,
      FSL3_S_EXISTS => net_gnd0,
      FSL3_M_CLK => open,
      FSL3_M_WRITE => open,
      FSL3_M_DATA => open,
      FSL3_M_CONTROL => open,
      FSL3_M_FULL => net_gnd0,
      FSL4_S_CLK => open,
      FSL4_S_READ => open,
      FSL4_S_DATA => net_gnd32,
      FSL4_S_CONTROL => net_gnd0,
      FSL4_S_EXISTS => net_gnd0,
      FSL4_M_CLK => open,
      FSL4_M_WRITE => open,
      FSL4_M_DATA => open,
      FSL4_M_CONTROL => open,
      FSL4_M_FULL => net_gnd0,
      FSL5_S_CLK => open,
      FSL5_S_READ => open,
      FSL5_S_DATA => net_gnd32,
      FSL5_S_CONTROL => net_gnd0,
      FSL5_S_EXISTS => net_gnd0,
      FSL5_M_CLK => open,
      FSL5_M_WRITE => open,
      FSL5_M_DATA => open,
      FSL5_M_CONTROL => open,
      FSL5_M_FULL => net_gnd0,
      FSL6_S_CLK => open,
      FSL6_S_READ => open,
      FSL6_S_DATA => net_gnd32,
      FSL6_S_CONTROL => net_gnd0,
      FSL6_S_EXISTS => net_gnd0,
      FSL6_M_CLK => open,
      FSL6_M_WRITE => open,
      FSL6_M_DATA => open,
      FSL6_M_CONTROL => open,
      FSL6_M_FULL => net_gnd0,
      FSL7_S_CLK => open,
      FSL7_S_READ => open,
      FSL7_S_DATA => net_gnd32,
      FSL7_S_CONTROL => net_gnd0,
      FSL7_S_EXISTS => net_gnd0,
      FSL7_M_CLK => open,
      FSL7_M_WRITE => open,
      FSL7_M_DATA => open,
      FSL7_M_CONTROL => open,
      FSL7_M_FULL => net_gnd0,
      FSL8_S_CLK => open,
      FSL8_S_READ => open,
      FSL8_S_DATA => net_gnd32,
      FSL8_S_CONTROL => net_gnd0,
      FSL8_S_EXISTS => net_gnd0,
      FSL8_M_CLK => open,
      FSL8_M_WRITE => open,
      FSL8_M_DATA => open,
      FSL8_M_CONTROL => open,
      FSL8_M_FULL => net_gnd0,
      FSL9_S_CLK => open,
      FSL9_S_READ => open,
      FSL9_S_DATA => net_gnd32,
      FSL9_S_CONTROL => net_gnd0,
      FSL9_S_EXISTS => net_gnd0,
      FSL9_M_CLK => open,
      FSL9_M_WRITE => open,
      FSL9_M_DATA => open,
      FSL9_M_CONTROL => open,
      FSL9_M_FULL => net_gnd0,
      FSL10_S_CLK => open,
      FSL10_S_READ => open,
      FSL10_S_DATA => net_gnd32,
      FSL10_S_CONTROL => net_gnd0,
      FSL10_S_EXISTS => net_gnd0,
      FSL10_M_CLK => open,
      FSL10_M_WRITE => open,
      FSL10_M_DATA => open,
      FSL10_M_CONTROL => open,
      FSL10_M_FULL => net_gnd0,
      FSL11_S_CLK => open,
      FSL11_S_READ => open,
      FSL11_S_DATA => net_gnd32,
      FSL11_S_CONTROL => net_gnd0,
      FSL11_S_EXISTS => net_gnd0,
      FSL11_M_CLK => open,
      FSL11_M_WRITE => open,
      FSL11_M_DATA => open,
      FSL11_M_CONTROL => open,
      FSL11_M_FULL => net_gnd0,
      FSL12_S_CLK => open,
      FSL12_S_READ => open,
      FSL12_S_DATA => net_gnd32,
      FSL12_S_CONTROL => net_gnd0,
      FSL12_S_EXISTS => net_gnd0,
      FSL12_M_CLK => open,
      FSL12_M_WRITE => open,
      FSL12_M_DATA => open,
      FSL12_M_CONTROL => open,
      FSL12_M_FULL => net_gnd0,
      FSL13_S_CLK => open,
      FSL13_S_READ => open,
      FSL13_S_DATA => net_gnd32,
      FSL13_S_CONTROL => net_gnd0,
      FSL13_S_EXISTS => net_gnd0,
      FSL13_M_CLK => open,
      FSL13_M_WRITE => open,
      FSL13_M_DATA => open,
      FSL13_M_CONTROL => open,
      FSL13_M_FULL => net_gnd0,
      FSL14_S_CLK => open,
      FSL14_S_READ => open,
      FSL14_S_DATA => net_gnd32,
      FSL14_S_CONTROL => net_gnd0,
      FSL14_S_EXISTS => net_gnd0,
      FSL14_M_CLK => open,
      FSL14_M_WRITE => open,
      FSL14_M_DATA => open,
      FSL14_M_CONTROL => open,
      FSL14_M_FULL => net_gnd0,
      FSL15_S_CLK => open,
      FSL15_S_READ => open,
      FSL15_S_DATA => net_gnd32,
      FSL15_S_CONTROL => net_gnd0,
      FSL15_S_EXISTS => net_gnd0,
      FSL15_M_CLK => open,
      FSL15_M_WRITE => open,
      FSL15_M_DATA => open,
      FSL15_M_CONTROL => open,
      FSL15_M_FULL => net_gnd0,
      M0_AXIS_TLAST => open,
      M0_AXIS_TDATA => open,
      M0_AXIS_TVALID => open,
      M0_AXIS_TREADY => net_gnd0,
      S0_AXIS_TLAST => net_gnd0,
      S0_AXIS_TDATA => net_gnd32(0 to 31),
      S0_AXIS_TVALID => net_gnd0,
      S0_AXIS_TREADY => open,
      M1_AXIS_TLAST => open,
      M1_AXIS_TDATA => open,
      M1_AXIS_TVALID => open,
      M1_AXIS_TREADY => net_gnd0,
      S1_AXIS_TLAST => net_gnd0,
      S1_AXIS_TDATA => net_gnd32(0 to 31),
      S1_AXIS_TVALID => net_gnd0,
      S1_AXIS_TREADY => open,
      M2_AXIS_TLAST => open,
      M2_AXIS_TDATA => open,
      M2_AXIS_TVALID => open,
      M2_AXIS_TREADY => net_gnd0,
      S2_AXIS_TLAST => net_gnd0,
      S2_AXIS_TDATA => net_gnd32(0 to 31),
      S2_AXIS_TVALID => net_gnd0,
      S2_AXIS_TREADY => open,
      M3_AXIS_TLAST => open,
      M3_AXIS_TDATA => open,
      M3_AXIS_TVALID => open,
      M3_AXIS_TREADY => net_gnd0,
      S3_AXIS_TLAST => net_gnd0,
      S3_AXIS_TDATA => net_gnd32(0 to 31),
      S3_AXIS_TVALID => net_gnd0,
      S3_AXIS_TREADY => open,
      M4_AXIS_TLAST => open,
      M4_AXIS_TDATA => open,
      M4_AXIS_TVALID => open,
      M4_AXIS_TREADY => net_gnd0,
      S4_AXIS_TLAST => net_gnd0,
      S4_AXIS_TDATA => net_gnd32(0 to 31),
      S4_AXIS_TVALID => net_gnd0,
      S4_AXIS_TREADY => open,
      M5_AXIS_TLAST => open,
      M5_AXIS_TDATA => open,
      M5_AXIS_TVALID => open,
      M5_AXIS_TREADY => net_gnd0,
      S5_AXIS_TLAST => net_gnd0,
      S5_AXIS_TDATA => net_gnd32(0 to 31),
      S5_AXIS_TVALID => net_gnd0,
      S5_AXIS_TREADY => open,
      M6_AXIS_TLAST => open,
      M6_AXIS_TDATA => open,
      M6_AXIS_TVALID => open,
      M6_AXIS_TREADY => net_gnd0,
      S6_AXIS_TLAST => net_gnd0,
      S6_AXIS_TDATA => net_gnd32(0 to 31),
      S6_AXIS_TVALID => net_gnd0,
      S6_AXIS_TREADY => open,
      M7_AXIS_TLAST => open,
      M7_AXIS_TDATA => open,
      M7_AXIS_TVALID => open,
      M7_AXIS_TREADY => net_gnd0,
      S7_AXIS_TLAST => net_gnd0,
      S7_AXIS_TDATA => net_gnd32(0 to 31),
      S7_AXIS_TVALID => net_gnd0,
      S7_AXIS_TREADY => open,
      M8_AXIS_TLAST => open,
      M8_AXIS_TDATA => open,
      M8_AXIS_TVALID => open,
      M8_AXIS_TREADY => net_gnd0,
      S8_AXIS_TLAST => net_gnd0,
      S8_AXIS_TDATA => net_gnd32(0 to 31),
      S8_AXIS_TVALID => net_gnd0,
      S8_AXIS_TREADY => open,
      M9_AXIS_TLAST => open,
      M9_AXIS_TDATA => open,
      M9_AXIS_TVALID => open,
      M9_AXIS_TREADY => net_gnd0,
      S9_AXIS_TLAST => net_gnd0,
      S9_AXIS_TDATA => net_gnd32(0 to 31),
      S9_AXIS_TVALID => net_gnd0,
      S9_AXIS_TREADY => open,
      M10_AXIS_TLAST => open,
      M10_AXIS_TDATA => open,
      M10_AXIS_TVALID => open,
      M10_AXIS_TREADY => net_gnd0,
      S10_AXIS_TLAST => net_gnd0,
      S10_AXIS_TDATA => net_gnd32(0 to 31),
      S10_AXIS_TVALID => net_gnd0,
      S10_AXIS_TREADY => open,
      M11_AXIS_TLAST => open,
      M11_AXIS_TDATA => open,
      M11_AXIS_TVALID => open,
      M11_AXIS_TREADY => net_gnd0,
      S11_AXIS_TLAST => net_gnd0,
      S11_AXIS_TDATA => net_gnd32(0 to 31),
      S11_AXIS_TVALID => net_gnd0,
      S11_AXIS_TREADY => open,
      M12_AXIS_TLAST => open,
      M12_AXIS_TDATA => open,
      M12_AXIS_TVALID => open,
      M12_AXIS_TREADY => net_gnd0,
      S12_AXIS_TLAST => net_gnd0,
      S12_AXIS_TDATA => net_gnd32(0 to 31),
      S12_AXIS_TVALID => net_gnd0,
      S12_AXIS_TREADY => open,
      M13_AXIS_TLAST => open,
      M13_AXIS_TDATA => open,
      M13_AXIS_TVALID => open,
      M13_AXIS_TREADY => net_gnd0,
      S13_AXIS_TLAST => net_gnd0,
      S13_AXIS_TDATA => net_gnd32(0 to 31),
      S13_AXIS_TVALID => net_gnd0,
      S13_AXIS_TREADY => open,
      M14_AXIS_TLAST => open,
      M14_AXIS_TDATA => open,
      M14_AXIS_TVALID => open,
      M14_AXIS_TREADY => net_gnd0,
      S14_AXIS_TLAST => net_gnd0,
      S14_AXIS_TDATA => net_gnd32(0 to 31),
      S14_AXIS_TVALID => net_gnd0,
      S14_AXIS_TREADY => open,
      M15_AXIS_TLAST => open,
      M15_AXIS_TDATA => open,
      M15_AXIS_TVALID => open,
      M15_AXIS_TREADY => net_gnd0,
      S15_AXIS_TLAST => net_gnd0,
      S15_AXIS_TDATA => net_gnd32(0 to 31),
      S15_AXIS_TVALID => net_gnd0,
      S15_AXIS_TREADY => open,
      ICACHE_FSL_IN_CLK => open,
      ICACHE_FSL_IN_READ => open,
      ICACHE_FSL_IN_DATA => net_gnd32,
      ICACHE_FSL_IN_CONTROL => net_gnd0,
      ICACHE_FSL_IN_EXISTS => net_gnd0,
      ICACHE_FSL_OUT_CLK => open,
      ICACHE_FSL_OUT_WRITE => open,
      ICACHE_FSL_OUT_DATA => open,
      ICACHE_FSL_OUT_CONTROL => open,
      ICACHE_FSL_OUT_FULL => net_gnd0,
      DCACHE_FSL_IN_CLK => open,
      DCACHE_FSL_IN_READ => open,
      DCACHE_FSL_IN_DATA => net_gnd32,
      DCACHE_FSL_IN_CONTROL => net_gnd0,
      DCACHE_FSL_IN_EXISTS => net_gnd0,
      DCACHE_FSL_OUT_CLK => open,
      DCACHE_FSL_OUT_WRITE => open,
      DCACHE_FSL_OUT_DATA => open,
      DCACHE_FSL_OUT_CONTROL => open,
      DCACHE_FSL_OUT_FULL => net_gnd0
    );

  debug_module : system_debug_module_wrapper
    port map (
      Interrupt => open,
      Debug_SYS_Rst => proc_sys_reset_0_MB_Debug_Sys_Rst,
      Ext_BRK => Ext_BRK,
      Ext_NM_BRK => Ext_NM_BRK,
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(0),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(31 downto 0),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(0),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(0),
      S_AXI_WDATA => axi4lite_0_M_WDATA(31 downto 0),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(3 downto 0),
      S_AXI_WVALID => axi4lite_0_M_WVALID(0),
      S_AXI_WREADY => axi4lite_0_M_WREADY(0),
      S_AXI_BRESP => axi4lite_0_M_BRESP(1 downto 0),
      S_AXI_BVALID => axi4lite_0_M_BVALID(0),
      S_AXI_BREADY => axi4lite_0_M_BREADY(0),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(31 downto 0),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(0),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(0),
      S_AXI_RDATA => axi4lite_0_M_RDATA(31 downto 0),
      S_AXI_RRESP => axi4lite_0_M_RRESP(1 downto 0),
      S_AXI_RVALID => axi4lite_0_M_RVALID(0),
      S_AXI_RREADY => axi4lite_0_M_RREADY(0),
      SPLB_Clk => net_gnd0,
      SPLB_Rst => net_gnd0,
      PLB_ABus => net_gnd32,
      PLB_UABus => net_gnd32,
      PLB_PAValid => net_gnd0,
      PLB_SAValid => net_gnd0,
      PLB_rdPrim => net_gnd0,
      PLB_wrPrim => net_gnd0,
      PLB_masterID => net_gnd3,
      PLB_abort => net_gnd0,
      PLB_busLock => net_gnd0,
      PLB_RNW => net_gnd0,
      PLB_BE => net_gnd4,
      PLB_MSize => net_gnd2,
      PLB_size => net_gnd4,
      PLB_type => net_gnd3,
      PLB_lockErr => net_gnd0,
      PLB_wrDBus => net_gnd32,
      PLB_wrBurst => net_gnd0,
      PLB_rdBurst => net_gnd0,
      PLB_wrPendReq => net_gnd0,
      PLB_rdPendReq => net_gnd0,
      PLB_wrPendPri => net_gnd2,
      PLB_rdPendPri => net_gnd2,
      PLB_reqPri => net_gnd2,
      PLB_TAttribute => net_gnd16,
      Sl_addrAck => open,
      Sl_SSize => open,
      Sl_wait => open,
      Sl_rearbitrate => open,
      Sl_wrDAck => open,
      Sl_wrComp => open,
      Sl_wrBTerm => open,
      Sl_rdDBus => open,
      Sl_rdWdAddr => open,
      Sl_rdDAck => open,
      Sl_rdComp => open,
      Sl_rdBTerm => open,
      Sl_MBusy => open,
      Sl_MWrErr => open,
      Sl_MRdErr => open,
      Sl_MIRQ => open,
      Dbg_Clk_0 => microblaze_0_debug_Dbg_Clk,
      Dbg_TDI_0 => microblaze_0_debug_Dbg_TDI,
      Dbg_TDO_0 => microblaze_0_debug_Dbg_TDO,
      Dbg_Reg_En_0 => microblaze_0_debug_Dbg_Reg_En,
      Dbg_Capture_0 => microblaze_0_debug_Dbg_Capture,
      Dbg_Shift_0 => microblaze_0_debug_Dbg_Shift,
      Dbg_Update_0 => microblaze_0_debug_Dbg_Update,
      Dbg_Rst_0 => microblaze_0_debug_Debug_Rst,
      Dbg_Clk_1 => open,
      Dbg_TDI_1 => open,
      Dbg_TDO_1 => net_gnd0,
      Dbg_Reg_En_1 => open,
      Dbg_Capture_1 => open,
      Dbg_Shift_1 => open,
      Dbg_Update_1 => open,
      Dbg_Rst_1 => open,
      Dbg_Clk_2 => open,
      Dbg_TDI_2 => open,
      Dbg_TDO_2 => net_gnd0,
      Dbg_Reg_En_2 => open,
      Dbg_Capture_2 => open,
      Dbg_Shift_2 => open,
      Dbg_Update_2 => open,
      Dbg_Rst_2 => open,
      Dbg_Clk_3 => open,
      Dbg_TDI_3 => open,
      Dbg_TDO_3 => net_gnd0,
      Dbg_Reg_En_3 => open,
      Dbg_Capture_3 => open,
      Dbg_Shift_3 => open,
      Dbg_Update_3 => open,
      Dbg_Rst_3 => open,
      Dbg_Clk_4 => open,
      Dbg_TDI_4 => open,
      Dbg_TDO_4 => net_gnd0,
      Dbg_Reg_En_4 => open,
      Dbg_Capture_4 => open,
      Dbg_Shift_4 => open,
      Dbg_Update_4 => open,
      Dbg_Rst_4 => open,
      Dbg_Clk_5 => open,
      Dbg_TDI_5 => open,
      Dbg_TDO_5 => net_gnd0,
      Dbg_Reg_En_5 => open,
      Dbg_Capture_5 => open,
      Dbg_Shift_5 => open,
      Dbg_Update_5 => open,
      Dbg_Rst_5 => open,
      Dbg_Clk_6 => open,
      Dbg_TDI_6 => open,
      Dbg_TDO_6 => net_gnd0,
      Dbg_Reg_En_6 => open,
      Dbg_Capture_6 => open,
      Dbg_Shift_6 => open,
      Dbg_Update_6 => open,
      Dbg_Rst_6 => open,
      Dbg_Clk_7 => open,
      Dbg_TDI_7 => open,
      Dbg_TDO_7 => net_gnd0,
      Dbg_Reg_En_7 => open,
      Dbg_Capture_7 => open,
      Dbg_Shift_7 => open,
      Dbg_Update_7 => open,
      Dbg_Rst_7 => open,
      Dbg_Clk_8 => open,
      Dbg_TDI_8 => open,
      Dbg_TDO_8 => net_gnd0,
      Dbg_Reg_En_8 => open,
      Dbg_Capture_8 => open,
      Dbg_Shift_8 => open,
      Dbg_Update_8 => open,
      Dbg_Rst_8 => open,
      Dbg_Clk_9 => open,
      Dbg_TDI_9 => open,
      Dbg_TDO_9 => net_gnd0,
      Dbg_Reg_En_9 => open,
      Dbg_Capture_9 => open,
      Dbg_Shift_9 => open,
      Dbg_Update_9 => open,
      Dbg_Rst_9 => open,
      Dbg_Clk_10 => open,
      Dbg_TDI_10 => open,
      Dbg_TDO_10 => net_gnd0,
      Dbg_Reg_En_10 => open,
      Dbg_Capture_10 => open,
      Dbg_Shift_10 => open,
      Dbg_Update_10 => open,
      Dbg_Rst_10 => open,
      Dbg_Clk_11 => open,
      Dbg_TDI_11 => open,
      Dbg_TDO_11 => net_gnd0,
      Dbg_Reg_En_11 => open,
      Dbg_Capture_11 => open,
      Dbg_Shift_11 => open,
      Dbg_Update_11 => open,
      Dbg_Rst_11 => open,
      Dbg_Clk_12 => open,
      Dbg_TDI_12 => open,
      Dbg_TDO_12 => net_gnd0,
      Dbg_Reg_En_12 => open,
      Dbg_Capture_12 => open,
      Dbg_Shift_12 => open,
      Dbg_Update_12 => open,
      Dbg_Rst_12 => open,
      Dbg_Clk_13 => open,
      Dbg_TDI_13 => open,
      Dbg_TDO_13 => net_gnd0,
      Dbg_Reg_En_13 => open,
      Dbg_Capture_13 => open,
      Dbg_Shift_13 => open,
      Dbg_Update_13 => open,
      Dbg_Rst_13 => open,
      Dbg_Clk_14 => open,
      Dbg_TDI_14 => open,
      Dbg_TDO_14 => net_gnd0,
      Dbg_Reg_En_14 => open,
      Dbg_Capture_14 => open,
      Dbg_Shift_14 => open,
      Dbg_Update_14 => open,
      Dbg_Rst_14 => open,
      Dbg_Clk_15 => open,
      Dbg_TDI_15 => open,
      Dbg_TDO_15 => net_gnd0,
      Dbg_Reg_En_15 => open,
      Dbg_Capture_15 => open,
      Dbg_Shift_15 => open,
      Dbg_Update_15 => open,
      Dbg_Rst_15 => open,
      Dbg_Clk_16 => open,
      Dbg_TDI_16 => open,
      Dbg_TDO_16 => net_gnd0,
      Dbg_Reg_En_16 => open,
      Dbg_Capture_16 => open,
      Dbg_Shift_16 => open,
      Dbg_Update_16 => open,
      Dbg_Rst_16 => open,
      Dbg_Clk_17 => open,
      Dbg_TDI_17 => open,
      Dbg_TDO_17 => net_gnd0,
      Dbg_Reg_En_17 => open,
      Dbg_Capture_17 => open,
      Dbg_Shift_17 => open,
      Dbg_Update_17 => open,
      Dbg_Rst_17 => open,
      Dbg_Clk_18 => open,
      Dbg_TDI_18 => open,
      Dbg_TDO_18 => net_gnd0,
      Dbg_Reg_En_18 => open,
      Dbg_Capture_18 => open,
      Dbg_Shift_18 => open,
      Dbg_Update_18 => open,
      Dbg_Rst_18 => open,
      Dbg_Clk_19 => open,
      Dbg_TDI_19 => open,
      Dbg_TDO_19 => net_gnd0,
      Dbg_Reg_En_19 => open,
      Dbg_Capture_19 => open,
      Dbg_Shift_19 => open,
      Dbg_Update_19 => open,
      Dbg_Rst_19 => open,
      Dbg_Clk_20 => open,
      Dbg_TDI_20 => open,
      Dbg_TDO_20 => net_gnd0,
      Dbg_Reg_En_20 => open,
      Dbg_Capture_20 => open,
      Dbg_Shift_20 => open,
      Dbg_Update_20 => open,
      Dbg_Rst_20 => open,
      Dbg_Clk_21 => open,
      Dbg_TDI_21 => open,
      Dbg_TDO_21 => net_gnd0,
      Dbg_Reg_En_21 => open,
      Dbg_Capture_21 => open,
      Dbg_Shift_21 => open,
      Dbg_Update_21 => open,
      Dbg_Rst_21 => open,
      Dbg_Clk_22 => open,
      Dbg_TDI_22 => open,
      Dbg_TDO_22 => net_gnd0,
      Dbg_Reg_En_22 => open,
      Dbg_Capture_22 => open,
      Dbg_Shift_22 => open,
      Dbg_Update_22 => open,
      Dbg_Rst_22 => open,
      Dbg_Clk_23 => open,
      Dbg_TDI_23 => open,
      Dbg_TDO_23 => net_gnd0,
      Dbg_Reg_En_23 => open,
      Dbg_Capture_23 => open,
      Dbg_Shift_23 => open,
      Dbg_Update_23 => open,
      Dbg_Rst_23 => open,
      Dbg_Clk_24 => open,
      Dbg_TDI_24 => open,
      Dbg_TDO_24 => net_gnd0,
      Dbg_Reg_En_24 => open,
      Dbg_Capture_24 => open,
      Dbg_Shift_24 => open,
      Dbg_Update_24 => open,
      Dbg_Rst_24 => open,
      Dbg_Clk_25 => open,
      Dbg_TDI_25 => open,
      Dbg_TDO_25 => net_gnd0,
      Dbg_Reg_En_25 => open,
      Dbg_Capture_25 => open,
      Dbg_Shift_25 => open,
      Dbg_Update_25 => open,
      Dbg_Rst_25 => open,
      Dbg_Clk_26 => open,
      Dbg_TDI_26 => open,
      Dbg_TDO_26 => net_gnd0,
      Dbg_Reg_En_26 => open,
      Dbg_Capture_26 => open,
      Dbg_Shift_26 => open,
      Dbg_Update_26 => open,
      Dbg_Rst_26 => open,
      Dbg_Clk_27 => open,
      Dbg_TDI_27 => open,
      Dbg_TDO_27 => net_gnd0,
      Dbg_Reg_En_27 => open,
      Dbg_Capture_27 => open,
      Dbg_Shift_27 => open,
      Dbg_Update_27 => open,
      Dbg_Rst_27 => open,
      Dbg_Clk_28 => open,
      Dbg_TDI_28 => open,
      Dbg_TDO_28 => net_gnd0,
      Dbg_Reg_En_28 => open,
      Dbg_Capture_28 => open,
      Dbg_Shift_28 => open,
      Dbg_Update_28 => open,
      Dbg_Rst_28 => open,
      Dbg_Clk_29 => open,
      Dbg_TDI_29 => open,
      Dbg_TDO_29 => net_gnd0,
      Dbg_Reg_En_29 => open,
      Dbg_Capture_29 => open,
      Dbg_Shift_29 => open,
      Dbg_Update_29 => open,
      Dbg_Rst_29 => open,
      Dbg_Clk_30 => open,
      Dbg_TDI_30 => open,
      Dbg_TDO_30 => net_gnd0,
      Dbg_Reg_En_30 => open,
      Dbg_Capture_30 => open,
      Dbg_Shift_30 => open,
      Dbg_Update_30 => open,
      Dbg_Rst_30 => open,
      Dbg_Clk_31 => open,
      Dbg_TDI_31 => open,
      Dbg_TDO_31 => net_gnd0,
      Dbg_Reg_En_31 => open,
      Dbg_Capture_31 => open,
      Dbg_Shift_31 => open,
      Dbg_Update_31 => open,
      Dbg_Rst_31 => open,
      bscan_tdi => open,
      bscan_reset => open,
      bscan_shift => open,
      bscan_update => open,
      bscan_capture => open,
      bscan_sel1 => open,
      bscan_drck1 => open,
      bscan_tdo1 => net_gnd0,
      bscan_ext_tdi => net_gnd0,
      bscan_ext_reset => net_gnd0,
      bscan_ext_shift => net_gnd0,
      bscan_ext_update => net_gnd0,
      bscan_ext_capture => net_gnd0,
      bscan_ext_sel => net_gnd0,
      bscan_ext_drck => net_gnd0,
      bscan_ext_tdo => open,
      Ext_JTAG_DRCK => open,
      Ext_JTAG_RESET => open,
      Ext_JTAG_SEL => open,
      Ext_JTAG_CAPTURE => open,
      Ext_JTAG_SHIFT => open,
      Ext_JTAG_UPDATE => open,
      Ext_JTAG_TDI => open,
      Ext_JTAG_TDO => net_gnd0
    );

  clock_generator_0 : system_clock_generator_0_wrapper
    port map (
      CLKIN => clk,
      CLKOUT0 => clk_100_0000MHz(0),
      CLKOUT1 => clock_generator_0_CLKOUT1,
      CLKOUT2 => clock_generator_0_CLKOUT2,
      CLKOUT3 => open,
      CLKOUT4 => open,
      CLKOUT5 => open,
      CLKOUT6 => open,
      CLKOUT7 => open,
      CLKOUT8 => open,
      CLKOUT9 => open,
      CLKOUT10 => open,
      CLKOUT11 => open,
      CLKOUT12 => open,
      CLKOUT13 => open,
      CLKOUT14 => open,
      CLKOUT15 => open,
      CLKFBIN => net_gnd0,
      CLKFBOUT => open,
      PSCLK => net_gnd0,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSDONE => open,
      RST => RESET,
      LOCKED => proc_sys_reset_0_Dcm_locked
    );

  axi4lite_0 : system_axi4lite_0_wrapper
    port map (
      INTERCONNECT_ACLK => pgassign3(6),
      INTERCONNECT_ARESETN => proc_sys_reset_0_Interconnect_aresetn(0),
      S_AXI_ARESET_OUT_N => open,
      M_AXI_ARESET_OUT_N => axi4lite_0_M_ARESETN,
      IRQ => open,
      S_AXI_ACLK => pgassign3(6 downto 6),
      S_AXI_AWID => axi4lite_0_S_AWID(0 to 0),
      S_AXI_AWADDR => axi4lite_0_S_AWADDR,
      S_AXI_AWLEN => axi4lite_0_S_AWLEN,
      S_AXI_AWSIZE => axi4lite_0_S_AWSIZE,
      S_AXI_AWBURST => axi4lite_0_S_AWBURST,
      S_AXI_AWLOCK => axi4lite_0_S_AWLOCK,
      S_AXI_AWCACHE => axi4lite_0_S_AWCACHE,
      S_AXI_AWPROT => axi4lite_0_S_AWPROT,
      S_AXI_AWQOS => axi4lite_0_S_AWQOS,
      S_AXI_AWUSER => net_gnd1(0 to 0),
      S_AXI_AWVALID => axi4lite_0_S_AWVALID(0 to 0),
      S_AXI_AWREADY => axi4lite_0_S_AWREADY(0 to 0),
      S_AXI_WID => net_gnd1(0 to 0),
      S_AXI_WDATA => axi4lite_0_S_WDATA,
      S_AXI_WSTRB => axi4lite_0_S_WSTRB,
      S_AXI_WLAST => axi4lite_0_S_WLAST(0 to 0),
      S_AXI_WUSER => net_gnd1(0 to 0),
      S_AXI_WVALID => axi4lite_0_S_WVALID(0 to 0),
      S_AXI_WREADY => axi4lite_0_S_WREADY(0 to 0),
      S_AXI_BID => axi4lite_0_S_BID(0 downto 0),
      S_AXI_BRESP => axi4lite_0_S_BRESP,
      S_AXI_BUSER => open,
      S_AXI_BVALID => axi4lite_0_S_BVALID(0 to 0),
      S_AXI_BREADY => axi4lite_0_S_BREADY(0 to 0),
      S_AXI_ARID => axi4lite_0_S_ARID(0 to 0),
      S_AXI_ARADDR => axi4lite_0_S_ARADDR,
      S_AXI_ARLEN => axi4lite_0_S_ARLEN,
      S_AXI_ARSIZE => axi4lite_0_S_ARSIZE,
      S_AXI_ARBURST => axi4lite_0_S_ARBURST,
      S_AXI_ARLOCK => axi4lite_0_S_ARLOCK,
      S_AXI_ARCACHE => axi4lite_0_S_ARCACHE,
      S_AXI_ARPROT => axi4lite_0_S_ARPROT,
      S_AXI_ARQOS => axi4lite_0_S_ARQOS,
      S_AXI_ARUSER => net_gnd1(0 to 0),
      S_AXI_ARVALID => axi4lite_0_S_ARVALID(0 to 0),
      S_AXI_ARREADY => axi4lite_0_S_ARREADY(0 to 0),
      S_AXI_RID => axi4lite_0_S_RID(0 downto 0),
      S_AXI_RDATA => axi4lite_0_S_RDATA,
      S_AXI_RRESP => axi4lite_0_S_RRESP,
      S_AXI_RLAST => axi4lite_0_S_RLAST(0 to 0),
      S_AXI_RUSER => open,
      S_AXI_RVALID => axi4lite_0_S_RVALID(0 to 0),
      S_AXI_RREADY => axi4lite_0_S_RREADY(0 to 0),
      M_AXI_ACLK => pgassign3,
      M_AXI_AWID => axi4lite_0_M_AWID,
      M_AXI_AWADDR => axi4lite_0_M_AWADDR,
      M_AXI_AWLEN => axi4lite_0_M_AWLEN,
      M_AXI_AWSIZE => axi4lite_0_M_AWSIZE,
      M_AXI_AWBURST => axi4lite_0_M_AWBURST,
      M_AXI_AWLOCK => open,
      M_AXI_AWCACHE => axi4lite_0_M_AWCACHE,
      M_AXI_AWPROT => open,
      M_AXI_AWREGION => open,
      M_AXI_AWQOS => open,
      M_AXI_AWUSER => open,
      M_AXI_AWVALID => axi4lite_0_M_AWVALID,
      M_AXI_AWREADY => axi4lite_0_M_AWREADY,
      M_AXI_WID => open,
      M_AXI_WDATA => axi4lite_0_M_WDATA,
      M_AXI_WSTRB => axi4lite_0_M_WSTRB,
      M_AXI_WLAST => axi4lite_0_M_WLAST,
      M_AXI_WUSER => open,
      M_AXI_WVALID => axi4lite_0_M_WVALID,
      M_AXI_WREADY => axi4lite_0_M_WREADY,
      M_AXI_BID => axi4lite_0_M_BID,
      M_AXI_BRESP => axi4lite_0_M_BRESP,
      M_AXI_BUSER => net_gnd7,
      M_AXI_BVALID => axi4lite_0_M_BVALID,
      M_AXI_BREADY => axi4lite_0_M_BREADY,
      M_AXI_ARID => axi4lite_0_M_ARID,
      M_AXI_ARADDR => axi4lite_0_M_ARADDR,
      M_AXI_ARLEN => axi4lite_0_M_ARLEN,
      M_AXI_ARSIZE => axi4lite_0_M_ARSIZE,
      M_AXI_ARBURST => axi4lite_0_M_ARBURST,
      M_AXI_ARLOCK => open,
      M_AXI_ARCACHE => open,
      M_AXI_ARPROT => open,
      M_AXI_ARREGION => open,
      M_AXI_ARQOS => open,
      M_AXI_ARUSER => open,
      M_AXI_ARVALID => axi4lite_0_M_ARVALID,
      M_AXI_ARREADY => axi4lite_0_M_ARREADY,
      M_AXI_RID => axi4lite_0_M_RID,
      M_AXI_RDATA => axi4lite_0_M_RDATA,
      M_AXI_RRESP => axi4lite_0_M_RRESP,
      M_AXI_RLAST => axi4lite_0_M_RLAST,
      M_AXI_RUSER => net_gnd7,
      M_AXI_RVALID => axi4lite_0_M_RVALID,
      M_AXI_RREADY => axi4lite_0_M_RREADY,
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0,
      INTERCONNECT_ARESET_OUT_N => open,
      DEBUG_AW_TRANS_SEQ => open,
      DEBUG_AW_ARB_GRANT => open,
      DEBUG_AR_TRANS_SEQ => open,
      DEBUG_AR_ARB_GRANT => open,
      DEBUG_AW_TRANS_QUAL => open,
      DEBUG_AW_ACCEPT_CNT => open,
      DEBUG_AW_ACTIVE_THREAD => open,
      DEBUG_AW_ACTIVE_TARGET => open,
      DEBUG_AW_ACTIVE_REGION => open,
      DEBUG_AW_ERROR => open,
      DEBUG_AW_TARGET => open,
      DEBUG_AR_TRANS_QUAL => open,
      DEBUG_AR_ACCEPT_CNT => open,
      DEBUG_AR_ACTIVE_THREAD => open,
      DEBUG_AR_ACTIVE_TARGET => open,
      DEBUG_AR_ACTIVE_REGION => open,
      DEBUG_AR_ERROR => open,
      DEBUG_AR_TARGET => open,
      DEBUG_B_TRANS_SEQ => open,
      DEBUG_R_BEAT_CNT => open,
      DEBUG_R_TRANS_SEQ => open,
      DEBUG_AW_ISSUING_CNT => open,
      DEBUG_AR_ISSUING_CNT => open,
      DEBUG_W_BEAT_CNT => open,
      DEBUG_W_TRANS_SEQ => open,
      DEBUG_BID_TARGET => open,
      DEBUG_BID_ERROR => open,
      DEBUG_RID_TARGET => open,
      DEBUG_RID_ERROR => open,
      DEBUG_SR_SC_ARADDR => open,
      DEBUG_SR_SC_ARADDRCONTROL => open,
      DEBUG_SR_SC_AWADDR => open,
      DEBUG_SR_SC_AWADDRCONTROL => open,
      DEBUG_SR_SC_BRESP => open,
      DEBUG_SR_SC_RDATA => open,
      DEBUG_SR_SC_RDATACONTROL => open,
      DEBUG_SR_SC_WDATA => open,
      DEBUG_SR_SC_WDATACONTROL => open,
      DEBUG_SC_SF_ARADDR => open,
      DEBUG_SC_SF_ARADDRCONTROL => open,
      DEBUG_SC_SF_AWADDR => open,
      DEBUG_SC_SF_AWADDRCONTROL => open,
      DEBUG_SC_SF_BRESP => open,
      DEBUG_SC_SF_RDATA => open,
      DEBUG_SC_SF_RDATACONTROL => open,
      DEBUG_SC_SF_WDATA => open,
      DEBUG_SC_SF_WDATACONTROL => open,
      DEBUG_SF_CB_ARADDR => open,
      DEBUG_SF_CB_ARADDRCONTROL => open,
      DEBUG_SF_CB_AWADDR => open,
      DEBUG_SF_CB_AWADDRCONTROL => open,
      DEBUG_SF_CB_BRESP => open,
      DEBUG_SF_CB_RDATA => open,
      DEBUG_SF_CB_RDATACONTROL => open,
      DEBUG_SF_CB_WDATA => open,
      DEBUG_SF_CB_WDATACONTROL => open,
      DEBUG_CB_MF_ARADDR => open,
      DEBUG_CB_MF_ARADDRCONTROL => open,
      DEBUG_CB_MF_AWADDR => open,
      DEBUG_CB_MF_AWADDRCONTROL => open,
      DEBUG_CB_MF_BRESP => open,
      DEBUG_CB_MF_RDATA => open,
      DEBUG_CB_MF_RDATACONTROL => open,
      DEBUG_CB_MF_WDATA => open,
      DEBUG_CB_MF_WDATACONTROL => open,
      DEBUG_MF_MC_ARADDR => open,
      DEBUG_MF_MC_ARADDRCONTROL => open,
      DEBUG_MF_MC_AWADDR => open,
      DEBUG_MF_MC_AWADDRCONTROL => open,
      DEBUG_MF_MC_BRESP => open,
      DEBUG_MF_MC_RDATA => open,
      DEBUG_MF_MC_RDATACONTROL => open,
      DEBUG_MF_MC_WDATA => open,
      DEBUG_MF_MC_WDATACONTROL => open,
      DEBUG_MC_MP_ARADDR => open,
      DEBUG_MC_MP_ARADDRCONTROL => open,
      DEBUG_MC_MP_AWADDR => open,
      DEBUG_MC_MP_AWADDRCONTROL => open,
      DEBUG_MC_MP_BRESP => open,
      DEBUG_MC_MP_RDATA => open,
      DEBUG_MC_MP_RDATACONTROL => open,
      DEBUG_MC_MP_WDATA => open,
      DEBUG_MC_MP_WDATACONTROL => open,
      DEBUG_MP_MR_ARADDR => open,
      DEBUG_MP_MR_ARADDRCONTROL => open,
      DEBUG_MP_MR_AWADDR => open,
      DEBUG_MP_MR_AWADDRCONTROL => open,
      DEBUG_MP_MR_BRESP => open,
      DEBUG_MP_MR_RDATA => open,
      DEBUG_MP_MR_RDATACONTROL => open,
      DEBUG_MP_MR_WDATA => open,
      DEBUG_MP_MR_WDATACONTROL => open
    );

  RS232 : system_rs232_wrapper
    port map (
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(1),
      Interrupt => open,
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(35 downto 32),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(1),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(1),
      S_AXI_WDATA => axi4lite_0_M_WDATA(63 downto 32),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(7 downto 4),
      S_AXI_WVALID => axi4lite_0_M_WVALID(1),
      S_AXI_WREADY => axi4lite_0_M_WREADY(1),
      S_AXI_BRESP => axi4lite_0_M_BRESP(3 downto 2),
      S_AXI_BVALID => axi4lite_0_M_BVALID(1),
      S_AXI_BREADY => axi4lite_0_M_BREADY(1),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(35 downto 32),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(1),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(1),
      S_AXI_RDATA => axi4lite_0_M_RDATA(63 downto 32),
      S_AXI_RRESP => axi4lite_0_M_RRESP(3 downto 2),
      S_AXI_RVALID => axi4lite_0_M_RVALID(1),
      S_AXI_RREADY => axi4lite_0_M_RREADY(1),
      RX => RS232_Uart_1_sin,
      TX => RS232_Uart_1_sout
    );

  Generic_SPI : system_generic_spi_wrapper
    port map (
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(2),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(95 downto 64),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(2),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(2),
      S_AXI_WDATA => axi4lite_0_M_WDATA(95 downto 64),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(11 downto 8),
      S_AXI_WVALID => axi4lite_0_M_WVALID(2),
      S_AXI_WREADY => axi4lite_0_M_WREADY(2),
      S_AXI_BRESP => axi4lite_0_M_BRESP(5 downto 4),
      S_AXI_BVALID => axi4lite_0_M_BVALID(2),
      S_AXI_BREADY => axi4lite_0_M_BREADY(2),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(95 downto 64),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(2),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(2),
      S_AXI_RDATA => axi4lite_0_M_RDATA(95 downto 64),
      S_AXI_RRESP => axi4lite_0_M_RRESP(5 downto 4),
      S_AXI_RVALID => axi4lite_0_M_RVALID(2),
      S_AXI_RREADY => axi4lite_0_M_RREADY(2),
      SCK_I => SPI_FLASH_SCLK_I,
      SCK_O => SPI_FLASH_SCLK_O,
      SCK_T => SPI_FLASH_SCLK_T,
      MISO_I => SPI_FLASH_MISO_I,
      MISO_O => SPI_FLASH_MISO_O,
      MISO_T => SPI_FLASH_MISO_T,
      MOSI_I => SPI_FLASH_MOSI_I,
      MOSI_O => SPI_FLASH_MOSI_O,
      MOSI_T => SPI_FLASH_MOSI_T,
      SPISEL => net_vcc0,
      SS_I => SPI_FLASH_SS_I(0 to 0),
      SS_O => SPI_FLASH_SS_O(0 to 0),
      SS_T => SPI_FLASH_SS_T,
      IP2INTC_Irpt => open
    );

  axi_gpio_0 : system_axi_gpio_0_wrapper
    port map (
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(3),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(104 downto 96),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(3),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(3),
      S_AXI_WDATA => axi4lite_0_M_WDATA(127 downto 96),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(15 downto 12),
      S_AXI_WVALID => axi4lite_0_M_WVALID(3),
      S_AXI_WREADY => axi4lite_0_M_WREADY(3),
      S_AXI_BRESP => axi4lite_0_M_BRESP(7 downto 6),
      S_AXI_BVALID => axi4lite_0_M_BVALID(3),
      S_AXI_BREADY => axi4lite_0_M_BREADY(3),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(104 downto 96),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(3),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(3),
      S_AXI_RDATA => axi4lite_0_M_RDATA(127 downto 96),
      S_AXI_RRESP => axi4lite_0_M_RRESP(7 downto 6),
      S_AXI_RVALID => axi4lite_0_M_RVALID(3),
      S_AXI_RREADY => axi4lite_0_M_RREADY(3),
      IP2INTC_Irpt => open,
      GPIO_IO_I => axi_gpio_0_GPIO_IO_I,
      GPIO_IO_O => axi_gpio_0_GPIO_IO_O,
      GPIO_IO_T => axi_gpio_0_GPIO_IO_T,
      GPIO2_IO_I => axi_gpio_0_GPIO2_IO_I,
      GPIO2_IO_O => axi_gpio_0_GPIO2_IO_O,
      GPIO2_IO_T => axi_gpio_0_GPIO2_IO_T
    );

  axi_plbv46_bridge_0 : system_axi_plbv46_bridge_0_wrapper
    port map (
      S_AXI_AWID => axi4lite_0_M_AWID(4 downto 4),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(159 downto 128),
      S_AXI_AWLEN => axi4lite_0_M_AWLEN(39 downto 32),
      S_AXI_AWSIZE => axi4lite_0_M_AWSIZE(14 downto 12),
      S_AXI_AWBURST => axi4lite_0_M_AWBURST(9 downto 8),
      S_AXI_AWCACHE => axi4lite_0_M_AWCACHE(19 downto 16),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(4),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(4),
      S_AXI_WDATA => axi4lite_0_M_WDATA(159 downto 128),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(19 downto 16),
      S_AXI_WLAST => axi4lite_0_M_WLAST(4),
      S_AXI_WVALID => axi4lite_0_M_WVALID(4),
      S_AXI_WREADY => axi4lite_0_M_WREADY(4),
      S_AXI_BID => axi4lite_0_M_BID(4 downto 4),
      S_AXI_BRESP => axi4lite_0_M_BRESP(9 downto 8),
      S_AXI_BVALID => axi4lite_0_M_BVALID(4),
      S_AXI_BREADY => axi4lite_0_M_BREADY(4),
      S_AXI_ARID => axi4lite_0_M_ARID(4 downto 4),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(159 downto 128),
      S_AXI_ARLEN => axi4lite_0_M_ARLEN(39 downto 32),
      S_AXI_ARSIZE => axi4lite_0_M_ARSIZE(14 downto 12),
      S_AXI_ARBURST => axi4lite_0_M_ARBURST(9 downto 8),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(4),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(4),
      S_AXI_RID => axi4lite_0_M_RID(4 downto 4),
      S_AXI_RDATA => axi4lite_0_M_RDATA(159 downto 128),
      S_AXI_RRESP => axi4lite_0_M_RRESP(9 downto 8),
      S_AXI_RLAST => axi4lite_0_M_RLAST(4),
      S_AXI_RVALID => axi4lite_0_M_RVALID(4),
      S_AXI_RREADY => axi4lite_0_M_RREADY(4),
      S_AXI_CTRL_AWADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_AWVALID => net_gnd0,
      S_AXI_CTRL_AWREADY => open,
      S_AXI_CTRL_WDATA => net_gnd32(0 to 31),
      S_AXI_CTRL_WSTRB => net_gnd4(0 to 3),
      S_AXI_CTRL_WVALID => net_gnd0,
      S_AXI_CTRL_WREADY => open,
      S_AXI_CTRL_BRESP => open,
      S_AXI_CTRL_BVALID => open,
      S_AXI_CTRL_BREADY => net_gnd0,
      S_AXI_CTRL_ARADDR => net_gnd32(0 to 31),
      S_AXI_CTRL_ARVALID => net_gnd0,
      S_AXI_CTRL_ARREADY => open,
      S_AXI_CTRL_RDATA => open,
      S_AXI_CTRL_RRESP => open,
      S_AXI_CTRL_RVALID => open,
      S_AXI_CTRL_RREADY => net_gnd0,
      MPLB_Clk => pgassign3(6),
      MPLB_Rst => plb_v46_0_MPLB_Rst(0),
      Bridge_Interrupt => open,
      MD_Error => open,
      M_request => plb_v46_0_M_request(0),
      M_priority => plb_v46_0_M_priority(0 to 1),
      M_busLock => plb_v46_0_M_busLock(0),
      M_RNW => plb_v46_0_M_RNW(0),
      M_BE => plb_v46_0_M_BE(0 to 7),
      M_MSize => plb_v46_0_M_MSize(0 to 1),
      M_size => plb_v46_0_M_size(0 to 3),
      M_type => plb_v46_0_M_type(0 to 2),
      M_ABus => plb_v46_0_M_ABus(0 to 31),
      M_wrBurst => plb_v46_0_M_wrBurst(0),
      M_rdBurst => plb_v46_0_M_rdBurst(0),
      M_wrDBus => plb_v46_0_M_wrDBus(0 to 63),
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck(0),
      PLB_MSSize => plb_v46_0_PLB_MSSize(0 to 1),
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate(0),
      PLB_MTimeout => plb_v46_0_PLB_MTimeout(0),
      PLB_MRdErr => plb_v46_0_PLB_MRdErr(0),
      PLB_MWrErr => plb_v46_0_PLB_MWrErr(0),
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus(0 to 63),
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck(0),
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm(0),
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck(0),
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm(0),
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr(0 to 3),
      M_TAttribute => plb_v46_0_M_TAttribute(0 to 15),
      M_lockErr => plb_v46_0_M_lockErr(0),
      M_abort => plb_v46_0_M_abort(0),
      M_UABus => plb_v46_0_M_UABus(0 to 31),
      PLB_MBusy => plb_v46_0_PLB_MBusy(0),
      PLB_MIRQ => plb_v46_0_PLB_MIRQ(0)
    );

  axi_timer_0 : system_axi_timer_0_wrapper
    port map (
      CaptureTrig0 => net_gnd0,
      CaptureTrig1 => net_gnd0,
      GenerateOut0 => open,
      GenerateOut1 => open,
      PWM0 => open,
      Interrupt => axi_timer_0_Interrupt(0),
      Freeze => net_gnd0,
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(5),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(164 downto 160),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(5),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(5),
      S_AXI_WDATA => axi4lite_0_M_WDATA(191 downto 160),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(23 downto 20),
      S_AXI_WVALID => axi4lite_0_M_WVALID(5),
      S_AXI_WREADY => axi4lite_0_M_WREADY(5),
      S_AXI_BRESP => axi4lite_0_M_BRESP(11 downto 10),
      S_AXI_BVALID => axi4lite_0_M_BVALID(5),
      S_AXI_BREADY => axi4lite_0_M_BREADY(5),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(164 downto 160),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(5),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(5),
      S_AXI_RDATA => axi4lite_0_M_RDATA(191 downto 160),
      S_AXI_RRESP => axi4lite_0_M_RRESP(11 downto 10),
      S_AXI_RVALID => axi4lite_0_M_RVALID(5),
      S_AXI_RREADY => axi4lite_0_M_RREADY(5)
    );

  plb_v46_0 : system_plb_v46_0_wrapper
    port map (
      PLB_Clk => pgassign3(6),
      SYS_Rst => proc_sys_reset_0_Peripheral_Reset(0),
      PLB_Rst => open,
      SPLB_Rst => plb_v46_0_SPLB_Rst,
      MPLB_Rst => plb_v46_0_MPLB_Rst,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb_v46_0_M_ABus,
      M_UABus => plb_v46_0_M_UABus,
      M_BE => plb_v46_0_M_BE,
      M_RNW => plb_v46_0_M_RNW,
      M_abort => plb_v46_0_M_abort,
      M_busLock => plb_v46_0_M_busLock,
      M_TAttribute => plb_v46_0_M_TAttribute,
      M_lockErr => plb_v46_0_M_lockErr,
      M_MSize => plb_v46_0_M_MSize,
      M_priority => plb_v46_0_M_priority,
      M_rdBurst => plb_v46_0_M_rdBurst,
      M_request => plb_v46_0_M_request,
      M_size => plb_v46_0_M_size,
      M_type => plb_v46_0_M_type,
      M_wrBurst => plb_v46_0_M_wrBurst,
      M_wrDBus => plb_v46_0_M_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck,
      Sl_MRdErr => plb_v46_0_Sl_MRdErr,
      Sl_MWrErr => plb_v46_0_Sl_MWrErr,
      Sl_MBusy => plb_v46_0_Sl_MBusy,
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm,
      Sl_rdComp => plb_v46_0_Sl_rdComp,
      Sl_rdDAck => plb_v46_0_Sl_rdDAck,
      Sl_rdDBus => plb_v46_0_Sl_rdDBus,
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr,
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate,
      Sl_SSize => plb_v46_0_Sl_SSize,
      Sl_wait => plb_v46_0_Sl_wait,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm,
      Sl_wrComp => plb_v46_0_Sl_wrComp,
      Sl_wrDAck => plb_v46_0_Sl_wrDAck,
      Sl_MIRQ => plb_v46_0_Sl_MIRQ,
      PLB_MIRQ => plb_v46_0_PLB_MIRQ,
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck,
      PLB_MTimeout => plb_v46_0_PLB_MTimeout,
      PLB_MBusy => plb_v46_0_PLB_MBusy,
      PLB_MRdErr => plb_v46_0_PLB_MRdErr,
      PLB_MWrErr => plb_v46_0_PLB_MWrErr,
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm,
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck,
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus,
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate,
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm,
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck,
      PLB_MSSize => plb_v46_0_PLB_MSSize,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrPrim => plb_v46_0_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  xps_tft_0 : system_xps_tft_0_wrapper
    port map (
      SPLB_Clk => pgassign3(6),
      SPLB_Rst => plb_v46_0_SPLB_Rst(0),
      MPLB_Clk => pgassign3(6),
      MPLB_Rst => plb_v46_0_MPLB_Rst(1),
      MD_error => open,
      IP2INTC_Irpt => open,
      M_request => plb_v46_0_M_request(1),
      M_priority => plb_v46_0_M_priority(2 to 3),
      M_busLock => plb_v46_0_M_busLock(1),
      M_RNW => plb_v46_0_M_RNW(1),
      M_BE => plb_v46_0_M_BE(8 to 15),
      M_MSize => plb_v46_0_M_MSize(2 to 3),
      M_size => plb_v46_0_M_size(4 to 7),
      M_type => plb_v46_0_M_type(3 to 5),
      M_ABus => plb_v46_0_M_ABus(32 to 63),
      M_wrBurst => plb_v46_0_M_wrBurst(1),
      M_rdBurst => plb_v46_0_M_rdBurst(1),
      M_wrDBus => plb_v46_0_M_wrDBus(64 to 127),
      PLB_MSSize => plb_v46_0_PLB_MSSize(2 to 3),
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck(1),
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate(1),
      PLB_MTimeout => plb_v46_0_PLB_MTimeout(1),
      PLB_MRdErr => plb_v46_0_PLB_MRdErr(1),
      PLB_MWrErr => plb_v46_0_PLB_MWrErr(1),
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus(64 to 127),
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck(1),
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck(1),
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm(1),
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm(1),
      M_TAttribute => plb_v46_0_M_TAttribute(16 to 31),
      M_lockErr => plb_v46_0_M_lockErr(1),
      M_abort => plb_v46_0_M_abort(1),
      M_UABus => plb_v46_0_M_UABus(32 to 63),
      PLB_MBusy => plb_v46_0_PLB_MBusy(1),
      PLB_MIRQ => plb_v46_0_PLB_MIRQ(1),
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr(4 to 7),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(0),
      Sl_SSize => plb_v46_0_Sl_SSize(0 to 1),
      Sl_wait => plb_v46_0_Sl_wait(0),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(0),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(0),
      Sl_wrComp => plb_v46_0_Sl_wrComp(0),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(0 to 63),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(0),
      Sl_rdComp => plb_v46_0_Sl_rdComp(0),
      Sl_MBusy => plb_v46_0_Sl_MBusy(0 to 1),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(0 to 1),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(0 to 1),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(0),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(0),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(0 to 3),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(0),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(0 to 1),
      DCR_Clk => net_gnd0,
      DCR_Rst => net_gnd0,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      DCR_ABus => net_gnd10,
      DCR_Sl_DBus => net_gnd32,
      Sl_DCRDBus => open,
      Sl_DCRAck => open,
      SYS_TFT_Clk => clock_generator_0_CLKOUT2,
      TFT_HSYNC => xps_tft_0_TFT_HSYNC,
      TFT_VSYNC => xps_tft_0_TFT_VSYNC,
      TFT_DE => open,
      TFT_DPS => open,
      TFT_VGA_CLK => open,
      TFT_VGA_R => xps_tft_0_TFT_VGA_R,
      TFT_VGA_G => xps_tft_0_TFT_VGA_G,
      TFT_VGA_B => xps_tft_0_TFT_VGA_B,
      TFT_DVI_CLK_P => open,
      TFT_DVI_CLK_N => open,
      TFT_DVI_DATA => open,
      TFT_IIC_SCL_I => net_gnd0,
      TFT_IIC_SCL_O => open,
      TFT_IIC_SCL_T => open,
      TFT_IIC_SDA_I => net_gnd0,
      TFT_IIC_SDA_O => open,
      TFT_IIC_SDA_T => open
    );

  xps_mch_emc_0 : system_xps_mch_emc_0_wrapper
    port map (
      MCH_SPLB_Clk => pgassign3(6),
      RdClk => pgassign3(6),
      MCH_SPLB_Rst => plb_v46_0_SPLB_Rst(1),
      MCH0_Access_Control => net_gnd0,
      MCH0_Access_Data => net_gnd32,
      MCH0_Access_Write => net_gnd0,
      MCH0_Access_Full => open,
      MCH0_ReadData_Control => open,
      MCH0_ReadData_Data => open,
      MCH0_ReadData_Read => net_gnd0,
      MCH0_ReadData_Exists => open,
      MCH1_Access_Control => net_gnd0,
      MCH1_Access_Data => net_gnd32,
      MCH1_Access_Write => net_gnd0,
      MCH1_Access_Full => open,
      MCH1_ReadData_Control => open,
      MCH1_ReadData_Data => open,
      MCH1_ReadData_Read => net_gnd0,
      MCH1_ReadData_Exists => open,
      MCH2_Access_Control => net_gnd0,
      MCH2_Access_Data => net_gnd32,
      MCH2_Access_Write => net_gnd0,
      MCH2_Access_Full => open,
      MCH2_ReadData_Control => open,
      MCH2_ReadData_Data => open,
      MCH2_ReadData_Read => net_gnd0,
      MCH2_ReadData_Exists => open,
      MCH3_Access_Control => net_gnd0,
      MCH3_Access_Data => net_gnd32,
      MCH3_Access_Write => net_gnd0,
      MCH3_Access_Full => open,
      MCH3_ReadData_Control => open,
      MCH3_ReadData_Data => open,
      MCH3_ReadData_Read => net_gnd0,
      MCH3_ReadData_Exists => open,
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(1),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(1),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(1),
      Sl_SSize => plb_v46_0_Sl_SSize(2 to 3),
      Sl_wait => plb_v46_0_Sl_wait(1),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(1),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(1),
      Sl_wrComp => plb_v46_0_Sl_wrComp(1),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(1),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(64 to 127),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(4 to 7),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(1),
      Sl_rdComp => plb_v46_0_Sl_rdComp(1),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(1),
      Sl_MBusy => plb_v46_0_Sl_MBusy(2 to 3),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(2 to 3),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(2 to 3),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(2 to 3),
      Mem_DQ_I => xps_mch_emc_0_Mem_DQ_I,
      Mem_DQ_O => xps_mch_emc_0_Mem_DQ_O,
      Mem_DQ_T => xps_mch_emc_0_Mem_DQ_T,
      Mem_A => pgassign4,
      Mem_RPN => open,
      Mem_CEN => xps_mch_emc_0_Mem_CEN(0 to 0),
      Mem_OEN => xps_mch_emc_0_Mem_OEN(0 to 0),
      Mem_WEN => xps_mch_emc_0_Mem_WEN,
      Mem_QWEN => open,
      Mem_BEN => xps_mch_emc_0_Mem_BEN,
      Mem_CE => open,
      Mem_ADV_LDN => open,
      Mem_LBON => open,
      Mem_CKEN => open,
      Mem_RNW => open
    );

  axi_intc_0 : system_axi_intc_0_wrapper
    port map (
      S_AXI_ACLK => pgassign3(6),
      S_AXI_ARESETN => axi4lite_0_M_ARESETN(6),
      S_AXI_AWADDR => axi4lite_0_M_AWADDR(200 downto 192),
      S_AXI_AWVALID => axi4lite_0_M_AWVALID(6),
      S_AXI_AWREADY => axi4lite_0_M_AWREADY(6),
      S_AXI_WDATA => axi4lite_0_M_WDATA(223 downto 192),
      S_AXI_WSTRB => axi4lite_0_M_WSTRB(27 downto 24),
      S_AXI_WVALID => axi4lite_0_M_WVALID(6),
      S_AXI_WREADY => axi4lite_0_M_WREADY(6),
      S_AXI_BRESP => axi4lite_0_M_BRESP(13 downto 12),
      S_AXI_BVALID => axi4lite_0_M_BVALID(6),
      S_AXI_BREADY => axi4lite_0_M_BREADY(6),
      S_AXI_ARADDR => axi4lite_0_M_ARADDR(200 downto 192),
      S_AXI_ARVALID => axi4lite_0_M_ARVALID(6),
      S_AXI_ARREADY => axi4lite_0_M_ARREADY(6),
      S_AXI_RDATA => axi4lite_0_M_RDATA(223 downto 192),
      S_AXI_RRESP => axi4lite_0_M_RRESP(13 downto 12),
      S_AXI_RVALID => axi4lite_0_M_RVALID(6),
      S_AXI_RREADY => axi4lite_0_M_RREADY(6),
      Intr => axi_timer_0_Interrupt(0 downto 0),
      Irq => axi_intc_0_INTERRUPT_Interrupt,
      Interrupt_address => axi_intc_0_INTERRUPT_Interrupt_Address(0 to 31),
      Processor_ack => axi_intc_0_INTERRUPT_Interrupt_Ack,
      Processor_clk => net_gnd0,
      Processor_rst => net_gnd0,
      Interrupt_address_in => net_gnd32(0 to 31),
      Processor_ack_out => open
    );

  iobuf_0 : IOBUF
    port map (
      I => SPI_FLASH_SS_O(0),
      IO => aclSS,
      O => SPI_FLASH_SS_I(0),
      T => SPI_FLASH_SS_T
    );

  iobuf_1 : IOBUF
    port map (
      I => SPI_FLASH_SCLK_O,
      IO => aclSCK,
      O => SPI_FLASH_SCLK_I,
      T => SPI_FLASH_SCLK_T
    );

  iobuf_2 : IOBUF
    port map (
      I => SPI_FLASH_MOSI_O,
      IO => aclMOSI,
      O => SPI_FLASH_MOSI_I,
      T => SPI_FLASH_MOSI_T
    );

  iobuf_3 : IOBUF
    port map (
      I => SPI_FLASH_MISO_O,
      IO => aclMISO,
      O => SPI_FLASH_MISO_I,
      T => SPI_FLASH_MISO_T
    );

  iobuf_4 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(7),
      IO => axi_gpio_0_GPIO_IO_pin(7),
      O => axi_gpio_0_GPIO_IO_I(7),
      T => axi_gpio_0_GPIO_IO_T(7)
    );

  iobuf_5 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(6),
      IO => axi_gpio_0_GPIO_IO_pin(6),
      O => axi_gpio_0_GPIO_IO_I(6),
      T => axi_gpio_0_GPIO_IO_T(6)
    );

  iobuf_6 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(5),
      IO => axi_gpio_0_GPIO_IO_pin(5),
      O => axi_gpio_0_GPIO_IO_I(5),
      T => axi_gpio_0_GPIO_IO_T(5)
    );

  iobuf_7 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(4),
      IO => axi_gpio_0_GPIO_IO_pin(4),
      O => axi_gpio_0_GPIO_IO_I(4),
      T => axi_gpio_0_GPIO_IO_T(4)
    );

  iobuf_8 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(3),
      IO => axi_gpio_0_GPIO_IO_pin(3),
      O => axi_gpio_0_GPIO_IO_I(3),
      T => axi_gpio_0_GPIO_IO_T(3)
    );

  iobuf_9 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(2),
      IO => axi_gpio_0_GPIO_IO_pin(2),
      O => axi_gpio_0_GPIO_IO_I(2),
      T => axi_gpio_0_GPIO_IO_T(2)
    );

  iobuf_10 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(1),
      IO => axi_gpio_0_GPIO_IO_pin(1),
      O => axi_gpio_0_GPIO_IO_I(1),
      T => axi_gpio_0_GPIO_IO_T(1)
    );

  iobuf_11 : IOBUF
    port map (
      I => axi_gpio_0_GPIO_IO_O(0),
      IO => axi_gpio_0_GPIO_IO_pin(0),
      O => axi_gpio_0_GPIO_IO_I(0),
      T => axi_gpio_0_GPIO_IO_T(0)
    );

  iobuf_12 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(7),
      IO => axi_gpio_0_GPIO2_IO_pin(7),
      O => axi_gpio_0_GPIO2_IO_I(7),
      T => axi_gpio_0_GPIO2_IO_T(7)
    );

  iobuf_13 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(6),
      IO => axi_gpio_0_GPIO2_IO_pin(6),
      O => axi_gpio_0_GPIO2_IO_I(6),
      T => axi_gpio_0_GPIO2_IO_T(6)
    );

  iobuf_14 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(5),
      IO => axi_gpio_0_GPIO2_IO_pin(5),
      O => axi_gpio_0_GPIO2_IO_I(5),
      T => axi_gpio_0_GPIO2_IO_T(5)
    );

  iobuf_15 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(4),
      IO => axi_gpio_0_GPIO2_IO_pin(4),
      O => axi_gpio_0_GPIO2_IO_I(4),
      T => axi_gpio_0_GPIO2_IO_T(4)
    );

  iobuf_16 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(3),
      IO => axi_gpio_0_GPIO2_IO_pin(3),
      O => axi_gpio_0_GPIO2_IO_I(3),
      T => axi_gpio_0_GPIO2_IO_T(3)
    );

  iobuf_17 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(2),
      IO => axi_gpio_0_GPIO2_IO_pin(2),
      O => axi_gpio_0_GPIO2_IO_I(2),
      T => axi_gpio_0_GPIO2_IO_T(2)
    );

  iobuf_18 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(1),
      IO => axi_gpio_0_GPIO2_IO_pin(1),
      O => axi_gpio_0_GPIO2_IO_I(1),
      T => axi_gpio_0_GPIO2_IO_T(1)
    );

  iobuf_19 : IOBUF
    port map (
      I => axi_gpio_0_GPIO2_IO_O(0),
      IO => axi_gpio_0_GPIO2_IO_pin(0),
      O => axi_gpio_0_GPIO2_IO_I(0),
      T => axi_gpio_0_GPIO2_IO_T(0)
    );

  iobuf_20 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(0),
      IO => xps_mch_emc_0_Mem_DQ_pin(0),
      O => xps_mch_emc_0_Mem_DQ_I(0),
      T => xps_mch_emc_0_Mem_DQ_T(0)
    );

  iobuf_21 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(1),
      IO => xps_mch_emc_0_Mem_DQ_pin(1),
      O => xps_mch_emc_0_Mem_DQ_I(1),
      T => xps_mch_emc_0_Mem_DQ_T(1)
    );

  iobuf_22 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(2),
      IO => xps_mch_emc_0_Mem_DQ_pin(2),
      O => xps_mch_emc_0_Mem_DQ_I(2),
      T => xps_mch_emc_0_Mem_DQ_T(2)
    );

  iobuf_23 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(3),
      IO => xps_mch_emc_0_Mem_DQ_pin(3),
      O => xps_mch_emc_0_Mem_DQ_I(3),
      T => xps_mch_emc_0_Mem_DQ_T(3)
    );

  iobuf_24 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(4),
      IO => xps_mch_emc_0_Mem_DQ_pin(4),
      O => xps_mch_emc_0_Mem_DQ_I(4),
      T => xps_mch_emc_0_Mem_DQ_T(4)
    );

  iobuf_25 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(5),
      IO => xps_mch_emc_0_Mem_DQ_pin(5),
      O => xps_mch_emc_0_Mem_DQ_I(5),
      T => xps_mch_emc_0_Mem_DQ_T(5)
    );

  iobuf_26 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(6),
      IO => xps_mch_emc_0_Mem_DQ_pin(6),
      O => xps_mch_emc_0_Mem_DQ_I(6),
      T => xps_mch_emc_0_Mem_DQ_T(6)
    );

  iobuf_27 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(7),
      IO => xps_mch_emc_0_Mem_DQ_pin(7),
      O => xps_mch_emc_0_Mem_DQ_I(7),
      T => xps_mch_emc_0_Mem_DQ_T(7)
    );

  iobuf_28 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(8),
      IO => xps_mch_emc_0_Mem_DQ_pin(8),
      O => xps_mch_emc_0_Mem_DQ_I(8),
      T => xps_mch_emc_0_Mem_DQ_T(8)
    );

  iobuf_29 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(9),
      IO => xps_mch_emc_0_Mem_DQ_pin(9),
      O => xps_mch_emc_0_Mem_DQ_I(9),
      T => xps_mch_emc_0_Mem_DQ_T(9)
    );

  iobuf_30 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(10),
      IO => xps_mch_emc_0_Mem_DQ_pin(10),
      O => xps_mch_emc_0_Mem_DQ_I(10),
      T => xps_mch_emc_0_Mem_DQ_T(10)
    );

  iobuf_31 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(11),
      IO => xps_mch_emc_0_Mem_DQ_pin(11),
      O => xps_mch_emc_0_Mem_DQ_I(11),
      T => xps_mch_emc_0_Mem_DQ_T(11)
    );

  iobuf_32 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(12),
      IO => xps_mch_emc_0_Mem_DQ_pin(12),
      O => xps_mch_emc_0_Mem_DQ_I(12),
      T => xps_mch_emc_0_Mem_DQ_T(12)
    );

  iobuf_33 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(13),
      IO => xps_mch_emc_0_Mem_DQ_pin(13),
      O => xps_mch_emc_0_Mem_DQ_I(13),
      T => xps_mch_emc_0_Mem_DQ_T(13)
    );

  iobuf_34 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(14),
      IO => xps_mch_emc_0_Mem_DQ_pin(14),
      O => xps_mch_emc_0_Mem_DQ_I(14),
      T => xps_mch_emc_0_Mem_DQ_T(14)
    );

  iobuf_35 : IOBUF
    port map (
      I => xps_mch_emc_0_Mem_DQ_O(15),
      IO => xps_mch_emc_0_Mem_DQ_pin(15),
      O => xps_mch_emc_0_Mem_DQ_I(15),
      T => xps_mch_emc_0_Mem_DQ_T(15)
    );

end architecture STRUCTURE;

