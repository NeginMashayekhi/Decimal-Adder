library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bcdadder64_2 is
    port(
        a  : in std_logic_vector(63 downto 0);
	 b  : in std_logic_vector(63 downto 0);
        carry_in : in std_logic;
        sum : out  std_logic_vector(63 downto 0); 
        carry : out std_logic  
    );
end bcdadder64_2;

architecture bcdadder64_2 of bcdadder64_2 is

component bcdadder2

	  port(
        a  : in std_logic_vector(3 downto 0);
	 b  : in  std_logic_vector(3 downto 0);
        carry_in : in std_logic;
        sum : out  std_logic_vector(3 downto 0); 
        carry : out std_logic  
    );
end component;

signal c : std_logic_vector(16 downto 0);

begin
c(0) <= carry_in;

bcd_loop: for I in 1 to 16 generate
	BCD: bcdadder2 port map (a((4*I)-1 downto 4*(I-1)),b((4*I)-1 downto 4*(I-1)),c(I-1),sum((4*I)-1 downto 4*(I-1)),c(I));	
 end generate;
carry <= c(16);



end bcdadder64_2;


