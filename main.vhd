library ieee;
use ieee.std_logic_1164.all;

entity main is 
	port
	(
		--full adder port declarations
		x, y : in std_logic_vector(3 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		c_out : out std_logic;
		seg_out : out std_logic_vector(6 downto 0)
	);
end main;

architecture dataflow of main is
	signal c0, c1, c2 : std_logic;
	signal s0, s1, s2, s3 : std_logic;
	signal bcd : std_logic_vector(3 downto 0);
begin
	full_adder_1 : entity work.full_adder port map (x(3), y(3), c_in, s3, c0);
	sum(3) <= s3;
	full_adder_2 : entity work.full_adder port map (x(2), y(2), c0, s2, c1);
	sum(2) <= s2;
	full_adder_3 : entity work.full_adder port map (x(1), y(1), c1, s1, c2);
	sum(1) <= s1;
	full_adder_4 : entity work.full_adder port map (x(0), y(0), c2, s0, c_out);
	sum(0) <= s0;
	
	bcd(0) <= s3;
	bcd(1) <= s2;
	bcd(2) <= s1;
	bcd(3) <= s0;
	
	bcd_decoder : entity work.bcd_decoder port map(bcd, seg_out);
end dataflow;