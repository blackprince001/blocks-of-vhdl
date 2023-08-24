library ieee;
use ieee.std_logic_1164.all;

entity systemx is
    port (
        a, b, c : in bit;
        f : out bit
    );
end systemx;

-- concurrent signal assignment
architecture systemx_concurrent of systemx is
    signal m0, m1, m2 : bit;
    signal an, bn, cn : bit;
begin
    an <= not a;
    bn <= not b;
    cn <= not c;

    m0 <= an and bn and cn;
    m1 <= an and b and cn;
    m2 <= a and b and cn;

    f <= m0 or m1 or m2;
end architecture;

-- conditional signal assignment (looks more the truth table)
architecture systemx_conditional of systemx is
begin
    f <= '1' when (a='0' and b='0' and c='0') else
    f <= '0' when (a='0' and b='0' and c='1') else
    f <= '1' when (a='0' and b='1' and c='0') else
    f <= '0' when (a='0' and b='1' and c='1') else

    f <= '0' when (a='1' and b='0' and c='0') else
    f <= '0' when (a='1' and b='0' and c='1') else
    f <= '1' when (a='1' and b='1' and c='0') else
    f <= '0' when (a='1' and b='1' and c='1');

end architecture;


-- simplified section of the above code 
architecture systemx_conditional_simple of systemx is
begin
    f <= '1' when (a='0' and b='0' and c='0') else
    f <= '1' when (a='0' and b='1' and c='0') else
    f <= '1' when (a='1' and b='1' and c='0') else
    '0';

end architecture;

-- selected signal assignment
architecture systemx_selected_signals of systemx is
    signal abc : Bit_vector(2 downto 0);
begin
    abc <= a & b & c;

    with (abc) select
        f <= '1' when "000",
             '1' when "010",
             '1' when "110",
             '0' when others;

end architecture;

architecture systemx_selected_signals_simplified of systemx is
    signal abc : Bit_vector(2 downto 0);
begin
    abc <= a & b & c;

    with (abc) select
        f <= '1' when "000" or "010" or "110",
             '0' when others;

end architecture;