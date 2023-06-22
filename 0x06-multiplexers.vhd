-- multiplexers

library ieee;
use ieee.std_logic_1164.all;

-- entity mux4x1 is
--     port (
--         x0 : in std_logic;
--         x1 : in std_logic;
--         x2 : in std_logic;
--         x3 : in std_logic;
--         en : in std_logic;
--         sig0: std_logic_vector(3 downto 0);
--         sig1: std_logic_vector(3 downto 0);
--         z: out std_logic
--     );
-- end mux4x1;

-- architecture dataflow of mux4x1 is

--     signal 

-- begin
--     -- if (sig0 or sig1) then z <= x0;

-- end architecture  mux4x1;

entity mux2x1 is
    port (
        w0 : in std_logic;
        w1 : in std_logic;
        sel: in std_logic;
        f: out std_logic
    );
end mux2x1;

architecture mux_dataflow of mux2x1 is
begin
    f <= w0 when sel = "0" else w1;
end architecture mux_dataflow;


-- multiplexer cascade
-- two multiplexers in a cascade implementation

entity mux2x1_cascade is
    port (
        w1, w2, w3 : in std_logic;
        s1, s2 : in std_logic;
        f: out std_logic
    );
end mux2x1_cascade;

architecture mux_cascade_dataflow of mux2x1_cascade is
begin
    f <= w1 when s1 = "0" else
         w2 when s2 = "0" else
         w3;
end architecture mux_cascade_dataflow;

-- 4x1 multiplexer

entity mux4x1 is
    port (
        w0, w1, w2, w3 : in std_logic;
        s : in std_logic_vector(1 downto 0);
        f: out std_logic
    );
end mux4x1;

architecture mux4x1_dataflow of mux4x1 is
begin
    with s select
    f <= w0 when "00",
         w1 when "01",
         w2 when "10",
         w3 when others; -- default condition
end architecture mux4x1_dataflow;