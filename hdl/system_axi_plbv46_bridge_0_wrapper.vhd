-------------------------------------------------------------------------------
-- system_axi_plbv46_bridge_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_plbv46_bridge_v2_02_a;
use axi_plbv46_bridge_v2_02_a.all;

entity system_axi_plbv46_bridge_0_wrapper is
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

  attribute x_core_info : STRING;
  attribute x_core_info of system_axi_plbv46_bridge_0_wrapper : entity is "axi_plbv46_bridge_v2_02_a";

end system_axi_plbv46_bridge_0_wrapper;

architecture STRUCTURE of system_axi_plbv46_bridge_0_wrapper is

  component axi_plbv46_bridge is
    generic (
      C_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_EN_BYTE_SWAP : INTEGER;
      C_EN_DEBUG_REG : INTEGER;
      C_S_AXI_PROTOCOL : STRING;
      C_S_AXI_SUPPORTS_NARROW_BURST : INTEGER;
      C_S_AXI_SUPPORTS_EXCL_ACCESS : INTEGER;
      C_S_AXI_ID_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_SUPPORTS_WRITE : INTEGER;
      C_S_AXI_SUPPORTS_READ : INTEGER;
      C_S_AXI_WRITE_ACCEPTANCE : INTEGER;
      C_S_AXI_READ_ACCEPTANCE : INTEGER;
      C_S_AXI_SUPPORT_BARRIERS : INTEGER;
      C_S_AXI_CTRL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CTRL_DATA_WIDTH : INTEGER;
      C_S_AXI_CTRL_BASEADDR : std_logic_vector(0 to 31);
      C_S_AXI_CTRL_HIGHADDR : std_logic_vector(0 to 31);
      C_MPLB_AWIDTH : INTEGER;
      C_MPLB_DWIDTH : INTEGER;
      C_MPLB_NATIVE_DWIDTH : INTEGER;
      C_MPLB_SMALLEST_SLAVE : INTEGER;
      C_PLB_ADDR_PIPELINE : INTEGER
    );
    port (
      S_AXI_AWID : in std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWLEN : in std_logic_vector(7 downto 0);
      S_AXI_AWSIZE : in std_logic_vector(2 downto 0);
      S_AXI_AWBURST : in std_logic_vector(1 downto 0);
      S_AXI_AWCACHE : in std_logic_vector(3 downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_AWREADY : out std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WLAST : in std_logic;
      S_AXI_WVALID : in std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BID : out std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARID : in std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARLEN : in std_logic_vector(7 downto 0);
      S_AXI_ARSIZE : in std_logic_vector(2 downto 0);
      S_AXI_ARBURST : in std_logic_vector(1 downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RID : out std_logic_vector((C_S_AXI_ID_WIDTH-1) downto 0);
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RLAST : out std_logic;
      S_AXI_RVALID : out std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_CTRL_AWADDR : in std_logic_vector((C_S_AXI_CTRL_ADDR_WIDTH-1) downto 0);
      S_AXI_CTRL_AWVALID : in std_logic;
      S_AXI_CTRL_AWREADY : out std_logic;
      S_AXI_CTRL_WDATA : in std_logic_vector((C_S_AXI_CTRL_DATA_WIDTH-1) downto 0);
      S_AXI_CTRL_WSTRB : in std_logic_vector(((C_S_AXI_CTRL_DATA_WIDTH/8)-1) downto 0);
      S_AXI_CTRL_WVALID : in std_logic;
      S_AXI_CTRL_WREADY : out std_logic;
      S_AXI_CTRL_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_CTRL_BVALID : out std_logic;
      S_AXI_CTRL_BREADY : in std_logic;
      S_AXI_CTRL_ARADDR : in std_logic_vector((C_S_AXI_CTRL_ADDR_WIDTH-1) downto 0);
      S_AXI_CTRL_ARVALID : in std_logic;
      S_AXI_CTRL_ARREADY : out std_logic;
      S_AXI_CTRL_RDATA : out std_logic_vector((C_S_AXI_CTRL_DATA_WIDTH-1) downto 0);
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
      M_BE : out std_logic_vector(0 to ((C_MPLB_DWIDTH/8)-1));
      M_MSize : out std_logic_vector(0 to 1);
      M_size : out std_logic_vector(0 to 3);
      M_type : out std_logic_vector(0 to 2);
      M_ABus : out std_logic_vector(0 to (C_MPLB_AWIDTH-1));
      M_wrBurst : out std_logic;
      M_rdBurst : out std_logic;
      M_wrDBus : out std_logic_vector(0 to (C_MPLB_DWIDTH-1));
      PLB_MAddrAck : in std_logic;
      PLB_MSSize : in std_logic_vector(0 to 1);
      PLB_MRearbitrate : in std_logic;
      PLB_MTimeout : in std_logic;
      PLB_MRdErr : in std_logic;
      PLB_MWrErr : in std_logic;
      PLB_MRdDBus : in std_logic_vector(0 to (C_MPLB_DWIDTH-1));
      PLB_MRdDAck : in std_logic;
      PLB_MRdBTerm : in std_logic;
      PLB_MWrDAck : in std_logic;
      PLB_MWrBTerm : in std_logic;
      PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      M_TAttribute : out std_logic_vector(0 to 15);
      M_lockErr : out std_logic;
      M_abort : out std_logic;
      M_UABus : out std_logic_vector(0 to (C_MPLB_AWIDTH-1));
      PLB_MBusy : in std_logic;
      PLB_MIRQ : in std_logic
    );
  end component;

begin

  axi_plbv46_bridge_0 : axi_plbv46_bridge
    generic map (
      C_FAMILY => "artix7",
      C_INSTANCE => "axi_plbv46_bridge_0",
      C_EN_BYTE_SWAP => 0,
      C_EN_DEBUG_REG => 0,
      C_S_AXI_PROTOCOL => "AXI4LITE",
      C_S_AXI_SUPPORTS_NARROW_BURST => 0,
      C_S_AXI_SUPPORTS_EXCL_ACCESS => 0,
      C_S_AXI_ID_WIDTH => 1,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_SUPPORTS_WRITE => 1,
      C_S_AXI_SUPPORTS_READ => 1,
      C_S_AXI_WRITE_ACCEPTANCE => 1,
      C_S_AXI_READ_ACCEPTANCE => 1,
      C_S_AXI_SUPPORT_BARRIERS => 0,
      C_S_AXI_CTRL_ADDR_WIDTH => 32,
      C_S_AXI_CTRL_DATA_WIDTH => 32,
      C_S_AXI_CTRL_BASEADDR => X"ffffffff",
      C_S_AXI_CTRL_HIGHADDR => X"00000000",
      C_MPLB_AWIDTH => 32,
      C_MPLB_DWIDTH => 64,
      C_MPLB_NATIVE_DWIDTH => 32,
      C_MPLB_SMALLEST_SLAVE => 32,
      C_PLB_ADDR_PIPELINE => 0
    )
    port map (
      S_AXI_AWID => S_AXI_AWID,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWLEN => S_AXI_AWLEN,
      S_AXI_AWSIZE => S_AXI_AWSIZE,
      S_AXI_AWBURST => S_AXI_AWBURST,
      S_AXI_AWCACHE => S_AXI_AWCACHE,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WLAST => S_AXI_WLAST,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BID => S_AXI_BID,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARID => S_AXI_ARID,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARLEN => S_AXI_ARLEN,
      S_AXI_ARSIZE => S_AXI_ARSIZE,
      S_AXI_ARBURST => S_AXI_ARBURST,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RID => S_AXI_RID,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RLAST => S_AXI_RLAST,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_CTRL_AWADDR => S_AXI_CTRL_AWADDR,
      S_AXI_CTRL_AWVALID => S_AXI_CTRL_AWVALID,
      S_AXI_CTRL_AWREADY => S_AXI_CTRL_AWREADY,
      S_AXI_CTRL_WDATA => S_AXI_CTRL_WDATA,
      S_AXI_CTRL_WSTRB => S_AXI_CTRL_WSTRB,
      S_AXI_CTRL_WVALID => S_AXI_CTRL_WVALID,
      S_AXI_CTRL_WREADY => S_AXI_CTRL_WREADY,
      S_AXI_CTRL_BRESP => S_AXI_CTRL_BRESP,
      S_AXI_CTRL_BVALID => S_AXI_CTRL_BVALID,
      S_AXI_CTRL_BREADY => S_AXI_CTRL_BREADY,
      S_AXI_CTRL_ARADDR => S_AXI_CTRL_ARADDR,
      S_AXI_CTRL_ARVALID => S_AXI_CTRL_ARVALID,
      S_AXI_CTRL_ARREADY => S_AXI_CTRL_ARREADY,
      S_AXI_CTRL_RDATA => S_AXI_CTRL_RDATA,
      S_AXI_CTRL_RRESP => S_AXI_CTRL_RRESP,
      S_AXI_CTRL_RVALID => S_AXI_CTRL_RVALID,
      S_AXI_CTRL_RREADY => S_AXI_CTRL_RREADY,
      MPLB_Clk => MPLB_Clk,
      MPLB_Rst => MPLB_Rst,
      Bridge_Interrupt => Bridge_Interrupt,
      MD_Error => MD_Error,
      M_request => M_request,
      M_priority => M_priority,
      M_busLock => M_busLock,
      M_RNW => M_RNW,
      M_BE => M_BE,
      M_MSize => M_MSize,
      M_size => M_size,
      M_type => M_type,
      M_ABus => M_ABus,
      M_wrBurst => M_wrBurst,
      M_rdBurst => M_rdBurst,
      M_wrDBus => M_wrDBus,
      PLB_MAddrAck => PLB_MAddrAck,
      PLB_MSSize => PLB_MSSize,
      PLB_MRearbitrate => PLB_MRearbitrate,
      PLB_MTimeout => PLB_MTimeout,
      PLB_MRdErr => PLB_MRdErr,
      PLB_MWrErr => PLB_MWrErr,
      PLB_MRdDBus => PLB_MRdDBus,
      PLB_MRdDAck => PLB_MRdDAck,
      PLB_MRdBTerm => PLB_MRdBTerm,
      PLB_MWrDAck => PLB_MWrDAck,
      PLB_MWrBTerm => PLB_MWrBTerm,
      PLB_MRdWdAddr => PLB_MRdWdAddr,
      M_TAttribute => M_TAttribute,
      M_lockErr => M_lockErr,
      M_abort => M_abort,
      M_UABus => M_UABus,
      PLB_MBusy => PLB_MBusy,
      PLB_MIRQ => PLB_MIRQ
    );

end architecture STRUCTURE;

