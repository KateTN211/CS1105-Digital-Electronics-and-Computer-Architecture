library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_tb is
end traffic_light_tb;

architecture Behavioral of traffic_light_tb is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal ns_red, ns_yellow, ns_green : std_logic;
    signal ew_red, ew_yellow, ew_green : std_logic;

    -- Instantiate the Unit Under Test (UUT)
    component traffic_light
        port (
            clk : in std_logic;
            rst : in std_logic;
            ns_red, ns_yellow, ns_green : out std_logic;
            ew_red, ew_yellow, ew_green : out std_logic
        );
    end component;

begin
    uut: traffic_light port map (
        clk => clk,
        rst => rst,
        ns_red => ns_red,
        ns_yellow => ns_yellow,
        ns_green => ns_green,
        ew_red => ew_red,
        ew_yellow => ew_yellow,
        ew_green => ew_green
    );

    -- Clock process
    clk_process : process
    begin
        while now < 500 ms loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Reset process
    rst_process : process
    begin
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        wait;
    end process;

end Behavioral;
