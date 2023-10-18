library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--my new interface


entity ft601_fifo_interface is
	port 
	(
	-- System Signals
		Reset_N			:in	std_logic;
	-- FTDI-FPGA interface
		FTDI_CLK	: in	std_logic;		-- 100MHz v Synchronim rezimu
		FTDI_nRXF	: in	std_logic;		-- '0' v FTDI jsou data pro vycteni
		FTDI_nTXE	: in	std_logic;		-- '0' v FTDI je misto pro data k odeslani
		FTDI_nRD_o	: out	std_logic;		-- '0'-synchroni vycteni 1 slova z FTDI
		FTDI_nWR_o	: out	std_logic;		-- '0'-synchroni zapsani 1 slova do FTDI
		FTDI_nOE_o	: out	std_logic;		-- polarita datove brany '1'-write, '0'-read
		FTDI_DATA_o	: inout	std_logic_vector(31 downto 0); -- data
		FTDI_BE_o		: inout	std_logic_vector(3 downto 0); -- byte enable
	-- inter FPGA signals
		-- read signals (FTDI -> Architecture)
		CH_FA_DATA			: out	std_logic_vector(31 downto 0);
		CH_FA_ALMOST_FULL	: in	std_logic;
		CH_FA_WREN			: out	std_logic;
		-- write signals (Architecture -> FTDI)
		CH_AF_DATA		: in	std_logic_vector(31 downto 0);	
		CH_AF_EMPTY		: in	std_logic;
		CH_AF_RDEN		: out	std_logic
	);	
	end ft601_fifo_interface;

architecture rtl_ft601_fifo_interface OF ft601_fifo_interface is

    type FSM_state is (IDLE, RECEIVE_PREPARE, RECEIVE, TRANSMIT_PREPARE, TRANSMIT, TRANSMIT_ABORT, TRANSMIT_BUFFER, BUFFER_CLEAR );
    signal state_reg, next_state : FSM_state;

	signal FTDI_nRD : std_logic;
	signal FTDI_nWR : std_logic;
	signal FTDI_nOE : std_logic;
	signal FTDI_DATA : std_logic_vector(31 downto 0);
	signal FTDI_BE : std_logic_vector(3 downto 0);

	--data buffer signals
	signal AF_DATA_Buffer_SET : std_logic;
	signal AF_DATA_Buffer_CLR : std_logic;
	signal AF_DATA_Buffer_Valid : std_logic;
	signal AF_DATA_Buffer : std_logic_vector(31 downto 0);

	
begin

            FTDI_nRD_o <= FTDI_nRD;
			FTDI_nWR_o <= FTDI_nWR;
			FTDI_nOE_o <= FTDI_nOE;
			FTDI_DATA_o <= FTDI_DATA;
			FTDI_BE_o <= FTDI_BE;


