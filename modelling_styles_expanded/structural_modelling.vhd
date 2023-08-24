library ieee;
use ieee.std_logic_1164.all;

entity inv_1bit is
    port (
        a : in bit;
        sig : out bit
    );
end inv_1bit;

entity and_3bit is
    port (
        a, b, c : in bit;
        sig : out bit
    );
end and_3bit;

entity or_3bit is
    port (
        a, b, c : in bit;
        sig : out bit
    );
end or_3bit;

entity systemX is
    port (
        a, b, c : in bit;
        f : out bit
    );
end systemX;

-- explicit port mapping
architecture systemX_explicit_portmap of systemx is
    signal m0, m1, m2 : bit;
    signal an, bn, cn : bit;

    component inv_1bit
        port (
            a : in bit;
            sig : out bit
        );
    end component;

    component and_3bit
        port (
            a, b, c : in bit;
            sig : out bit
        );
    end component;
    
    component or_3bit
        port (
            a, b, c : in bit;
            sig : out bit
        );
    end component;
begin
    U1 : inv_1bit port map (a<=a, sig<=an);
    U2 : inv_1bit port map (a<=b, sig<=bn);
    U3 : inv_1bit port map (a<=c, sig<=cn);

    V1 : and_3bit port map (a<=an, b<=bn, c<=cn, sig<=m0);
    V1 : and_3bit port map (a<=an, b<=b, c<=cn, sig<=m1);
    V1 : and_3bit port map (a<=a, b<=b, c<=cn, sig<=m2);

    X : or_3bit port map (a<=m0, b<=m1, c<=m2, sig<=f);

end architecture;

-- positional port mapping ( not desired for designs with more signals )
architecture systemX_positional_portmap of systemx is
    signal m0, m1, m2 : bit;
    signal an, bn, cn : bit;

    component inv_1bit
        port (
            a : in bit;
            sig : out bit
        );
    end component;

    component and_3bit
        port (
            a, b, c : in bit;
            sig : out bit
        );
    end component;
    
    component or_3bit
        port (
            a, b, c : in bit;
            sig : out bit
        );
    end component;
begin
    U1 : inv_1bit port map (a, an);
    U2 : inv_1bit port map (b, bn);
    U3 : inv_1bit port map (c, cn);

    V1 : and_3bit port map (an, bn, cn, m0);
    V1 : and_3bit port map (an, b, cn, m1);
    V1 : and_3bit port map (a, b, cn, m2);

    X : or_3bit port map (m0, m1, m2, f);

end architecture;
