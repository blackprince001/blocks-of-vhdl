library ieee;
use ieee.std_logic_1164.all;

entity xor3_gate is
    port (
        a: in STD_LOGIC;
        b: in STD_LOGIC;
        c: in STD_LOGIC;
        Result: out STD_LOGIC
    );
end entity xor3_gate;

architecture dataflow of xor3_gate is 
    signal U1_out: STD_LOGIC;
begin
    U1_out <= A XOR B;
    Result <= U1_out XOR C;
end architecture dataflow;