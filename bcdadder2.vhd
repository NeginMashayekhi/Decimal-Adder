
library ieee;
USE ieee.std_logic_1164.all;


entity bcdadder2 is
    port(
        a  : in std_logic_vector(3 downto 0);
	 b  : in  std_logic_vector(3 downto 0);
        carry_in : in std_logic;
        sum : out  std_logic_vector(3 downto 0); 
        carry : out std_logic  
    );
end bcdadder2;

architecture bcdadder2 of bcdadder2 is

 
component fa
	Port ( a : in STD_LOGIC;

	b : in STD_LOGIC;

	cin : in STD_LOGIC;

	cout : out STD_LOGIC;

	s : out STD_LOGIc

	);

end component;

component plus6
	 Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           
           
           
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end component;



signal st,dt: std_logic_vector(3 downto 0);

signal c1,c2,c3,c4,c5,t1,t2,t3 : std_logic;


begin


  AA1 : fa port map(a(0),b(0),carry_in,c1,st(0));
  AA2 : fa port map(a(1),b(1),c1,c2,st(1));
  AA3 : fa port map(a(2),b(2),c2,c3,st(2));
  AA4 : fa port map(a(3),b(3),c3,c4,st(3));

P1: plus6 port map(st(3 downto 0),dt(3 downto 0));
	t1 <= st(3) and st(2);
	t2 <= st(3) and st(1);
	t3 <= t1 or t2 or c4;
	carry <= t3;

process(st,dt,t3)
begin
	if(t3 = '1') then
	   sum <= dt;
   
	else
	   sum <= st;
 	end if;
end process;

end bcdadder2;
