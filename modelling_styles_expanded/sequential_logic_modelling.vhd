-- process_name : process (<signal_name1>, <signal_name2>, . . .)
-- -- variable declarations
-- begin
--     sequential_signal_assignment_1
--     sequential_signal_assignment_2
--     :
-- end process;

library ieee;
use ieee.std_logic_1164.all;

entity Ex is
    port (
        A : in bit;
        F : out bit
    );
end Ex;

architecture Ex_arch of Ex is
    signal b: bit;
begin
    -- you can have variables in processes not signals
    Proc_Ex: process (a)
    begin
        b <= a;
        f <= not b;
    end process;

end architecture;


architecture Ex_arch of Ex is
    signal b: bit;
begin
    -- you can have variables in processes not signals
    Proc_Ex: process (a)
        variable temp : bit := '0';
    begin
        temp := a;
        b <= temp;
        f <= not temp;
    end process;

end architecture;

-- conditional statements

-- if boolean_condition then sequential_statement
-- end if;

-- if boolean_condition then sequential_statement_1
-- else sequential_statement_2
-- end if;

-- if boolean_condition_1 then sequential_statement_1
-- elsif boolean_condition_2 then sequential_statement_2
-- :
-- :
-- elsif boolean_condition_n then sequential_statement_n
-- end if;
-- if boolean_condition_1 then sequential_statement_1
-- elsif boolean_condition_2 then sequential_statement_2
-- :
-- :
-- elsif boolean_condition_n then sequential_statement_n
-- else sequential_statement_n+1
-- end if;

architecture systemX_arch of systemX is
    -- we could have done signal abc: bit_vector(2 downto 0);
    -- and concatenate the values to abc in begin like we normally do
begin
    systemEx_Proc: process(a, b, c)

    begin
        if (a='0', b='0', c='0') then f <= '0';
        elsif (a='0', b='1', c='0') then f <= '0';
        elsif (a='0', b='0', c='1') then f <= '0';
        elsif (a='0', b='1', c='1') then f <= '1';
        elsif (a='1', b='0', c='0') then f <= '0';
        elsif (a='1', b='1', c='0') then f <= '0';
        elsif (a='1', b='0', c='1') then f <= '1';
        elsif (a='1', b='1', c='1') then f <= '1';
        end if;
    end process;

end architecture;

architecture systemX_arch of systemX is
    -- we could have done signal abc: bit_vector(2 downto 0);
    -- and concatenate the values to abc in begin like we normally do
begin
    systemEx_Proc: process(a, b, c)

    begin
        if (a='0', b='1', c='1') then f <= '1';
        elsif (a='1', b='1', c='0') then f <= '1';
        elsif (a='1', b='1', c='1') then f <= '1';
        else f <= '0';
        end if;
    end process;

end architecture;

-- case statements 
-- case (input_name) is
--     when choice_1 => sequential_statement(s);
--     when choice_2 => sequential_statement(s);
--     :
--     :
--     when choice_n => sequential_statement(s);
-- end case;in processes

-- input_name can only be one item so you can concatenate items or create a type
-- for the group of items and assign them individually
-- examples below

entity systemX is
    port (
        a, b, c : in bit;
        f : out bit
    );
end systemX;

architecture systemX_arch of systemX is
    -- we could have done signal abc: bit_vector(2 downto 0);
    -- and concatenate the values to abc in begin like we normally do
begin
    systemEx_Proc: process(a, b, c) -- if no sensitivity list, we can use WAIT to collect values. eg wait on a, b, c;
    -- but booleans use wait until <condition> construct
        variable abc: Bit_vector(2 downto 0);
    begin
        abc := a & b & c;
        case (abc) is
            when "000" => f <= '0';
            when "001" => f <= '0';
            when "010" => f <= '0';
            when "011" => f <= '1';
            when "100" => f <= '0';
            when "101" => f <= '0';
            when "110" => f <= '1';
            when "111" => f <= '1';
        end case;
    end process;

end architecture;

architecture systemX_arch of systemX is
    -- we could have done signal abc: bit_vector(2 downto 0);
    -- and concatenate the values to abc in begin like we normally do
begin
    systemEx_Proc: process(a, b, c)
        variable abc: Bit_vector(2 downto 0);
    begin
        abc := a & b & c;
        case (abc) is
            when "011" or "110" or "111" => f <= '1';
            when others => f <= '0';
        end case;
    end process;

end architecture;

-- infinite loops
-- loop
--     exit when boolean_condition; -- optional exit statement
--     next when boolean_condition; -- optional exit statement
--     sequential_statement(s);
-- end loop;

-- while boolean_condition loop
--     sequential_statement(s);
-- end loop;

-- Clock_Proc2 : process
-- begin
--     loop
--         exit when E = '0';
--         CLK <= not CLK;
--         wait for 50 ns;
--     end loop;

--     CLK <= '0';
--     wait until EN = '1';
-- end process;

-- for loops

-- for loop_variable in min to max loop
--     sequential_statement(s);
-- end loop;

-- for loop_variable in max downto min loop
--     sequential_statement(s);
-- end loop;

-- Counter_Proc : process
-- begin
--     for i in 0 to 15 loop
--         Count_Out <= i;
--         wait for 50 ns;
--     end loop;
-- end process;