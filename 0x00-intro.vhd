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


