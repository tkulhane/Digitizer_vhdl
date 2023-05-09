--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: tb_UART_Protocol.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::PolarFire> <Die::MPF300TS_ES> <Package::FCG1152>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity tb_UART_Protocol is
end tb_UART_Protocol;

architecture behavioral of tb_UART_Protocol is

    constant SYSCLK_PERIOD : time := 20 ns; -- 50MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component UART_Protocol
        -- ports
        port( 
            -- Inputs
            CLK : in std_logic;
            RESET_N : in std_logic;
            UART_RX_Ready : in std_logic;
            UART_RX_Data : in std_logic_vector(7 downto 0);
            UART_TX_Ready : in std_logic;

            -- Outputs
            DBGport_1 : out std_logic;
            DBGport_0 : out std_logic;
            UART_RX_OE_N : out std_logic;
            UART_TX_Data : out std_logic_vector(7 downto 0);
            UART_TX_Enable_N : out std_logic

            -- Inouts

        );
    end component;
    
    
    
    signal RESET_N : std_logic;
    signal UART_RX_Ready : std_logic;
    signal UART_RX_Data : std_logic_vector(7 downto 0);
    signal UART_TX_Ready : std_logic;

    signal DBGport_1 : std_logic;
    signal DBGport_0 : std_logic;
    signal UART_RX_OE_N : std_logic;
    signal UART_TX_Data : std_logic_vector(7 downto 0);
    signal UART_TX_Enable_N : std_logic;
    
    
    
    
    procedure DATA( DATA : in std_logic_vector(7 downto 0);
                    signal Clock : in std_logic;
                    signal UART_RX_OE_N : in std_logic;
                    signal UART_RX_Data : out std_logic_vector(7 downto 0);
                    signal UART_RX_Ready : out std_logic
                    ) is
    begin


        UART_RX_Ready <= '0';
        wait until Clock'event and Clock = '1';
        UART_RX_Ready <= '1';
        wait until Clock'event and Clock = '1' and UART_RX_OE_N = '0';
        UART_RX_Ready <= '0';
        UART_RX_Data <= DATA;
        
    end DATA;

    procedure ENCODED_DATA( DATA : in std_logic_vector(7 downto 0);
                            signal Clock : in std_logic;
                            signal UART_RX_OE_N : in std_logic;
                            signal UART_RX_Data : out std_logic_vector(7 downto 0);
                            signal UART_RX_Ready : out std_logic
                            ) is
    begin

        UART_RX_Ready <= '0';
        wait until Clock'event and Clock = '1';
        UART_RX_Ready <= '1';
        wait until Clock'event and Clock = '1' and UART_RX_OE_N = '0';
        UART_RX_Ready <= '0';
        UART_RX_Data <= DATA(7 downto 4) & not DATA(7 downto 4);
        
        wait for 200 ns;

        UART_RX_Ready <= '0';
        wait until Clock'event and Clock = '1';
        UART_RX_Ready <= '1';
        wait until Clock'event and Clock = '1' and UART_RX_OE_N = '0';
        UART_RX_Ready <= '0';
        UART_RX_Data <= DATA(3 downto 0) & not DATA(3 downto 0);
        
    end ENCODED_DATA;  

    
    
    
begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  UART_Protocol
    UART_Protocol_0 : UART_Protocol
        -- port map
        port map( 
            -- Inputs
            CLK => SYSCLK,
            RESET_N => NSYSRESET,
            UART_RX_Ready => UART_RX_Ready,
            UART_RX_Data => UART_RX_Data,
            UART_TX_Ready => UART_TX_Ready,

            -- Outputs
            DBGport_1 =>  DBGport_1,
            DBGport_0 =>  DBGport_0,
            UART_RX_OE_N =>  UART_RX_OE_N,
            UART_TX_Data => UART_TX_Data,
            UART_TX_Enable_N =>  UART_TX_Enable_N

            -- Inouts

        );
        
    process
    begin
        
                    
        wait for 200 ns;
        
        DATA( X"02", SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready); 
        wait for 200 ns;

        ENCODED_DATA(X"45",SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready);
        wait for 200 ns;
        ENCODED_DATA(X"A9",SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready);
        wait for 200 ns;
        ENCODED_DATA(X"F5",SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready);
        wait for 200 ns;
        ENCODED_DATA(X"7B",SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready);
        wait for 200 ns;

        DATA( X"03", SYSCLK, UART_RX_OE_N, UART_RX_Data, UART_RX_Ready);
        wait for 1000 ns;
    
    
    end process;
    
    
    process
    begin
    
        UART_TX_Ready <= '1';
        wait until SYSCLK'event and SYSCLK = '1' and UART_TX_Enable_N = '0';
        UART_TX_Ready <= '0';
        wait for (200 ns);
        UART_TX_Ready <= '1';
        
    
    end process;

end behavioral;

