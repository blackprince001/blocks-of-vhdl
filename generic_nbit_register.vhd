ENTITY regn IS
    GENERIC (N : INTEGER := 16);
    PORT(
        D : in STD_LOGIC_VECTOR(N-1 downto 0);
        Resetn, Clock : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
END regn;

ARCHITECTURE behavioral OF regn IS
    BEGIN
        PROCESS (Resetn, Clock)
            BEGIN
                IF Resetn = '0' THEN
                    Q <= (others => '0');
                ELSIF rising_edge(Clock) THEN
                    Q <= D ;
                END IF ;
            END PROCESS;
END behavioral;

ENTITY regen IS
    GENERIC (N : INTEGER := 16);
    PORT(
        Enable, Clock : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR(N-1 downto 0);
        Q : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
END regen;

ARCHITECTURE behavioral OF regen IS
    BEGIN
        PROCESS (Clock)
            BEGIN
                IF rising_edge(Clock) THEN
                    IF Enable = '1' THEN
                        Q <= D;
                    END IF;
                END IF ;
        END PROCESS;
END behavioral;