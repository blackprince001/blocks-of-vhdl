LIBRARY ieee;
USE ieee.std_logic_1164.all;

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
Signal a: std_logic_vector(3 Downto 1);
Signal b: std_logic_vector(3 Downto 0);
Signal c: std_logic_vector(15 Downto 0);

a <= 1;
b <= '0000';
c <= B"0000";
d <= X"AF67";
e <= O"123";

    -- concatenation works with data types when the resulting register where the data is stored
    -- is of high value. eg. two 2-bit values can be concatenated and stored in c if is has bits greater than 4.

Signal addr : std_logic_vector(3 downto 0);
Signal data : std_logic_vector(4 downto 0);
Signal curl : std_logic_vector(1 downto 0);
Signal data_bus : std_logic_vector(10 downto 0);

data_bus <= addr &  data & curl; -- bus can take all the bits from the other signals.

-- bit vectors

entity system2 is
    port (
        bus_in : in Bit_vector(31 downto 0); -- 32 bit input bus for system2
        bus_out: out Bit_vector(31 downto 0) -- 32 bit output bus for system2
    );
end system2;

-- we can index bit_vectors by just calling out the index in the vector
a <= bus_in(12); -- would point to the 13th bit supposer bus_in is a bit_vector of size N >= 13