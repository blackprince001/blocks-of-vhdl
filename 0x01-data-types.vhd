-- DATA TYPES
    -- integer: Minimal range -(2 ^ 31 - 1) to (2 ^ 31 - 1)
    -- boolean:
    -- bit strings:
    -- strings:


-- STD_lOGIC Demystified
    -- STD_LOGIC can model 9 values [U, X, 0, 1, Z, W, L, H, -]
    -- useful mainly for simulation
    -- 0, 1, U and X are synthesizable (means they have real physical representations)
        -- U: Uninitialized
        -- X: Forcing (strong driven) UNKNOWN
        -- 0: Forcing 0
        -- 1: Forcing 1
        -- Z: High Impedance
        -- -: Don't Care

-- STD_logic Rules
    -- do not use integer, unsigned, signed, bits for ports
    -- you can use them inside of architectures if desired
    -- you can use them in generics

    -- SIGNALs
Signal a: STD_LOGIC;
Signal b: STD_LOGIC_VECTOR(3 Downto 0);
Signal c: STD_LOGIC_VECTOR(15 Downto 0);

a <= 1;
b <= '0000';
c <= B"0000";
d <= X"AF67";
e <= O"123";

    -- concatenation works with data types when the resulting register where the data is stored
    -- is of high value. eg. two 2-bit values can be concatenated and stored in c if is has bits greater than 4.

Signal addr : STD_LOGIC_VECTOR(3 downto 0);
Signal data : STD_LOGIC_VECTOR(4 downto 0);
Signal curl : STD_LOGIC_VECTOR(1 downto 0);
Signal data_bus : STD_LOGIC_VECTOR(10 downto 0);

data_bus <= addr &  data & curl; -- bus can take all the bits from the other signals.

