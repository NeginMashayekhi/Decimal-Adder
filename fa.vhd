---------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity fa is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC);
end fa;

architecture Behavioral of fa is

begin
s <= (a xor b) xor cin;
cout <= (a and b) or (cin and ( a or b));


end Behavioral;

