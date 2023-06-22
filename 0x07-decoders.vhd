-- Decoders

library ieee;
use ieee.std_logic_1164.all;

entity dd2x4 is
    port (
        w : in STD_LOGIC_VECTOR(1 downto 0);
        En : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end dd2x4;

architecture dataflow of dd2x4 is

    signal Enw : STD_LOGIC_VECTOR(2 downto 0); 

begin
    Enw <= En & w;
    with Enw select
        y <= "0001" when "100",
             "0010" when "101",
             "0100" when "110",
             "1000" when "111",
             "0000" when others;
end architecture dataflow;
