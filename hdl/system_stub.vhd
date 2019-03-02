-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
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
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
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
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      aclSS => aclSS,
      aclSCK => aclSCK,
      aclMOSI => aclMOSI,
      aclMISO => aclMISO,
      RsTx => RsTx,
      RsRx => RsRx,
      RESET => RESET,
      clk => clk,
      axi_gpio_0_GPIO_IO_pin => axi_gpio_0_GPIO_IO_pin,
      axi_gpio_0_GPIO2_IO_pin => axi_gpio_0_GPIO2_IO_pin,
      xps_mch_emc_0_Mem_A_pin => xps_mch_emc_0_Mem_A_pin,
      xps_mch_emc_0_Mem_CEN_pin => xps_mch_emc_0_Mem_CEN_pin,
      xps_mch_emc_0_Mem_OEN_pin => xps_mch_emc_0_Mem_OEN_pin,
      xps_mch_emc_0_Mem_WEN_pin => xps_mch_emc_0_Mem_WEN_pin,
      xps_mch_emc_0_Mem_BEN_pin => xps_mch_emc_0_Mem_BEN_pin,
      xps_mch_emc_0_Mem_DQ_pin => xps_mch_emc_0_Mem_DQ_pin,
      xps_tft_0_TFT_VGA_R_pin => xps_tft_0_TFT_VGA_R_pin,
      xps_tft_0_TFT_VGA_G_pin => xps_tft_0_TFT_VGA_G_pin,
      xps_tft_0_TFT_VGA_B_pin => xps_tft_0_TFT_VGA_B_pin,
      xps_tft_0_TFT_HSYNC_pin => xps_tft_0_TFT_HSYNC_pin,
      xps_tft_0_TFT_VSYNC_pin => xps_tft_0_TFT_VSYNC_pin,
      RamCLK => RamCLK
    );

end architecture STRUCTURE;

