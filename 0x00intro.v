-- variable names are case insensitive.
-- no forward slashes in names.
-- do not use two or more consecutive underscore characters.
-- all names and labes in a given entity or architecture must be unique.

-- Numerics, Bits (in single quotes), Strings (in double quotes), Bit Strings (prefix with double quotes)
-- concatenation "1111" & "0000" => "1111_0000

-- signal model real physical wires
-- variables for programming constructs
-- constant non changing values

-- VHDL is a free format language, means no formatting conventions are preset.

-- Library Declaration
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- generic template for using libraries
-- library library_name;
-- use library_name.package_name.package_parts;

-- entity declaration
-- NAND GATE - Design Name and Interface.
entity nand_gate is
    port ( a: in STD_LOGIC;
           b: in STD_LOGIC;
           z: out STD_LOGIC); -- last expression should not end in a semi-colon
end entity nand_gate;


-- PORT modes
    -- IN: Data comes into this port
    -- OUT: The value of an output can only be updated within the entity
    -- INOUT: The value of a bi-directional pert can read and updated within the entity.

-- generic template for declaring Entities\

-- entity entity_name is
--     port (
--         port_name: port_mode signal_type;
--         port_name: port_mode signal_type;
--         ...
--         port_name: port_mode signal_type
--     );
-- end entity entity_name;


-- architecture body
-- NAND GATE Function
architecture model of nand_gate is 
begin
    z <= a NAND b;
end model;

-- generic template for declaring architectures for entities.

-- architecture architecture_name of entity_name is declarations
-- begin
--     concurrent statements
-- end [architecture] architecture_name;

-- you can implement different architectures for a single interface
-- a nand gate can have a myriad number of input ports which could be different
-- levels of architecture for the nand_gate interface


architecture dataflow of nand_gate is 
begin
    z <= a NAND b;
end dataflow;


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

-- TIPS
    -- place each entity in a different file
    -- current directory of project is always referenced as work.


-- MODELLING STYLES
    -- dataflow: concurrent statements
    -- structural: components and interconnects
    -- behavioural: sequential states (registers, state machines, decoders)
        -- some behavioural descriptions cannot be synthesized!