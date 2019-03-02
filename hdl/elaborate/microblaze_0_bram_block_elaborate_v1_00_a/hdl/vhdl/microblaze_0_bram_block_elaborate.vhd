-------------------------------------------------------------------------------
-- microblaze_0_bram_block_elaborate.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity microblaze_0_bram_block_elaborate is
  generic (
    C_MEMSIZE : integer;
    C_PORT_DWIDTH : integer;
    C_PORT_AWIDTH : integer;
    C_NUM_WE : integer;
    C_FAMILY : string
    );
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_A : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_A : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_A : in std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_B : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_B : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_B : in std_logic_vector(0 to C_PORT_DWIDTH-1)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of microblaze_0_bram_block_elaborate : entity is "yes";

end microblaze_0_bram_block_elaborate;

architecture STRUCTURE of microblaze_0_bram_block_elaborate is

  component RAMB36E1 is
    generic (
      WRITE_MODE_A : string;
      WRITE_MODE_B : string;
      INIT_FILE : string;
      READ_WIDTH_A : integer;
      READ_WIDTH_B : integer;
      WRITE_WIDTH_A : integer;
      WRITE_WIDTH_B : integer;
      RAM_EXTENSION_A : string;
      RAM_EXTENSION_B : string
    );
    port (
      DBITERR : out std_logic;
      ECCPARITY : out std_logic_vector(7 downto 0);
      INJECTDBITERR : in std_logic;
      INJECTSBITERR : in std_logic;
      RDADDRECC : out std_logic_vector(8 downto 0);
      SBITERR : out std_logic;
      ADDRARDADDR : in std_logic_vector(15 downto 0);
      CASCADEINA : in std_logic;
      CASCADEOUTA : out std_logic;
      CLKARDCLK : in std_logic;
      DIADI : in std_logic_vector(31 downto 0);
      DIPADIP : in std_logic_vector(3 downto 0);
      DOADO : out std_logic_vector(31 downto 0);
      DOPADOP : out std_logic_vector(3 downto 0);
      ENARDEN : in std_logic;
      REGCEAREGCE : in std_logic;
      RSTRAMARSTRAM : in std_logic;
      RSTREGARSTREG : in std_logic;
      WEA : in std_logic_vector(3 downto 0);
      ADDRBWRADDR : in std_logic_vector(15 downto 0);
      CASCADEINB : in std_logic;
      CASCADEOUTB : out std_logic;
      CLKBWRCLK : in std_logic;
      DIBDI : in std_logic_vector(31 downto 0);
      DIPBDIP : in std_logic_vector(3 downto 0);
      DOBDO : out std_logic_vector(31 downto 0);
      DOPBDOP : out std_logic_vector(3 downto 0);
      ENBWREN : in std_logic;
      REGCEB : in std_logic;
      RSTRAMB : in std_logic;
      RSTREGB : in std_logic;
      WEBWE : in std_logic_vector(7 downto 0)
    );
  end component;

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb36e1_0: label is " ";
  attribute BMM_INFO of ramb36e1_1: label is " ";
  attribute BMM_INFO of ramb36e1_2: label is " ";
  attribute BMM_INFO of ramb36e1_3: label is " ";
  attribute BMM_INFO of ramb36e1_4: label is " ";
  attribute BMM_INFO of ramb36e1_5: label is " ";
  attribute BMM_INFO of ramb36e1_6: label is " ";
  attribute BMM_INFO of ramb36e1_7: label is " ";
  attribute BMM_INFO of ramb36e1_8: label is " ";
  attribute BMM_INFO of ramb36e1_9: label is " ";
  attribute BMM_INFO of ramb36e1_10: label is " ";
  attribute BMM_INFO of ramb36e1_11: label is " ";
  attribute BMM_INFO of ramb36e1_12: label is " ";
  attribute BMM_INFO of ramb36e1_13: label is " ";
  attribute BMM_INFO of ramb36e1_14: label is " ";
  attribute BMM_INFO of ramb36e1_15: label is " ";
  attribute BMM_INFO of ramb36e1_16: label is " ";
  attribute BMM_INFO of ramb36e1_17: label is " ";
  attribute BMM_INFO of ramb36e1_18: label is " ";
  attribute BMM_INFO of ramb36e1_19: label is " ";
  attribute BMM_INFO of ramb36e1_20: label is " ";
  attribute BMM_INFO of ramb36e1_21: label is " ";
  attribute BMM_INFO of ramb36e1_22: label is " ";
  attribute BMM_INFO of ramb36e1_23: label is " ";
  attribute BMM_INFO of ramb36e1_24: label is " ";
  attribute BMM_INFO of ramb36e1_25: label is " ";
  attribute BMM_INFO of ramb36e1_26: label is " ";
  attribute BMM_INFO of ramb36e1_27: label is " ";
  attribute BMM_INFO of ramb36e1_28: label is " ";
  attribute BMM_INFO of ramb36e1_29: label is " ";
  attribute BMM_INFO of ramb36e1_30: label is " ";
  attribute BMM_INFO of ramb36e1_31: label is " ";
  attribute BMM_INFO of ramb36e1_32: label is " ";
  attribute BMM_INFO of ramb36e1_33: label is " ";
  attribute BMM_INFO of ramb36e1_34: label is " ";
  attribute BMM_INFO of ramb36e1_35: label is " ";
  attribute BMM_INFO of ramb36e1_36: label is " ";
  attribute BMM_INFO of ramb36e1_37: label is " ";
  attribute BMM_INFO of ramb36e1_38: label is " ";
  attribute BMM_INFO of ramb36e1_39: label is " ";
  attribute BMM_INFO of ramb36e1_40: label is " ";
  attribute BMM_INFO of ramb36e1_41: label is " ";
  attribute BMM_INFO of ramb36e1_42: label is " ";
  attribute BMM_INFO of ramb36e1_43: label is " ";
  attribute BMM_INFO of ramb36e1_44: label is " ";
  attribute BMM_INFO of ramb36e1_45: label is " ";
  attribute BMM_INFO of ramb36e1_46: label is " ";
  attribute BMM_INFO of ramb36e1_47: label is " ";
  attribute BMM_INFO of ramb36e1_48: label is " ";
  attribute BMM_INFO of ramb36e1_49: label is " ";
  attribute BMM_INFO of ramb36e1_50: label is " ";
  attribute BMM_INFO of ramb36e1_51: label is " ";
  attribute BMM_INFO of ramb36e1_52: label is " ";
  attribute BMM_INFO of ramb36e1_53: label is " ";
  attribute BMM_INFO of ramb36e1_54: label is " ";
  attribute BMM_INFO of ramb36e1_55: label is " ";
  attribute BMM_INFO of ramb36e1_56: label is " ";
  attribute BMM_INFO of ramb36e1_57: label is " ";
  attribute BMM_INFO of ramb36e1_58: label is " ";
  attribute BMM_INFO of ramb36e1_59: label is " ";
  attribute BMM_INFO of ramb36e1_60: label is " ";
  attribute BMM_INFO of ramb36e1_61: label is " ";
  attribute BMM_INFO of ramb36e1_62: label is " ";
  attribute BMM_INFO of ramb36e1_63: label is " ";
  -- Internal signals

  signal CASCADEA_0 : std_logic;
  signal CASCADEA_1 : std_logic;
  signal CASCADEA_2 : std_logic;
  signal CASCADEA_3 : std_logic;
  signal CASCADEA_4 : std_logic;
  signal CASCADEA_5 : std_logic;
  signal CASCADEA_6 : std_logic;
  signal CASCADEA_7 : std_logic;
  signal CASCADEA_8 : std_logic;
  signal CASCADEA_9 : std_logic;
  signal CASCADEA_10 : std_logic;
  signal CASCADEA_11 : std_logic;
  signal CASCADEA_12 : std_logic;
  signal CASCADEA_13 : std_logic;
  signal CASCADEA_14 : std_logic;
  signal CASCADEA_15 : std_logic;
  signal CASCADEA_16 : std_logic;
  signal CASCADEA_17 : std_logic;
  signal CASCADEA_18 : std_logic;
  signal CASCADEA_19 : std_logic;
  signal CASCADEA_20 : std_logic;
  signal CASCADEA_21 : std_logic;
  signal CASCADEA_22 : std_logic;
  signal CASCADEA_23 : std_logic;
  signal CASCADEA_24 : std_logic;
  signal CASCADEA_25 : std_logic;
  signal CASCADEA_26 : std_logic;
  signal CASCADEA_27 : std_logic;
  signal CASCADEA_28 : std_logic;
  signal CASCADEA_29 : std_logic;
  signal CASCADEA_30 : std_logic;
  signal CASCADEA_31 : std_logic;
  signal CASCADEB_0 : std_logic;
  signal CASCADEB_1 : std_logic;
  signal CASCADEB_2 : std_logic;
  signal CASCADEB_3 : std_logic;
  signal CASCADEB_4 : std_logic;
  signal CASCADEB_5 : std_logic;
  signal CASCADEB_6 : std_logic;
  signal CASCADEB_7 : std_logic;
  signal CASCADEB_8 : std_logic;
  signal CASCADEB_9 : std_logic;
  signal CASCADEB_10 : std_logic;
  signal CASCADEB_11 : std_logic;
  signal CASCADEB_12 : std_logic;
  signal CASCADEB_13 : std_logic;
  signal CASCADEB_14 : std_logic;
  signal CASCADEB_15 : std_logic;
  signal CASCADEB_16 : std_logic;
  signal CASCADEB_17 : std_logic;
  signal CASCADEB_18 : std_logic;
  signal CASCADEB_19 : std_logic;
  signal CASCADEB_20 : std_logic;
  signal CASCADEB_21 : std_logic;
  signal CASCADEB_22 : std_logic;
  signal CASCADEB_23 : std_logic;
  signal CASCADEB_24 : std_logic;
  signal CASCADEB_25 : std_logic;
  signal CASCADEB_26 : std_logic;
  signal CASCADEB_27 : std_logic;
  signal CASCADEB_28 : std_logic;
  signal CASCADEB_29 : std_logic;
  signal CASCADEB_30 : std_logic;
  signal CASCADEB_31 : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 30);
  signal pgassign2 : std_logic_vector(0 to 3);
  signal pgassign3 : std_logic_vector(31 downto 0);
  signal pgassign4 : std_logic_vector(3 downto 0);
  signal pgassign5 : std_logic_vector(31 downto 0);
  signal pgassign6 : std_logic_vector(7 downto 0);
  signal pgassign7 : std_logic_vector(31 downto 0);
  signal pgassign8 : std_logic_vector(3 downto 0);
  signal pgassign9 : std_logic_vector(31 downto 0);
  signal pgassign10 : std_logic_vector(7 downto 0);
  signal pgassign11 : std_logic_vector(31 downto 0);
  signal pgassign12 : std_logic_vector(3 downto 0);
  signal pgassign13 : std_logic_vector(31 downto 0);
  signal pgassign14 : std_logic_vector(7 downto 0);
  signal pgassign15 : std_logic_vector(31 downto 0);
  signal pgassign16 : std_logic_vector(3 downto 0);
  signal pgassign17 : std_logic_vector(31 downto 0);
  signal pgassign18 : std_logic_vector(7 downto 0);
  signal pgassign19 : std_logic_vector(31 downto 0);
  signal pgassign20 : std_logic_vector(3 downto 0);
  signal pgassign21 : std_logic_vector(31 downto 0);
  signal pgassign22 : std_logic_vector(7 downto 0);
  signal pgassign23 : std_logic_vector(31 downto 0);
  signal pgassign24 : std_logic_vector(3 downto 0);
  signal pgassign25 : std_logic_vector(31 downto 0);
  signal pgassign26 : std_logic_vector(7 downto 0);
  signal pgassign27 : std_logic_vector(31 downto 0);
  signal pgassign28 : std_logic_vector(3 downto 0);
  signal pgassign29 : std_logic_vector(31 downto 0);
  signal pgassign30 : std_logic_vector(7 downto 0);
  signal pgassign31 : std_logic_vector(31 downto 0);
  signal pgassign32 : std_logic_vector(3 downto 0);
  signal pgassign33 : std_logic_vector(31 downto 0);
  signal pgassign34 : std_logic_vector(7 downto 0);
  signal pgassign35 : std_logic_vector(31 downto 0);
  signal pgassign36 : std_logic_vector(3 downto 0);
  signal pgassign37 : std_logic_vector(31 downto 0);
  signal pgassign38 : std_logic_vector(7 downto 0);
  signal pgassign39 : std_logic_vector(31 downto 0);
  signal pgassign40 : std_logic_vector(3 downto 0);
  signal pgassign41 : std_logic_vector(31 downto 0);
  signal pgassign42 : std_logic_vector(7 downto 0);
  signal pgassign43 : std_logic_vector(31 downto 0);
  signal pgassign44 : std_logic_vector(3 downto 0);
  signal pgassign45 : std_logic_vector(31 downto 0);
  signal pgassign46 : std_logic_vector(7 downto 0);
  signal pgassign47 : std_logic_vector(31 downto 0);
  signal pgassign48 : std_logic_vector(3 downto 0);
  signal pgassign49 : std_logic_vector(31 downto 0);
  signal pgassign50 : std_logic_vector(7 downto 0);
  signal pgassign51 : std_logic_vector(31 downto 0);
  signal pgassign52 : std_logic_vector(3 downto 0);
  signal pgassign53 : std_logic_vector(31 downto 0);
  signal pgassign54 : std_logic_vector(7 downto 0);
  signal pgassign55 : std_logic_vector(31 downto 0);
  signal pgassign56 : std_logic_vector(3 downto 0);
  signal pgassign57 : std_logic_vector(31 downto 0);
  signal pgassign58 : std_logic_vector(7 downto 0);
  signal pgassign59 : std_logic_vector(31 downto 0);
  signal pgassign60 : std_logic_vector(3 downto 0);
  signal pgassign61 : std_logic_vector(31 downto 0);
  signal pgassign62 : std_logic_vector(7 downto 0);
  signal pgassign63 : std_logic_vector(31 downto 0);
  signal pgassign64 : std_logic_vector(3 downto 0);
  signal pgassign65 : std_logic_vector(31 downto 0);
  signal pgassign66 : std_logic_vector(7 downto 0);
  signal pgassign67 : std_logic_vector(31 downto 0);
  signal pgassign68 : std_logic_vector(3 downto 0);
  signal pgassign69 : std_logic_vector(31 downto 0);
  signal pgassign70 : std_logic_vector(7 downto 0);
  signal pgassign71 : std_logic_vector(31 downto 0);
  signal pgassign72 : std_logic_vector(3 downto 0);
  signal pgassign73 : std_logic_vector(31 downto 0);
  signal pgassign74 : std_logic_vector(7 downto 0);
  signal pgassign75 : std_logic_vector(31 downto 0);
  signal pgassign76 : std_logic_vector(3 downto 0);
  signal pgassign77 : std_logic_vector(31 downto 0);
  signal pgassign78 : std_logic_vector(7 downto 0);
  signal pgassign79 : std_logic_vector(31 downto 0);
  signal pgassign80 : std_logic_vector(3 downto 0);
  signal pgassign81 : std_logic_vector(31 downto 0);
  signal pgassign82 : std_logic_vector(7 downto 0);
  signal pgassign83 : std_logic_vector(31 downto 0);
  signal pgassign84 : std_logic_vector(3 downto 0);
  signal pgassign85 : std_logic_vector(31 downto 0);
  signal pgassign86 : std_logic_vector(7 downto 0);
  signal pgassign87 : std_logic_vector(31 downto 0);
  signal pgassign88 : std_logic_vector(3 downto 0);
  signal pgassign89 : std_logic_vector(31 downto 0);
  signal pgassign90 : std_logic_vector(7 downto 0);
  signal pgassign91 : std_logic_vector(31 downto 0);
  signal pgassign92 : std_logic_vector(3 downto 0);
  signal pgassign93 : std_logic_vector(31 downto 0);
  signal pgassign94 : std_logic_vector(7 downto 0);
  signal pgassign95 : std_logic_vector(31 downto 0);
  signal pgassign96 : std_logic_vector(3 downto 0);
  signal pgassign97 : std_logic_vector(31 downto 0);
  signal pgassign98 : std_logic_vector(7 downto 0);
  signal pgassign99 : std_logic_vector(31 downto 0);
  signal pgassign100 : std_logic_vector(3 downto 0);
  signal pgassign101 : std_logic_vector(31 downto 0);
  signal pgassign102 : std_logic_vector(7 downto 0);
  signal pgassign103 : std_logic_vector(31 downto 0);
  signal pgassign104 : std_logic_vector(3 downto 0);
  signal pgassign105 : std_logic_vector(31 downto 0);
  signal pgassign106 : std_logic_vector(7 downto 0);
  signal pgassign107 : std_logic_vector(31 downto 0);
  signal pgassign108 : std_logic_vector(3 downto 0);
  signal pgassign109 : std_logic_vector(31 downto 0);
  signal pgassign110 : std_logic_vector(7 downto 0);
  signal pgassign111 : std_logic_vector(31 downto 0);
  signal pgassign112 : std_logic_vector(3 downto 0);
  signal pgassign113 : std_logic_vector(31 downto 0);
  signal pgassign114 : std_logic_vector(7 downto 0);
  signal pgassign115 : std_logic_vector(31 downto 0);
  signal pgassign116 : std_logic_vector(3 downto 0);
  signal pgassign117 : std_logic_vector(31 downto 0);
  signal pgassign118 : std_logic_vector(7 downto 0);
  signal pgassign119 : std_logic_vector(31 downto 0);
  signal pgassign120 : std_logic_vector(3 downto 0);
  signal pgassign121 : std_logic_vector(31 downto 0);
  signal pgassign122 : std_logic_vector(7 downto 0);
  signal pgassign123 : std_logic_vector(31 downto 0);
  signal pgassign124 : std_logic_vector(3 downto 0);
  signal pgassign125 : std_logic_vector(31 downto 0);
  signal pgassign126 : std_logic_vector(7 downto 0);
  signal pgassign127 : std_logic_vector(31 downto 0);
  signal pgassign128 : std_logic_vector(3 downto 0);
  signal pgassign129 : std_logic_vector(31 downto 0);
  signal pgassign130 : std_logic_vector(7 downto 0);
  signal pgassign131 : std_logic_vector(31 downto 0);
  signal pgassign132 : std_logic_vector(31 downto 0);
  signal pgassign133 : std_logic_vector(3 downto 0);
  signal pgassign134 : std_logic_vector(31 downto 0);
  signal pgassign135 : std_logic_vector(31 downto 0);
  signal pgassign136 : std_logic_vector(7 downto 0);
  signal pgassign137 : std_logic_vector(31 downto 0);
  signal pgassign138 : std_logic_vector(31 downto 0);
  signal pgassign139 : std_logic_vector(3 downto 0);
  signal pgassign140 : std_logic_vector(31 downto 0);
  signal pgassign141 : std_logic_vector(31 downto 0);
  signal pgassign142 : std_logic_vector(7 downto 0);
  signal pgassign143 : std_logic_vector(31 downto 0);
  signal pgassign144 : std_logic_vector(31 downto 0);
  signal pgassign145 : std_logic_vector(3 downto 0);
  signal pgassign146 : std_logic_vector(31 downto 0);
  signal pgassign147 : std_logic_vector(31 downto 0);
  signal pgassign148 : std_logic_vector(7 downto 0);
  signal pgassign149 : std_logic_vector(31 downto 0);
  signal pgassign150 : std_logic_vector(31 downto 0);
  signal pgassign151 : std_logic_vector(3 downto 0);
  signal pgassign152 : std_logic_vector(31 downto 0);
  signal pgassign153 : std_logic_vector(31 downto 0);
  signal pgassign154 : std_logic_vector(7 downto 0);
  signal pgassign155 : std_logic_vector(31 downto 0);
  signal pgassign156 : std_logic_vector(31 downto 0);
  signal pgassign157 : std_logic_vector(3 downto 0);
  signal pgassign158 : std_logic_vector(31 downto 0);
  signal pgassign159 : std_logic_vector(31 downto 0);
  signal pgassign160 : std_logic_vector(7 downto 0);
  signal pgassign161 : std_logic_vector(31 downto 0);
  signal pgassign162 : std_logic_vector(31 downto 0);
  signal pgassign163 : std_logic_vector(3 downto 0);
  signal pgassign164 : std_logic_vector(31 downto 0);
  signal pgassign165 : std_logic_vector(31 downto 0);
  signal pgassign166 : std_logic_vector(7 downto 0);
  signal pgassign167 : std_logic_vector(31 downto 0);
  signal pgassign168 : std_logic_vector(31 downto 0);
  signal pgassign169 : std_logic_vector(3 downto 0);
  signal pgassign170 : std_logic_vector(31 downto 0);
  signal pgassign171 : std_logic_vector(31 downto 0);
  signal pgassign172 : std_logic_vector(7 downto 0);
  signal pgassign173 : std_logic_vector(31 downto 0);
  signal pgassign174 : std_logic_vector(31 downto 0);
  signal pgassign175 : std_logic_vector(3 downto 0);
  signal pgassign176 : std_logic_vector(31 downto 0);
  signal pgassign177 : std_logic_vector(31 downto 0);
  signal pgassign178 : std_logic_vector(7 downto 0);
  signal pgassign179 : std_logic_vector(31 downto 0);
  signal pgassign180 : std_logic_vector(31 downto 0);
  signal pgassign181 : std_logic_vector(3 downto 0);
  signal pgassign182 : std_logic_vector(31 downto 0);
  signal pgassign183 : std_logic_vector(31 downto 0);
  signal pgassign184 : std_logic_vector(7 downto 0);
  signal pgassign185 : std_logic_vector(31 downto 0);
  signal pgassign186 : std_logic_vector(31 downto 0);
  signal pgassign187 : std_logic_vector(3 downto 0);
  signal pgassign188 : std_logic_vector(31 downto 0);
  signal pgassign189 : std_logic_vector(31 downto 0);
  signal pgassign190 : std_logic_vector(7 downto 0);
  signal pgassign191 : std_logic_vector(31 downto 0);
  signal pgassign192 : std_logic_vector(31 downto 0);
  signal pgassign193 : std_logic_vector(3 downto 0);
  signal pgassign194 : std_logic_vector(31 downto 0);
  signal pgassign195 : std_logic_vector(31 downto 0);
  signal pgassign196 : std_logic_vector(7 downto 0);
  signal pgassign197 : std_logic_vector(31 downto 0);
  signal pgassign198 : std_logic_vector(31 downto 0);
  signal pgassign199 : std_logic_vector(3 downto 0);
  signal pgassign200 : std_logic_vector(31 downto 0);
  signal pgassign201 : std_logic_vector(31 downto 0);
  signal pgassign202 : std_logic_vector(7 downto 0);
  signal pgassign203 : std_logic_vector(31 downto 0);
  signal pgassign204 : std_logic_vector(31 downto 0);
  signal pgassign205 : std_logic_vector(3 downto 0);
  signal pgassign206 : std_logic_vector(31 downto 0);
  signal pgassign207 : std_logic_vector(31 downto 0);
  signal pgassign208 : std_logic_vector(7 downto 0);
  signal pgassign209 : std_logic_vector(31 downto 0);
  signal pgassign210 : std_logic_vector(31 downto 0);
  signal pgassign211 : std_logic_vector(3 downto 0);
  signal pgassign212 : std_logic_vector(31 downto 0);
  signal pgassign213 : std_logic_vector(31 downto 0);
  signal pgassign214 : std_logic_vector(7 downto 0);
  signal pgassign215 : std_logic_vector(31 downto 0);
  signal pgassign216 : std_logic_vector(31 downto 0);
  signal pgassign217 : std_logic_vector(3 downto 0);
  signal pgassign218 : std_logic_vector(31 downto 0);
  signal pgassign219 : std_logic_vector(31 downto 0);
  signal pgassign220 : std_logic_vector(7 downto 0);
  signal pgassign221 : std_logic_vector(31 downto 0);
  signal pgassign222 : std_logic_vector(31 downto 0);
  signal pgassign223 : std_logic_vector(3 downto 0);
  signal pgassign224 : std_logic_vector(31 downto 0);
  signal pgassign225 : std_logic_vector(31 downto 0);
  signal pgassign226 : std_logic_vector(7 downto 0);
  signal pgassign227 : std_logic_vector(31 downto 0);
  signal pgassign228 : std_logic_vector(31 downto 0);
  signal pgassign229 : std_logic_vector(3 downto 0);
  signal pgassign230 : std_logic_vector(31 downto 0);
  signal pgassign231 : std_logic_vector(31 downto 0);
  signal pgassign232 : std_logic_vector(7 downto 0);
  signal pgassign233 : std_logic_vector(31 downto 0);
  signal pgassign234 : std_logic_vector(31 downto 0);
  signal pgassign235 : std_logic_vector(3 downto 0);
  signal pgassign236 : std_logic_vector(31 downto 0);
  signal pgassign237 : std_logic_vector(31 downto 0);
  signal pgassign238 : std_logic_vector(7 downto 0);
  signal pgassign239 : std_logic_vector(31 downto 0);
  signal pgassign240 : std_logic_vector(31 downto 0);
  signal pgassign241 : std_logic_vector(3 downto 0);
  signal pgassign242 : std_logic_vector(31 downto 0);
  signal pgassign243 : std_logic_vector(31 downto 0);
  signal pgassign244 : std_logic_vector(7 downto 0);
  signal pgassign245 : std_logic_vector(31 downto 0);
  signal pgassign246 : std_logic_vector(31 downto 0);
  signal pgassign247 : std_logic_vector(3 downto 0);
  signal pgassign248 : std_logic_vector(31 downto 0);
  signal pgassign249 : std_logic_vector(31 downto 0);
  signal pgassign250 : std_logic_vector(7 downto 0);
  signal pgassign251 : std_logic_vector(31 downto 0);
  signal pgassign252 : std_logic_vector(31 downto 0);
  signal pgassign253 : std_logic_vector(3 downto 0);
  signal pgassign254 : std_logic_vector(31 downto 0);
  signal pgassign255 : std_logic_vector(31 downto 0);
  signal pgassign256 : std_logic_vector(7 downto 0);
  signal pgassign257 : std_logic_vector(31 downto 0);
  signal pgassign258 : std_logic_vector(31 downto 0);
  signal pgassign259 : std_logic_vector(3 downto 0);
  signal pgassign260 : std_logic_vector(31 downto 0);
  signal pgassign261 : std_logic_vector(31 downto 0);
  signal pgassign262 : std_logic_vector(7 downto 0);
  signal pgassign263 : std_logic_vector(31 downto 0);
  signal pgassign264 : std_logic_vector(31 downto 0);
  signal pgassign265 : std_logic_vector(3 downto 0);
  signal pgassign266 : std_logic_vector(31 downto 0);
  signal pgassign267 : std_logic_vector(31 downto 0);
  signal pgassign268 : std_logic_vector(7 downto 0);
  signal pgassign269 : std_logic_vector(31 downto 0);
  signal pgassign270 : std_logic_vector(31 downto 0);
  signal pgassign271 : std_logic_vector(3 downto 0);
  signal pgassign272 : std_logic_vector(31 downto 0);
  signal pgassign273 : std_logic_vector(31 downto 0);
  signal pgassign274 : std_logic_vector(7 downto 0);
  signal pgassign275 : std_logic_vector(31 downto 0);
  signal pgassign276 : std_logic_vector(31 downto 0);
  signal pgassign277 : std_logic_vector(3 downto 0);
  signal pgassign278 : std_logic_vector(31 downto 0);
  signal pgassign279 : std_logic_vector(31 downto 0);
  signal pgassign280 : std_logic_vector(7 downto 0);
  signal pgassign281 : std_logic_vector(31 downto 0);
  signal pgassign282 : std_logic_vector(31 downto 0);
  signal pgassign283 : std_logic_vector(3 downto 0);
  signal pgassign284 : std_logic_vector(31 downto 0);
  signal pgassign285 : std_logic_vector(31 downto 0);
  signal pgassign286 : std_logic_vector(7 downto 0);
  signal pgassign287 : std_logic_vector(31 downto 0);
  signal pgassign288 : std_logic_vector(31 downto 0);
  signal pgassign289 : std_logic_vector(3 downto 0);
  signal pgassign290 : std_logic_vector(31 downto 0);
  signal pgassign291 : std_logic_vector(31 downto 0);
  signal pgassign292 : std_logic_vector(7 downto 0);
  signal pgassign293 : std_logic_vector(31 downto 0);
  signal pgassign294 : std_logic_vector(31 downto 0);
  signal pgassign295 : std_logic_vector(3 downto 0);
  signal pgassign296 : std_logic_vector(31 downto 0);
  signal pgassign297 : std_logic_vector(31 downto 0);
  signal pgassign298 : std_logic_vector(7 downto 0);
  signal pgassign299 : std_logic_vector(31 downto 0);
  signal pgassign300 : std_logic_vector(31 downto 0);
  signal pgassign301 : std_logic_vector(3 downto 0);
  signal pgassign302 : std_logic_vector(31 downto 0);
  signal pgassign303 : std_logic_vector(31 downto 0);
  signal pgassign304 : std_logic_vector(7 downto 0);
  signal pgassign305 : std_logic_vector(31 downto 0);
  signal pgassign306 : std_logic_vector(31 downto 0);
  signal pgassign307 : std_logic_vector(3 downto 0);
  signal pgassign308 : std_logic_vector(31 downto 0);
  signal pgassign309 : std_logic_vector(31 downto 0);
  signal pgassign310 : std_logic_vector(7 downto 0);
  signal pgassign311 : std_logic_vector(31 downto 0);
  signal pgassign312 : std_logic_vector(31 downto 0);
  signal pgassign313 : std_logic_vector(3 downto 0);
  signal pgassign314 : std_logic_vector(31 downto 0);
  signal pgassign315 : std_logic_vector(31 downto 0);
  signal pgassign316 : std_logic_vector(7 downto 0);
  signal pgassign317 : std_logic_vector(31 downto 0);
  signal pgassign318 : std_logic_vector(31 downto 0);
  signal pgassign319 : std_logic_vector(3 downto 0);
  signal pgassign320 : std_logic_vector(31 downto 0);
  signal pgassign321 : std_logic_vector(31 downto 0);
  signal pgassign322 : std_logic_vector(7 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 30) <= B"0000000000000000000000000000000";
  pgassign2(0 to 3) <= B"0000";
  pgassign3(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign3(0 downto 0) <= BRAM_Dout_A(0 to 0);
  pgassign4(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign4(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign4(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign4(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign5(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign5(0 downto 0) <= BRAM_Dout_B(0 to 0);
  pgassign6(7 downto 4) <= B"0000";
  pgassign6(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign6(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign6(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign6(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign7(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign7(0 downto 0) <= BRAM_Dout_A(1 to 1);
  pgassign8(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign8(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign8(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign8(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign9(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign9(0 downto 0) <= BRAM_Dout_B(1 to 1);
  pgassign10(7 downto 4) <= B"0000";
  pgassign10(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign10(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign10(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign10(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign11(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign11(0 downto 0) <= BRAM_Dout_A(2 to 2);
  pgassign12(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign12(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign12(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign12(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign13(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign13(0 downto 0) <= BRAM_Dout_B(2 to 2);
  pgassign14(7 downto 4) <= B"0000";
  pgassign14(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign14(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign14(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign14(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign15(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign15(0 downto 0) <= BRAM_Dout_A(3 to 3);
  pgassign16(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign16(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign16(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign16(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign17(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign17(0 downto 0) <= BRAM_Dout_B(3 to 3);
  pgassign18(7 downto 4) <= B"0000";
  pgassign18(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign18(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign18(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign18(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign19(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign19(0 downto 0) <= BRAM_Dout_A(4 to 4);
  pgassign20(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign20(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign20(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign20(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign21(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign21(0 downto 0) <= BRAM_Dout_B(4 to 4);
  pgassign22(7 downto 4) <= B"0000";
  pgassign22(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign22(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign22(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign22(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign23(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign23(0 downto 0) <= BRAM_Dout_A(5 to 5);
  pgassign24(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign24(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign24(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign24(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign25(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign25(0 downto 0) <= BRAM_Dout_B(5 to 5);
  pgassign26(7 downto 4) <= B"0000";
  pgassign26(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign26(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign26(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign26(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign27(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign27(0 downto 0) <= BRAM_Dout_A(6 to 6);
  pgassign28(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign28(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign28(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign28(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign29(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign29(0 downto 0) <= BRAM_Dout_B(6 to 6);
  pgassign30(7 downto 4) <= B"0000";
  pgassign30(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign30(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign30(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign30(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign31(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign31(0 downto 0) <= BRAM_Dout_A(7 to 7);
  pgassign32(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign32(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign32(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign32(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign33(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign33(0 downto 0) <= BRAM_Dout_B(7 to 7);
  pgassign34(7 downto 4) <= B"0000";
  pgassign34(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign34(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign34(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign34(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign35(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign35(0 downto 0) <= BRAM_Dout_A(8 to 8);
  pgassign36(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign36(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign36(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign36(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign37(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign37(0 downto 0) <= BRAM_Dout_B(8 to 8);
  pgassign38(7 downto 4) <= B"0000";
  pgassign38(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign38(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign38(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign38(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign39(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign39(0 downto 0) <= BRAM_Dout_A(9 to 9);
  pgassign40(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign40(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign40(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign40(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign41(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign41(0 downto 0) <= BRAM_Dout_B(9 to 9);
  pgassign42(7 downto 4) <= B"0000";
  pgassign42(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign42(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign42(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign42(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign43(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign43(0 downto 0) <= BRAM_Dout_A(10 to 10);
  pgassign44(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign44(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign44(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign44(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign45(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign45(0 downto 0) <= BRAM_Dout_B(10 to 10);
  pgassign46(7 downto 4) <= B"0000";
  pgassign46(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign46(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign46(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign46(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign47(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign47(0 downto 0) <= BRAM_Dout_A(11 to 11);
  pgassign48(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign48(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign48(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign48(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign49(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign49(0 downto 0) <= BRAM_Dout_B(11 to 11);
  pgassign50(7 downto 4) <= B"0000";
  pgassign50(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign50(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign50(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign50(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign51(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign51(0 downto 0) <= BRAM_Dout_A(12 to 12);
  pgassign52(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign52(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign52(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign52(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign53(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign53(0 downto 0) <= BRAM_Dout_B(12 to 12);
  pgassign54(7 downto 4) <= B"0000";
  pgassign54(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign54(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign54(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign54(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign55(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign55(0 downto 0) <= BRAM_Dout_A(13 to 13);
  pgassign56(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign56(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign56(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign56(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign57(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign57(0 downto 0) <= BRAM_Dout_B(13 to 13);
  pgassign58(7 downto 4) <= B"0000";
  pgassign58(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign58(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign58(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign58(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign59(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign59(0 downto 0) <= BRAM_Dout_A(14 to 14);
  pgassign60(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign60(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign60(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign60(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign61(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign61(0 downto 0) <= BRAM_Dout_B(14 to 14);
  pgassign62(7 downto 4) <= B"0000";
  pgassign62(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign62(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign62(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign62(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign63(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign63(0 downto 0) <= BRAM_Dout_A(15 to 15);
  pgassign64(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign64(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign64(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign64(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign65(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign65(0 downto 0) <= BRAM_Dout_B(15 to 15);
  pgassign66(7 downto 4) <= B"0000";
  pgassign66(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign66(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign66(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign66(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign67(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign67(0 downto 0) <= BRAM_Dout_A(16 to 16);
  pgassign68(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign68(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign68(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign68(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign69(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign69(0 downto 0) <= BRAM_Dout_B(16 to 16);
  pgassign70(7 downto 4) <= B"0000";
  pgassign70(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign70(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign70(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign70(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign71(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign71(0 downto 0) <= BRAM_Dout_A(17 to 17);
  pgassign72(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign72(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign72(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign72(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign73(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign73(0 downto 0) <= BRAM_Dout_B(17 to 17);
  pgassign74(7 downto 4) <= B"0000";
  pgassign74(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign74(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign74(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign74(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign75(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign75(0 downto 0) <= BRAM_Dout_A(18 to 18);
  pgassign76(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign76(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign76(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign76(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign77(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign77(0 downto 0) <= BRAM_Dout_B(18 to 18);
  pgassign78(7 downto 4) <= B"0000";
  pgassign78(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign78(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign78(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign78(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign79(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign79(0 downto 0) <= BRAM_Dout_A(19 to 19);
  pgassign80(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign80(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign80(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign80(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign81(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign81(0 downto 0) <= BRAM_Dout_B(19 to 19);
  pgassign82(7 downto 4) <= B"0000";
  pgassign82(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign82(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign82(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign82(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign83(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign83(0 downto 0) <= BRAM_Dout_A(20 to 20);
  pgassign84(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign84(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign84(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign84(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign85(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign85(0 downto 0) <= BRAM_Dout_B(20 to 20);
  pgassign86(7 downto 4) <= B"0000";
  pgassign86(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign86(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign86(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign86(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign87(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign87(0 downto 0) <= BRAM_Dout_A(21 to 21);
  pgassign88(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign88(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign88(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign88(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign89(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign89(0 downto 0) <= BRAM_Dout_B(21 to 21);
  pgassign90(7 downto 4) <= B"0000";
  pgassign90(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign90(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign90(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign90(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign91(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign91(0 downto 0) <= BRAM_Dout_A(22 to 22);
  pgassign92(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign92(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign92(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign92(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign93(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign93(0 downto 0) <= BRAM_Dout_B(22 to 22);
  pgassign94(7 downto 4) <= B"0000";
  pgassign94(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign94(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign94(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign94(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign95(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign95(0 downto 0) <= BRAM_Dout_A(23 to 23);
  pgassign96(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign96(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign96(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign96(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign97(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign97(0 downto 0) <= BRAM_Dout_B(23 to 23);
  pgassign98(7 downto 4) <= B"0000";
  pgassign98(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign98(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign98(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign98(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign99(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign99(0 downto 0) <= BRAM_Dout_A(24 to 24);
  pgassign100(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign100(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign100(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign100(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign101(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign101(0 downto 0) <= BRAM_Dout_B(24 to 24);
  pgassign102(7 downto 4) <= B"0000";
  pgassign102(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign102(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign102(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign102(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign103(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign103(0 downto 0) <= BRAM_Dout_A(25 to 25);
  pgassign104(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign104(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign104(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign104(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign105(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign105(0 downto 0) <= BRAM_Dout_B(25 to 25);
  pgassign106(7 downto 4) <= B"0000";
  pgassign106(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign106(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign106(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign106(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign107(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign107(0 downto 0) <= BRAM_Dout_A(26 to 26);
  pgassign108(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign108(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign108(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign108(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign109(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign109(0 downto 0) <= BRAM_Dout_B(26 to 26);
  pgassign110(7 downto 4) <= B"0000";
  pgassign110(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign110(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign110(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign110(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign111(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign111(0 downto 0) <= BRAM_Dout_A(27 to 27);
  pgassign112(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign112(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign112(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign112(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign113(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign113(0 downto 0) <= BRAM_Dout_B(27 to 27);
  pgassign114(7 downto 4) <= B"0000";
  pgassign114(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign114(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign114(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign114(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign115(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign115(0 downto 0) <= BRAM_Dout_A(28 to 28);
  pgassign116(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign116(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign116(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign116(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign117(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign117(0 downto 0) <= BRAM_Dout_B(28 to 28);
  pgassign118(7 downto 4) <= B"0000";
  pgassign118(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign118(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign118(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign118(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign119(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign119(0 downto 0) <= BRAM_Dout_A(29 to 29);
  pgassign120(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign120(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign120(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign120(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign121(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign121(0 downto 0) <= BRAM_Dout_B(29 to 29);
  pgassign122(7 downto 4) <= B"0000";
  pgassign122(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign122(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign122(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign122(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign123(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign123(0 downto 0) <= BRAM_Dout_A(30 to 30);
  pgassign124(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign124(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign124(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign124(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign125(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign125(0 downto 0) <= BRAM_Dout_B(30 to 30);
  pgassign126(7 downto 4) <= B"0000";
  pgassign126(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign126(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign126(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign126(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign127(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign127(0 downto 0) <= BRAM_Dout_A(31 to 31);
  pgassign128(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign128(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign128(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign128(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign129(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign129(0 downto 0) <= BRAM_Dout_B(31 to 31);
  pgassign130(7 downto 4) <= B"0000";
  pgassign130(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign130(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign130(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign130(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign131(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign131(0 downto 0) <= BRAM_Dout_A(0 to 0);
  BRAM_Din_A(0 to 0) <= pgassign132(0 downto 0);
  pgassign133(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign133(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign133(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign133(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign134(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign134(0 downto 0) <= BRAM_Dout_B(0 to 0);
  BRAM_Din_B(0 to 0) <= pgassign135(0 downto 0);
  pgassign136(7 downto 4) <= B"0000";
  pgassign136(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign136(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign136(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign136(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign137(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign137(0 downto 0) <= BRAM_Dout_A(1 to 1);
  BRAM_Din_A(1 to 1) <= pgassign138(0 downto 0);
  pgassign139(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign139(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign139(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign139(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign140(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign140(0 downto 0) <= BRAM_Dout_B(1 to 1);
  BRAM_Din_B(1 to 1) <= pgassign141(0 downto 0);
  pgassign142(7 downto 4) <= B"0000";
  pgassign142(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign142(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign142(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign142(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign143(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign143(0 downto 0) <= BRAM_Dout_A(2 to 2);
  BRAM_Din_A(2 to 2) <= pgassign144(0 downto 0);
  pgassign145(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign145(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign145(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign145(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign146(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign146(0 downto 0) <= BRAM_Dout_B(2 to 2);
  BRAM_Din_B(2 to 2) <= pgassign147(0 downto 0);
  pgassign148(7 downto 4) <= B"0000";
  pgassign148(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign148(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign148(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign148(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign149(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign149(0 downto 0) <= BRAM_Dout_A(3 to 3);
  BRAM_Din_A(3 to 3) <= pgassign150(0 downto 0);
  pgassign151(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign151(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign151(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign151(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign152(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign152(0 downto 0) <= BRAM_Dout_B(3 to 3);
  BRAM_Din_B(3 to 3) <= pgassign153(0 downto 0);
  pgassign154(7 downto 4) <= B"0000";
  pgassign154(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign154(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign154(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign154(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign155(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign155(0 downto 0) <= BRAM_Dout_A(4 to 4);
  BRAM_Din_A(4 to 4) <= pgassign156(0 downto 0);
  pgassign157(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign157(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign157(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign157(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign158(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign158(0 downto 0) <= BRAM_Dout_B(4 to 4);
  BRAM_Din_B(4 to 4) <= pgassign159(0 downto 0);
  pgassign160(7 downto 4) <= B"0000";
  pgassign160(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign160(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign160(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign160(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign161(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign161(0 downto 0) <= BRAM_Dout_A(5 to 5);
  BRAM_Din_A(5 to 5) <= pgassign162(0 downto 0);
  pgassign163(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign163(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign163(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign163(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign164(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign164(0 downto 0) <= BRAM_Dout_B(5 to 5);
  BRAM_Din_B(5 to 5) <= pgassign165(0 downto 0);
  pgassign166(7 downto 4) <= B"0000";
  pgassign166(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign166(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign166(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign166(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign167(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign167(0 downto 0) <= BRAM_Dout_A(6 to 6);
  BRAM_Din_A(6 to 6) <= pgassign168(0 downto 0);
  pgassign169(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign169(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign169(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign169(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign170(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign170(0 downto 0) <= BRAM_Dout_B(6 to 6);
  BRAM_Din_B(6 to 6) <= pgassign171(0 downto 0);
  pgassign172(7 downto 4) <= B"0000";
  pgassign172(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign172(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign172(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign172(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign173(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign173(0 downto 0) <= BRAM_Dout_A(7 to 7);
  BRAM_Din_A(7 to 7) <= pgassign174(0 downto 0);
  pgassign175(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign175(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign175(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign175(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign176(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign176(0 downto 0) <= BRAM_Dout_B(7 to 7);
  BRAM_Din_B(7 to 7) <= pgassign177(0 downto 0);
  pgassign178(7 downto 4) <= B"0000";
  pgassign178(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign178(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign178(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign178(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign179(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign179(0 downto 0) <= BRAM_Dout_A(8 to 8);
  BRAM_Din_A(8 to 8) <= pgassign180(0 downto 0);
  pgassign181(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign181(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign181(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign181(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign182(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign182(0 downto 0) <= BRAM_Dout_B(8 to 8);
  BRAM_Din_B(8 to 8) <= pgassign183(0 downto 0);
  pgassign184(7 downto 4) <= B"0000";
  pgassign184(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign184(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign184(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign184(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign185(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign185(0 downto 0) <= BRAM_Dout_A(9 to 9);
  BRAM_Din_A(9 to 9) <= pgassign186(0 downto 0);
  pgassign187(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign187(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign187(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign187(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign188(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign188(0 downto 0) <= BRAM_Dout_B(9 to 9);
  BRAM_Din_B(9 to 9) <= pgassign189(0 downto 0);
  pgassign190(7 downto 4) <= B"0000";
  pgassign190(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign190(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign190(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign190(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign191(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign191(0 downto 0) <= BRAM_Dout_A(10 to 10);
  BRAM_Din_A(10 to 10) <= pgassign192(0 downto 0);
  pgassign193(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign193(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign193(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign193(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign194(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign194(0 downto 0) <= BRAM_Dout_B(10 to 10);
  BRAM_Din_B(10 to 10) <= pgassign195(0 downto 0);
  pgassign196(7 downto 4) <= B"0000";
  pgassign196(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign196(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign196(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign196(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign197(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign197(0 downto 0) <= BRAM_Dout_A(11 to 11);
  BRAM_Din_A(11 to 11) <= pgassign198(0 downto 0);
  pgassign199(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign199(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign199(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign199(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign200(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign200(0 downto 0) <= BRAM_Dout_B(11 to 11);
  BRAM_Din_B(11 to 11) <= pgassign201(0 downto 0);
  pgassign202(7 downto 4) <= B"0000";
  pgassign202(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign202(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign202(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign202(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign203(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign203(0 downto 0) <= BRAM_Dout_A(12 to 12);
  BRAM_Din_A(12 to 12) <= pgassign204(0 downto 0);
  pgassign205(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign205(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign205(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign205(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign206(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign206(0 downto 0) <= BRAM_Dout_B(12 to 12);
  BRAM_Din_B(12 to 12) <= pgassign207(0 downto 0);
  pgassign208(7 downto 4) <= B"0000";
  pgassign208(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign208(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign208(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign208(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign209(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign209(0 downto 0) <= BRAM_Dout_A(13 to 13);
  BRAM_Din_A(13 to 13) <= pgassign210(0 downto 0);
  pgassign211(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign211(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign211(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign211(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign212(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign212(0 downto 0) <= BRAM_Dout_B(13 to 13);
  BRAM_Din_B(13 to 13) <= pgassign213(0 downto 0);
  pgassign214(7 downto 4) <= B"0000";
  pgassign214(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign214(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign214(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign214(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign215(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign215(0 downto 0) <= BRAM_Dout_A(14 to 14);
  BRAM_Din_A(14 to 14) <= pgassign216(0 downto 0);
  pgassign217(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign217(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign217(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign217(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign218(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign218(0 downto 0) <= BRAM_Dout_B(14 to 14);
  BRAM_Din_B(14 to 14) <= pgassign219(0 downto 0);
  pgassign220(7 downto 4) <= B"0000";
  pgassign220(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign220(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign220(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign220(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign221(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign221(0 downto 0) <= BRAM_Dout_A(15 to 15);
  BRAM_Din_A(15 to 15) <= pgassign222(0 downto 0);
  pgassign223(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign223(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign223(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign223(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign224(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign224(0 downto 0) <= BRAM_Dout_B(15 to 15);
  BRAM_Din_B(15 to 15) <= pgassign225(0 downto 0);
  pgassign226(7 downto 4) <= B"0000";
  pgassign226(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign226(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign226(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign226(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign227(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign227(0 downto 0) <= BRAM_Dout_A(16 to 16);
  BRAM_Din_A(16 to 16) <= pgassign228(0 downto 0);
  pgassign229(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign229(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign229(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign229(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign230(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign230(0 downto 0) <= BRAM_Dout_B(16 to 16);
  BRAM_Din_B(16 to 16) <= pgassign231(0 downto 0);
  pgassign232(7 downto 4) <= B"0000";
  pgassign232(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign232(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign232(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign232(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign233(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign233(0 downto 0) <= BRAM_Dout_A(17 to 17);
  BRAM_Din_A(17 to 17) <= pgassign234(0 downto 0);
  pgassign235(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign235(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign235(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign235(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign236(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign236(0 downto 0) <= BRAM_Dout_B(17 to 17);
  BRAM_Din_B(17 to 17) <= pgassign237(0 downto 0);
  pgassign238(7 downto 4) <= B"0000";
  pgassign238(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign238(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign238(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign238(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign239(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign239(0 downto 0) <= BRAM_Dout_A(18 to 18);
  BRAM_Din_A(18 to 18) <= pgassign240(0 downto 0);
  pgassign241(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign241(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign241(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign241(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign242(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign242(0 downto 0) <= BRAM_Dout_B(18 to 18);
  BRAM_Din_B(18 to 18) <= pgassign243(0 downto 0);
  pgassign244(7 downto 4) <= B"0000";
  pgassign244(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign244(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign244(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign244(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign245(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign245(0 downto 0) <= BRAM_Dout_A(19 to 19);
  BRAM_Din_A(19 to 19) <= pgassign246(0 downto 0);
  pgassign247(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign247(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign247(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign247(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign248(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign248(0 downto 0) <= BRAM_Dout_B(19 to 19);
  BRAM_Din_B(19 to 19) <= pgassign249(0 downto 0);
  pgassign250(7 downto 4) <= B"0000";
  pgassign250(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign250(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign250(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign250(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign251(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign251(0 downto 0) <= BRAM_Dout_A(20 to 20);
  BRAM_Din_A(20 to 20) <= pgassign252(0 downto 0);
  pgassign253(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign253(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign253(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign253(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign254(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign254(0 downto 0) <= BRAM_Dout_B(20 to 20);
  BRAM_Din_B(20 to 20) <= pgassign255(0 downto 0);
  pgassign256(7 downto 4) <= B"0000";
  pgassign256(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign256(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign256(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign256(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign257(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign257(0 downto 0) <= BRAM_Dout_A(21 to 21);
  BRAM_Din_A(21 to 21) <= pgassign258(0 downto 0);
  pgassign259(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign259(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign259(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign259(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign260(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign260(0 downto 0) <= BRAM_Dout_B(21 to 21);
  BRAM_Din_B(21 to 21) <= pgassign261(0 downto 0);
  pgassign262(7 downto 4) <= B"0000";
  pgassign262(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign262(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign262(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign262(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign263(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign263(0 downto 0) <= BRAM_Dout_A(22 to 22);
  BRAM_Din_A(22 to 22) <= pgassign264(0 downto 0);
  pgassign265(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign265(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign265(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign265(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign266(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign266(0 downto 0) <= BRAM_Dout_B(22 to 22);
  BRAM_Din_B(22 to 22) <= pgassign267(0 downto 0);
  pgassign268(7 downto 4) <= B"0000";
  pgassign268(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign268(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign268(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign268(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign269(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign269(0 downto 0) <= BRAM_Dout_A(23 to 23);
  BRAM_Din_A(23 to 23) <= pgassign270(0 downto 0);
  pgassign271(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign271(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign271(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign271(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign272(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign272(0 downto 0) <= BRAM_Dout_B(23 to 23);
  BRAM_Din_B(23 to 23) <= pgassign273(0 downto 0);
  pgassign274(7 downto 4) <= B"0000";
  pgassign274(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign274(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign274(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign274(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign275(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign275(0 downto 0) <= BRAM_Dout_A(24 to 24);
  BRAM_Din_A(24 to 24) <= pgassign276(0 downto 0);
  pgassign277(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign277(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign277(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign277(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign278(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign278(0 downto 0) <= BRAM_Dout_B(24 to 24);
  BRAM_Din_B(24 to 24) <= pgassign279(0 downto 0);
  pgassign280(7 downto 4) <= B"0000";
  pgassign280(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign280(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign280(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign280(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign281(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign281(0 downto 0) <= BRAM_Dout_A(25 to 25);
  BRAM_Din_A(25 to 25) <= pgassign282(0 downto 0);
  pgassign283(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign283(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign283(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign283(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign284(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign284(0 downto 0) <= BRAM_Dout_B(25 to 25);
  BRAM_Din_B(25 to 25) <= pgassign285(0 downto 0);
  pgassign286(7 downto 4) <= B"0000";
  pgassign286(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign286(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign286(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign286(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign287(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign287(0 downto 0) <= BRAM_Dout_A(26 to 26);
  BRAM_Din_A(26 to 26) <= pgassign288(0 downto 0);
  pgassign289(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign289(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign289(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign289(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign290(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign290(0 downto 0) <= BRAM_Dout_B(26 to 26);
  BRAM_Din_B(26 to 26) <= pgassign291(0 downto 0);
  pgassign292(7 downto 4) <= B"0000";
  pgassign292(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign292(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign292(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign292(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign293(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign293(0 downto 0) <= BRAM_Dout_A(27 to 27);
  BRAM_Din_A(27 to 27) <= pgassign294(0 downto 0);
  pgassign295(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign295(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign295(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign295(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign296(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign296(0 downto 0) <= BRAM_Dout_B(27 to 27);
  BRAM_Din_B(27 to 27) <= pgassign297(0 downto 0);
  pgassign298(7 downto 4) <= B"0000";
  pgassign298(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign298(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign298(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign298(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign299(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign299(0 downto 0) <= BRAM_Dout_A(28 to 28);
  BRAM_Din_A(28 to 28) <= pgassign300(0 downto 0);
  pgassign301(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign301(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign301(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign301(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign302(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign302(0 downto 0) <= BRAM_Dout_B(28 to 28);
  BRAM_Din_B(28 to 28) <= pgassign303(0 downto 0);
  pgassign304(7 downto 4) <= B"0000";
  pgassign304(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign304(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign304(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign304(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign305(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign305(0 downto 0) <= BRAM_Dout_A(29 to 29);
  BRAM_Din_A(29 to 29) <= pgassign306(0 downto 0);
  pgassign307(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign307(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign307(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign307(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign308(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign308(0 downto 0) <= BRAM_Dout_B(29 to 29);
  BRAM_Din_B(29 to 29) <= pgassign309(0 downto 0);
  pgassign310(7 downto 4) <= B"0000";
  pgassign310(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign310(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign310(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign310(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign311(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign311(0 downto 0) <= BRAM_Dout_A(30 to 30);
  BRAM_Din_A(30 to 30) <= pgassign312(0 downto 0);
  pgassign313(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign313(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign313(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign313(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign314(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign314(0 downto 0) <= BRAM_Dout_B(30 to 30);
  BRAM_Din_B(30 to 30) <= pgassign315(0 downto 0);
  pgassign316(7 downto 4) <= B"0000";
  pgassign316(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign316(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign316(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign316(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign317(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign317(0 downto 0) <= BRAM_Dout_A(31 to 31);
  BRAM_Din_A(31 to 31) <= pgassign318(0 downto 0);
  pgassign319(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign319(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign319(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign319(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign320(31 downto 1) <= B"0000000000000000000000000000000";
  pgassign320(0 downto 0) <= BRAM_Dout_B(31 to 31);
  BRAM_Din_B(31 to 31) <= pgassign321(0 downto 0);
  pgassign322(7 downto 4) <= B"0000";
  pgassign322(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign322(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign322(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign322(0 downto 0) <= BRAM_WEN_B(3 to 3);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb36e1_0 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_0.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_0,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign3,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign4,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_0,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign5,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign6
    );

  ramb36e1_1 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_1.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_1,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign7,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign8,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_1,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign9,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign10
    );

  ramb36e1_2 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_2.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_2,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign11,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign12,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_2,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign13,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign14
    );

  ramb36e1_3 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_3.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_3,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign15,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign16,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_3,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign17,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign18
    );

  ramb36e1_4 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_4.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_4,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign19,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign20,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_4,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign21,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign22
    );

  ramb36e1_5 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_5.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_5,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign23,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign24,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_5,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign25,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign26
    );

  ramb36e1_6 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_6.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_6,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign27,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign28,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_6,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign29,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign30
    );

  ramb36e1_7 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_7.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_7,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign31,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign32,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_7,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign33,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign34
    );

  ramb36e1_8 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_8.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_8,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign35,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign36,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_8,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign37,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign38
    );

  ramb36e1_9 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_9.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_9,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign39,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign40,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_9,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign41,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign42
    );

  ramb36e1_10 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_10.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_10,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign43,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign44,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_10,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign45,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign46
    );

  ramb36e1_11 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_11.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_11,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign47,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign48,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_11,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign49,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign50
    );

  ramb36e1_12 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_12.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_12,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign51,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign52,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_12,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign53,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign54
    );

  ramb36e1_13 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_13.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_13,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign55,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign56,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_13,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign57,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign58
    );

  ramb36e1_14 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_14.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_14,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign59,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign60,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_14,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign61,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign62
    );

  ramb36e1_15 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_15.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_15,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign63,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign64,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_15,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign65,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign66
    );

  ramb36e1_16 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_16.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_16,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign67,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign68,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_16,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign69,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign70
    );

  ramb36e1_17 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_17.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_17,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign71,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign72,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_17,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign73,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign74
    );

  ramb36e1_18 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_18.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_18,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign75,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign76,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_18,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign77,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign78
    );

  ramb36e1_19 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_19.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_19,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign79,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign80,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_19,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign81,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign82
    );

  ramb36e1_20 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_20.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_20,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign83,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign84,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_20,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign85,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign86
    );

  ramb36e1_21 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_21.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_21,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign87,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign88,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_21,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign89,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign90
    );

  ramb36e1_22 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_22.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_22,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign91,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign92,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_22,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign93,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign94
    );

  ramb36e1_23 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_23.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_23,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign95,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign96,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_23,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign97,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign98
    );

  ramb36e1_24 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_24.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_24,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign99,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign100,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_24,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign101,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign102
    );

  ramb36e1_25 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_25.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_25,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign103,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign104,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_25,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign105,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign106
    );

  ramb36e1_26 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_26.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_26,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign107,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign108,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_26,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign109,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign110
    );

  ramb36e1_27 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_27.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_27,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign111,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign112,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_27,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign113,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign114
    );

  ramb36e1_28 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_28.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_28,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign115,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign116,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_28,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign117,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign118
    );

  ramb36e1_29 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_29.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_29,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign119,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign120,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_29,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign121,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign122
    );

  ramb36e1_30 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_30.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_30,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign123,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign124,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_30,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign125,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign126
    );

  ramb36e1_31 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_31.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "LOWER",
      RAM_EXTENSION_B => "LOWER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => net_gnd0,
      CASCADEOUTA => CASCADEA_31,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign127,
      DIPADIP => net_gnd4,
      DOADO => open,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign128,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => net_gnd0,
      CASCADEOUTB => CASCADEB_31,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign129,
      DIPBDIP => net_gnd4,
      DOBDO => open,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign130
    );

  ramb36e1_32 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_32.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_0,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign131,
      DIPADIP => net_gnd4,
      DOADO => pgassign132,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign133,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_0,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign134,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign135,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign136
    );

  ramb36e1_33 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_33.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_1,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign137,
      DIPADIP => net_gnd4,
      DOADO => pgassign138,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign139,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_1,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign140,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign141,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign142
    );

  ramb36e1_34 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_34.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_2,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign143,
      DIPADIP => net_gnd4,
      DOADO => pgassign144,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign145,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_2,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign146,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign147,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign148
    );

  ramb36e1_35 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_35.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_3,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign149,
      DIPADIP => net_gnd4,
      DOADO => pgassign150,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign151,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_3,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign152,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign153,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign154
    );

  ramb36e1_36 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_36.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_4,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign155,
      DIPADIP => net_gnd4,
      DOADO => pgassign156,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign157,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_4,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign158,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign159,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign160
    );

  ramb36e1_37 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_37.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_5,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign161,
      DIPADIP => net_gnd4,
      DOADO => pgassign162,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign163,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_5,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign164,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign165,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign166
    );

  ramb36e1_38 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_38.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_6,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign167,
      DIPADIP => net_gnd4,
      DOADO => pgassign168,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign169,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_6,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign170,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign171,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign172
    );

  ramb36e1_39 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_39.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_7,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign173,
      DIPADIP => net_gnd4,
      DOADO => pgassign174,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign175,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_7,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign176,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign177,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign178
    );

  ramb36e1_40 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_40.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_8,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign179,
      DIPADIP => net_gnd4,
      DOADO => pgassign180,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign181,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_8,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign182,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign183,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign184
    );

  ramb36e1_41 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_41.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_9,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign185,
      DIPADIP => net_gnd4,
      DOADO => pgassign186,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign187,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_9,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign188,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign189,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign190
    );

  ramb36e1_42 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_42.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_10,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign191,
      DIPADIP => net_gnd4,
      DOADO => pgassign192,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign193,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_10,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign194,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign195,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign196
    );

  ramb36e1_43 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_43.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_11,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign197,
      DIPADIP => net_gnd4,
      DOADO => pgassign198,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign199,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_11,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign200,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign201,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign202
    );

  ramb36e1_44 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_44.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_12,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign203,
      DIPADIP => net_gnd4,
      DOADO => pgassign204,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign205,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_12,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign206,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign207,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign208
    );

  ramb36e1_45 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_45.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_13,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign209,
      DIPADIP => net_gnd4,
      DOADO => pgassign210,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign211,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_13,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign212,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign213,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign214
    );

  ramb36e1_46 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_46.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_14,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign215,
      DIPADIP => net_gnd4,
      DOADO => pgassign216,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign217,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_14,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign218,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign219,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign220
    );

  ramb36e1_47 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_47.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_15,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign221,
      DIPADIP => net_gnd4,
      DOADO => pgassign222,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign223,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_15,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign224,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign225,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign226
    );

  ramb36e1_48 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_48.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_16,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign227,
      DIPADIP => net_gnd4,
      DOADO => pgassign228,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign229,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_16,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign230,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign231,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign232
    );

  ramb36e1_49 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_49.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_17,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign233,
      DIPADIP => net_gnd4,
      DOADO => pgassign234,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign235,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_17,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign236,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign237,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign238
    );

  ramb36e1_50 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_50.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_18,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign239,
      DIPADIP => net_gnd4,
      DOADO => pgassign240,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign241,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_18,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign242,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign243,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign244
    );

  ramb36e1_51 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_51.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_19,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign245,
      DIPADIP => net_gnd4,
      DOADO => pgassign246,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign247,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_19,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign248,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign249,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign250
    );

  ramb36e1_52 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_52.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_20,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign251,
      DIPADIP => net_gnd4,
      DOADO => pgassign252,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign253,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_20,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign254,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign255,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign256
    );

  ramb36e1_53 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_53.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_21,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign257,
      DIPADIP => net_gnd4,
      DOADO => pgassign258,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign259,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_21,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign260,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign261,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign262
    );

  ramb36e1_54 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_54.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_22,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign263,
      DIPADIP => net_gnd4,
      DOADO => pgassign264,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign265,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_22,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign266,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign267,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign268
    );

  ramb36e1_55 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_55.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_23,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign269,
      DIPADIP => net_gnd4,
      DOADO => pgassign270,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign271,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_23,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign272,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign273,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign274
    );

  ramb36e1_56 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_56.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_24,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign275,
      DIPADIP => net_gnd4,
      DOADO => pgassign276,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign277,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_24,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign278,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign279,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign280
    );

  ramb36e1_57 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_57.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_25,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign281,
      DIPADIP => net_gnd4,
      DOADO => pgassign282,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign283,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_25,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign284,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign285,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign286
    );

  ramb36e1_58 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_58.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_26,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign287,
      DIPADIP => net_gnd4,
      DOADO => pgassign288,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign289,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_26,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign290,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign291,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign292
    );

  ramb36e1_59 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_59.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_27,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign293,
      DIPADIP => net_gnd4,
      DOADO => pgassign294,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign295,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_27,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign296,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign297,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign298
    );

  ramb36e1_60 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_60.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_28,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign299,
      DIPADIP => net_gnd4,
      DOADO => pgassign300,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign301,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_28,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign302,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign303,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign304
    );

  ramb36e1_61 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_61.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_29,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign305,
      DIPADIP => net_gnd4,
      DOADO => pgassign306,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign307,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_29,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign308,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign309,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign310
    );

  ramb36e1_62 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_62.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_30,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign311,
      DIPADIP => net_gnd4,
      DOADO => pgassign312,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign313,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_30,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign314,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign315,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign316
    );

  ramb36e1_63 : RAMB36E1
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "microblaze_0_bram_block_combined_63.mem",
      READ_WIDTH_A => 1,
      READ_WIDTH_B => 1,
      WRITE_WIDTH_A => 1,
      WRITE_WIDTH_B => 1,
      RAM_EXTENSION_A => "UPPER",
      RAM_EXTENSION_B => "UPPER"
    )
    port map (
      DBITERR => open,
      ECCPARITY => open,
      INJECTDBITERR => net_gnd0,
      INJECTSBITERR => net_gnd0,
      RDADDRECC => open,
      SBITERR => open,
      ADDRARDADDR => BRAM_Addr_A(14 to 29),
      CASCADEINA => CASCADEA_31,
      CASCADEOUTA => open,
      CLKARDCLK => BRAM_Clk_A,
      DIADI => pgassign317,
      DIPADIP => net_gnd4,
      DOADO => pgassign318,
      DOPADOP => open,
      ENARDEN => BRAM_EN_A,
      REGCEAREGCE => net_gnd0,
      RSTRAMARSTRAM => BRAM_Rst_A,
      RSTREGARSTREG => net_gnd0,
      WEA => pgassign319,
      ADDRBWRADDR => BRAM_Addr_B(14 to 29),
      CASCADEINB => CASCADEB_31,
      CASCADEOUTB => open,
      CLKBWRCLK => BRAM_Clk_B,
      DIBDI => pgassign320,
      DIPBDIP => net_gnd4,
      DOBDO => pgassign321,
      DOPBDOP => open,
      ENBWREN => BRAM_EN_B,
      REGCEB => net_gnd0,
      RSTRAMB => BRAM_Rst_B,
      RSTREGB => net_gnd0,
      WEBWE => pgassign322
    );

end architecture STRUCTURE;

