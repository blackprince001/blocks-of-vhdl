
library ieee;
use ieee.std_logic_1164.all;
-- Concurrent Statements

-- Combinatorial circuits (Shifters and Rotators)

    -- logic shift right
Signal A : STD_LOGIC_VECTOR(3 downto 0);
Signal C : STD_LOGIC_VECTOR(3 downto 0);

C <= A srl 1;
C <= '0' & A(3 downto 1); -- concatenate result to reverse

    -- arithmetic shift left
Signal A : STD_LOGIC_VECTOR(3 downto 0);
Signal C : STD_LOGIC_VECTOR(3 downto 0);

C <= A sra 1;
C <= A(3) & A(3 downto 1);

    -- rotation to left
Signal A : STD_LOGIC_VECTOR(3 downto 0);
Signal C : STD_LOGIC_VECTOR(3 downto 0);

C <= A rol 1;

-- sum of product implementation of gates

-- 1-Bit Full Adder
    -- inputs X, Y and CIN, will have S, COUT as output with an XOR gate.
    -- COUT circuit has three AND gates fed from the input all fed into another XOR gate.

entity fa1b is
    port
    (
        x: in STD_LOGIC;
        y: in STD_LOGIC;
        cin: in STD_LOGIC;
        cout: out STD_LOGIC;
        s: out STD_LOGIC
    );
end entity fa1b;

architecture