------------------------------------------------------------------------------------------------------------
--ftdi signal buffer
------------------------------------------------------------------------------------------------------------
	--process(Reset_N,FTDI_CLK)
    --begin

        --if(Reset_N = '0') then
			--FTDI_nRD_o <= '1';
			--FTDI_nWR_o <= '1';
			--FTDI_nOE_o <= '1';
			--FTDI_DATA_o <= (others => 'Z');
			--FTDI_BE_o <= (others => 'Z');
        
        --elsif(FTDI_CLK'event and FTDI_CLK = '1') then
            --FTDI_nRD_o <= FTDI_nRD;
			--FTDI_nWR_o <= FTDI_nWR;
			--FTDI_nOE_o <= FTDI_nOE;
			--FTDI_DATA_o <= FTDI_DATA;
			--FTDI_BE_o <= FTDI_BE;

        --end if;
    --end process;


------------------------------------------------------------------------------------------------------------
--FSM ride
------------------------------------------------------------------------------------------------------------
    --state memory and reset
    process(Reset_N,FTDI_CLK)
    begin

        if(Reset_N = '0') then
            state_reg <= IDLE;
        
        elsif(FTDI_CLK'event and FTDI_CLK = '1') then
            state_reg <= next_state;

        end if;
    end process;

    --translation function
    process(next_state, state_reg, FTDI_nRXF, FTDI_nTXE, CH_FA_ALMOST_FULL, CH_AF_EMPTY, AF_DATA_Buffer_Valid)
    begin

        next_state <= state_reg;

        case state_reg is
        
            when IDLE =>
                if(FTDI_nRXF = '0' and CH_FA_ALMOST_FULL = '0') then	--prijem dat
                    next_state <= RECEIVE_PREPARE;
				elsif(FTDI_nTXE = '0' and AF_DATA_Buffer_Valid = '1') then --odeslani bufferu
					next_state <= TRANSMIT_BUFFER;
				elsif(FTDI_nTXE = '0' and CH_AF_EMPTY = '0') then 	--odesilani dat z fifo
					next_state <= TRANSMIT_PREPARE;
                end if;

			when RECEIVE_PREPARE =>
				next_state <= RECEIVE; 			

			when RECEIVE =>
				if(FTDI_nRXF = '1' or CH_FA_ALMOST_FULL = '1') then
					next_state <= IDLE;
				end if;

			when TRANSMIT_PREPARE =>
				next_state <= TRANSMIT;

			when TRANSMIT =>
				if(FTDI_nTXE = '1') then 
					next_state <= TRANSMIT_ABORT;
				elsif(CH_AF_EMPTY = '1') then
					next_state <= IDLE;
				end if;

			when TRANSMIT_ABORT =>
				next_state <= IDLE;

			when TRANSMIT_BUFFER =>
				next_state <= BUFFER_CLEAR;

			when BUFFER_CLEAR =>
				next_state <= IDLE;

            when others =>
                null; 

        end case;
    end process;

    --output function
    process(state_reg, CH_AF_DATA, AF_DATA_Buffer, FTDI_DATA_o, FTDI_nTXE)
    begin

        case state_reg is
        
            when IDLE =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '1';
				FTDI_DATA	<= (others => 'Z');
				FTDI_BE		<= (others => 'Z');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';

			when RECEIVE_PREPARE =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '0'; --datova brana na cteni z ftdi - vystup aktivovan
				FTDI_DATA	<= (others => 'Z');
				FTDI_BE		<= (others => 'Z');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= FTDI_DATA_o;--FTDI_DATA; --data z ftdi smerovana do fifo
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';
			
			when RECEIVE =>
				--ftdi signals
				FTDI_nRD	<= '0'; -- aktivace cteni z ftdi
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '0';
				FTDI_DATA	<= (others => 'Z');
				FTDI_BE		<= (others => 'Z');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= FTDI_DATA_o;--FTDI_DATA; --data z ftdi smerovana do fifo
				CH_FA_WREN	<= '1'; --zapisuji do fifo
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';
			
			when TRANSMIT_PREPARE =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '1'; --brana zustava vypnuta
				FTDI_DATA	<= CH_AF_DATA; --na ftdi jsou smerovana data z fifo
				FTDI_BE		<= (others => '1');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '1'; --aktivace cteni z fifo - data jsou platna dalsi takt
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';

			when TRANSMIT =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= FTDI_nTXE;--'0'; --aktivace zapisu do ftdi
				FTDI_nOE	<= '1';
				FTDI_DATA	<= CH_AF_DATA; --na ftdi jsou smerovana data z fifo
				FTDI_BE		<= (others => '1');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= not FTDI_nTXE;--'1';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';

			when TRANSMIT_ABORT =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '1';
				FTDI_DATA	<= (others => 'Z');
				FTDI_BE		<= (others => 'Z');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '1';
				AF_DATA_Buffer_CLR <= '0';

			when TRANSMIT_BUFFER =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '0';
				FTDI_nOE	<= '1';
				FTDI_DATA	<= AF_DATA_Buffer; --odeslani bufferu
				FTDI_BE		<= (others => '1');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';

			when BUFFER_CLEAR =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '1';
				FTDI_DATA	<= AF_DATA_Buffer;
				FTDI_BE		<= (others => '1');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '1';

   
            when others =>
				--ftdi signals
				FTDI_nRD	<= '1';
				FTDI_nWR	<= '1';
				FTDI_nOE	<= '1';
				FTDI_DATA	<= (others => 'Z');
				FTDI_BE		<= (others => 'Z');
				--fifo signals - from ftdi to arch
				CH_FA_DATA 	<= (others => '0');
				CH_FA_WREN	<= '0';
				--fifo signal  - from arch to ftdi
				CH_AF_RDEN	<= '0';
				--data buffer - from arch to ftdi
				AF_DATA_Buffer_SET <= '0';
				AF_DATA_Buffer_CLR <= '0';

        end case;

    end process;


------------------------------------------------------------------------------------------------------------
--buffer for fifo data from arch to ftdi
------------------------------------------------------------------------------------------------------------
	process(Reset_N,FTDI_CLK)
    begin

        if(Reset_N = '0') then
			AF_DATA_Buffer_Valid <= '0';
			AF_DATA_Buffer <= (others => '0');
            
        
        elsif(FTDI_CLK'event and FTDI_CLK = '1') then
            
			if(AF_DATA_Buffer_CLR = '1') then
				AF_DATA_Buffer_Valid <= '0';
				AF_DATA_Buffer <= (others => '0');

			elsif(AF_DATA_Buffer_SET = '1') then
				AF_DATA_Buffer_Valid <= '1';
				AF_DATA_Buffer <= CH_AF_DATA;

			end if;

        end if;
    end process;




	
end architecture;

