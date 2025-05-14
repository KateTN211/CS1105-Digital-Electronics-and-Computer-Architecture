library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light is
    port (
        -- Clock input
        clk : in std_logic; 
        -- Reset input
        rst : in std_logic; 
        -- North-South lights
        ns_red, ns_yellow, ns_green : out std_logic; 
        -- East-West lights
        ew_red, ew_yellow, ew_green : out std_logic  
    );
end traffic_light;

architecture Behavioral of traffic_light is
    type state_type is (S_NS_GREEN, S_NS_YELLOW, S_EW_GREEN, S_EW_YELLOW);
    signal state, next_state : state_type;
    signal counter : integer := 0;
    -- 30 seconds for green, 5 seconds for yellow
    constant GREEN_TIME : integer := 30; 
    constant YELLOW_TIME : integer := 5; 

begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= S_NS_GREEN;
            counter <= 0;
        elsif rising_edge(clk) then
            counter <= counter + 1;
            if counter >= (GREEN_TIME * 1000000) and (state = S_NS_GREEN or state = S_EW_GREEN) then
                state <= next_state;
                counter <= 0;
            elsif counter >= (YELLOW_TIME * 1000000) and (state = S_NS_YELLOW or state = S_EW_YELLOW) then
                state <= next_state;
                counter <= 0;
            end if;
        end if;
    end process;

    process(state)
    begin
        case state is
            when S_NS_GREEN =>
                ns_green <= '1'; ns_yellow <= '0'; ns_red <= '0';
                ew_green <= '0'; ew_yellow <= '0'; ew_red <= '1';
                next_state <= S_NS_YELLOW;
            when S_NS_YELLOW =>
                ns_green <= '0'; ns_yellow <= '1'; ns_red <= '0';
                ew_green <= '0'; ew_yellow <= '0'; ew_red <= '1';
                next_state <= S_EW_GREEN;
            when S_EW_GREEN =>
                ns_green <= '0'; ns_yellow <= '0'; ns_red <= '1';
                ew_green <= '1'; ew_yellow <= '0'; ew_red <= '0';
                next_state <= S_EW_YELLOW;
            when S_EW_YELLOW =>
                ns_green <= '0'; ns_yellow <= '0'; ns_red <= '1';
                ew_green <= '0'; ew_yellow <= '1'; ew_red <= '0';
                next_state <= S_NS_GREEN;
        end case;
    end process;
end Behavioral;