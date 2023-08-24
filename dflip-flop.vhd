library ieee;
use ieee.std_logic_1164.all;

entity Dflipflop is
    port (
        clk, D : in bit;
        Q : out bit
    );
end Dflipflop;

architecture Dflipflop_arch of Dflipflop is

begin
    D_FLIP_FLOP_PROC: process(clk)
    begin
        if (clk'event and clk = '1') then  -- clk'event is a signal attribute
            Q <= D;
        end if;
    end process;

end architecture;

-- simple implementation using rising_edge sensitivity attributed by 'event above.
entity dff is
    port( D, Clock : in STD_LOGIC;
          Q : out STD_LOGIC);
end entity;

architecture dff_behavioral of dff is
begin
    dff_proc: process(Clock)
        begin
            if rising_edge(Clock) then
                Q <= D ;
            end if;
    end process;
end architecture;

-- async dff
entity dff is
    port ( D, clock : in std_logic;
           resetn : in std_logic;
           Q : out std_logic );
end entity dff;

architecture dff1_behavioral of dff is
    begin
        process(resetn, clock)
            begin
                if resetn = '0' then
                    Q <= '0';
                elsif rising_edge(clock) then
                    Q <= D ;
                end if;
        end process;
end architecture;
