-- Generated .vhd for MBE multiplication

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MBE_multiplier is

	port (
		A	: in  std_logic_vector(32-1 downto 0);	-- input A
		B	: in  std_logic_vector(32-1 downto 0);	-- input B
		Z	: out  std_logic_vector(32-1 downto 0));	-- output Z

end entity MBE_multiplier;

architecture arch of MBE_multiplier is

-- SIGNALS
signal A_ext : std_logic_vector(32-1+2 downto 0);

signal par_pro_0, par_pro_1, par_pro_2, par_pro_3, par_pro_4, par_pro_5, par_pro_6, par_pro_7, par_pro_8, par_pro_9, par_pro_10, par_pro_11, par_pro_12, par_pro_13, par_pro_14, par_pro_15, par_pro_16, par_pro_17, par_pro_18, par_pro_19, par_pro_20, par_pro_21, par_pro_22, par_pro_23, par_pro_24, par_pro_25, par_pro_26, par_pro_27, par_pro_28, par_pro_29, par_pro_30, par_pro_31 : std_logic_vector(34 downto 0);

signal triplet_0, triplet_1, triplet_2, triplet_3, triplet_4, triplet_5, triplet_6, triplet_7, triplet_8, triplet_9, triplet_10, triplet_11, triplet_12, triplet_13, triplet_14, triplet_15 : std_logic_vector(2 downto 0);

-- COMPONENTS
component MBE_encoder is
generic (
N : integer);
port (
triplet : in  std_logic_vector(2 downto 0);
A       : in  std_logic_vector(N-1 downto 0);
P       : out std_logic_vector(N downto 0));
end component MBE_encoder;

begin
mbe_enc0:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_0,A=>A_ext,P=>par_pro_0);
mbe_enc1:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_1,A=>A_ext,P=>par_pro_1);
mbe_enc2:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_2,A=>A_ext,P=>par_pro_2);
mbe_enc3:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_3,A=>A_ext,P=>par_pro_3);
mbe_enc4:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_4,A=>A_ext,P=>par_pro_4);
mbe_enc5:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_5,A=>A_ext,P=>par_pro_5);
mbe_enc6:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_6,A=>A_ext,P=>par_pro_6);
mbe_enc7:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_7,A=>A_ext,P=>par_pro_7);
mbe_enc8:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_8,A=>A_ext,P=>par_pro_8);
mbe_enc9:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_9,A=>A_ext,P=>par_pro_9);
mbe_enc10:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_10,A=>A_ext,P=>par_pro_10);
mbe_enc11:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_11,A=>A_ext,P=>par_pro_11);
mbe_enc12:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_12,A=>A_ext,P=>par_pro_12);
mbe_enc13:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_13,A=>A_ext,P=>par_pro_13);
mbe_enc14:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_14,A=>A_ext,P=>par_pro_14);
mbe_enc15:	 mbe_encoder generic map(N => 34) port map (triplet=>triplet_15,A=>A_ext,P=>par_pro_15);

-- SIGNAL ASSOCIATIONS
A_ext <= A(32-1)&A&'0';

triplet_0<=A_ext(2)&A_ext(1)&A_ext(0);
triplet_1<=A_ext(4)&A_ext(3)&A_ext(2);
triplet_2<=A_ext(6)&A_ext(5)&A_ext(4);
triplet_3<=A_ext(8)&A_ext(7)&A_ext(6);
triplet_4<=A_ext(10)&A_ext(9)&A_ext(8);
triplet_5<=A_ext(12)&A_ext(11)&A_ext(10);
triplet_6<=A_ext(14)&A_ext(13)&A_ext(12);
triplet_7<=A_ext(16)&A_ext(15)&A_ext(14);
triplet_8<=A_ext(18)&A_ext(17)&A_ext(16);
triplet_9<=A_ext(20)&A_ext(19)&A_ext(18);
triplet_10<=A_ext(22)&A_ext(21)&A_ext(20);
triplet_11<=A_ext(24)&A_ext(23)&A_ext(22);
triplet_12<=A_ext(26)&A_ext(25)&A_ext(24);
triplet_13<=A_ext(28)&A_ext(27)&A_ext(26);
triplet_14<=A_ext(30)&A_ext(29)&A_ext(28);
triplet_15<=A_ext(32)&A_ext(31)&A_ext(30);

end architecture arch;