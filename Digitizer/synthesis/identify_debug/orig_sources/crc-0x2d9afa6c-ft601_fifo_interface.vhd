library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ft601_fifo_interface is
	port 
	(
	-- System Signals
		nRESET			:in	std_logic;
	-- FTDI-FPGA interface
		FTDI_CLK		:in	std_logic;		-- 100MHz v Synchronim rezimu
		FTDI_nRXF		:in	std_logic;		-- '0'-data ve FIFO (pro vycteni z FTDI)
		FTDI_DATA		:inout	std_logic_vector(31 downto 0);
		FTDI_nOE		:out	std_logic;		-- polarita datove brany '1'-write, '0'-read
		FTDI_nRD		:out	std_logic;		-- '0'-synchroni vycteni 1Byte z FIFO
		FTDI_nTXE		:in	std_logic;		-- '0'-vystupni FIFO nezaplneno (pro zapis do FTDI)
		FTDI_nWR		:out	std_logic;		-- '0'-synchroni zapsani 1Byte do FIFO
		FTDI_BE			:inout	std_logic_vector(3 downto 0);
	-- inter FPGA signals
		-- read signals (FTDI -> rest of Architecture)
		CH_FA_DATA		:out	std_logic_vector(31 downto 0);
		CH_FA_ALMOST_FULL	:in	std_logic;
		CH_FA_WREN		:out	std_logic;
		-- write signals (rest of Architecture -> FTDI)
		CH_AF_DATA		:in	std_logic_vector(31 downto 0);
		--CH_AF_ALMOST_EMPTY	:in	std_logic;		
		CH_AF_EMPTY		:in	std_logic;
		CH_AF_RDEN		:out	std_logic
	);	
end ft601_fifo_interface;

architecture rtl_ft601_fifo_interface OF ft601_fifo_interface is

	type	states	is (wait_0, reception_a, reception_0, transmition_f_0, transmition_f_1, transmition_0, transmition_1, transmition_a, transmition_buf_0, transmition_buf_1, transmition_buf_b_0, transmition_buf_b_1);
	signal	actual_state	:states;
	signal	data_val_fifo	:std_logic;
	signal	data_val_buf	:std_logic;
	signal	data_val_buf_b	:std_logic;
	
	--"01" --na vystupu z fifa zustala platna data
	--"10" --platna data
	
	signal	data_buf	:std_logic_vector(31 downto 0); --zachyceni neodeslane hodnoty
	signal	data_buf_b	:std_logic_vector(31 downto 0); --zachyceni neodeslane hodnoty
	
	signal	first_byte	:std_logic;
	
	signal clk_int	:std_logic;

	
begin
	clk_int	<= FTDI_CLK;
	
	process(clk_int,nRESET, data_val_fifo, data_val_buf, FTDI_nRXF, FTDI_nTXE, CH_FA_ALMOST_FULL, CH_AF_EMPTY, actual_state, FTDI_DATA)
	begin
		if(nRESET = '0')then
			data_val_fifo	<= '0';
			data_val_buf	<= '0';
			data_val_buf_b	<= '0';
			
			first_byte	<= '0';
			
			actual_state	<= wait_0;
			
			data_buf	<= (others => '0');
			data_buf_b	<= (others => '0');
			--signaly FTDI
			--FTDI_nOE 	<= '0'; --prepnuti portu FTDI na vstupni
			FTDI_nOE 	<= '1'; --XXX

			FTDI_nRD	<= '1';
			FTDI_nWR	<= '1';
			FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
			FTDI_BE 	<= (others => 'Z');
			--fifo do zakladniho stavu
			CH_FA_DATA	<= (others => '0');
			CH_FA_WREN	<= '0'; --nezapisovat
			CH_AF_RDEN	<= '0'; --necist
		elsif(clk_int = '1' and clk_int'event)then
			case actual_state is
				--cekam jeden takt na aktivovani
				when reception_a =>
						if(FTDI_nRXF = '0' and CH_FA_ALMOST_FULL = '0')then --stale je mozne prijimat data
						FTDI_nOE 	<= '0'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '0';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0';
						CH_AF_RDEN	<= '0'; --necist
						CH_FA_DATA	<= FTDI_DATA;
						
						actual_state <= reception_0;
					else --jiz neni kam davat data
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state <= wait_0;
					end if;
				
				--prijem dat z FTDI
				when reception_0 =>
					if(FTDI_nRXF = '0' and CH_FA_ALMOST_FULL = '0')then --stale je mozne prijimat data
						FTDI_nOE 	<= '0'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '0';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '1'; --ulozit
						CH_AF_RDEN	<= '0'; --necist
						CH_FA_DATA	<= FTDI_DATA;
						
						actual_state <= reception_0;
					elsif(FTDI_nRXF = '1')then --jiz neni odkud data brat
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat --protoze jiz nejsou data platna
						CH_AF_RDEN	<= '0'; --necist
						CH_FA_DATA	<= FTDI_DATA;
						
						actual_state <= wait_0;
					else --jiz neni kam davat data
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '1'; --zapsat posledni byte vycteny z ftdi
						CH_AF_RDEN	<= '0'; --necist
						CH_FA_DATA	<= FTDI_DATA;
						actual_state <= wait_0;
					end if;
				--odeslani bytu ulozeneho v bufferu
				when transmition_buf_0 =>
					if(FTDI_nTXE = '0')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '0';
						FTDI_DATA	<= data_buf; --zapsani zbyvajiciho bytu
						FTDI_BE 	<= (others => '1');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --vycist
						
						actual_state	<= transmition_buf_1;
					else
						--ftdi neni pripravene prijimat
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						data_val_buf	<= '1'; --posledni byte se nepodarilo opet odeslat
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
					end if;
				--rozhodnuti, zda-li se podarilo dato odeslat
				when transmition_buf_1 =>
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						--xxx
						--if(FTDI_nTXE = '0')then
							data_val_buf	<= '0'; --abych neprisel o dato vyctene z fifa, ktere nebylo mozne odeslat
						--else
						--	data_val_buf	<= '1';
						--end if;
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
						
				--odeslani bytu ulozeneho v bufferu
				when transmition_buf_b_0 =>
					if(FTDI_nTXE = '0')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '0';
						FTDI_DATA	<= data_buf_b; --zapsani zbyvajiciho bytu
						FTDI_BE 	<= (others => '1');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --vycist
						
						actual_state	<= transmition_buf_b_1;
					else
						--ftdi neni pripravene prijimat
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						data_val_buf	<= '1'; --posledni byte se nepodarilo opet odeslat
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
					end if;
				--rozhodnuti, zda-li se podarilo dato odeslat
				when transmition_buf_b_1 =>
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						--xxx
						--if(FTDI_nTXE = '0')then
							data_val_buf_b	<= '0'; --abych neprisel o dato vyctene z fifa, ktere nebylo mozne odeslat
						--else
						--	data_val_buf_b	<= '1';
						--end if;
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
						
				
				--odeslani jednoho zbyvajiciho bytu vycteneho z fifa
				when transmition_f_0 =>
					if(FTDI_nTXE = '0')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '0';
						FTDI_DATA	<= CH_AF_DATA; --zapsani platneho bytu na vystupu z fifa
						FTDI_BE 	<= (others => '1');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --vycist
						
						actual_state	<= transmition_f_1;
					else
						--ftdi neni pripravene prijimat
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						data_val_fifo	<= '1'; --posledni byte se nepodarilo opet odeslat
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
					end if;
				when transmition_f_1 =>
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						if(FTDI_nTXE = '0')then
							data_val_fifo	<= '0'; --abych neprisel o dato vyctene z fifa, ktere nebylo mozne odeslat
						else
							data_val_fifo	<= '1';
						end if;
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
				--cekani pred zahajenim odesilani, nez zacnou z fifa vypadavat data
				when transmition_a =>
					FTDI_nOE 	<= '1';
					FTDI_nRD	<= '1';
					FTDI_DATA	<= CH_AF_DATA;
					FTDI_BE 	<= (others => '1');
											
					CH_AF_RDEN	<= '1';
					CH_FA_WREN	<= '0';
--					data_val	<= '0';
					actual_state	<= transmition_0;
					
					first_byte	<= '1';	
				
				--odesilani dat z fifa
				when transmition_0 =>
					first_byte	<= '0';
					
					--vysilani pokud je k dispozici dostatek dat
					if(FTDI_nTXE = '0' and CH_AF_EMPTY = '0')then--porad dost dat  dispozici;
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '0';
						FTDI_DATA	<= CH_AF_DATA;
						FTDI_BE 	<= (others => '1');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '1'; --vycist
						
						actual_state <= transmition_0;
					--jiz doslo na posledni byte
					elsif(FTDI_nTXE = '0' and CH_AF_EMPTY = '1')then --odeslani posledniho bytu vypadleho z fifa
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '0';
						FTDI_DATA	<= CH_AF_DATA;
						FTDI_BE 	<= (others => '1');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						actual_state	<= transmition_1;
					
					--ftdi jiz dale neprijima data, ale fifo jeste vyda dalsi dato na vystup
					elsif(FTDI_nTXE = '1' and CH_AF_EMPTY = '0')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z');--CH_AF_DATA;
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --vycist
						
						data_val_fifo	<= '1';
						data_val_buf_b	<= '1';
--						data_val_buf	<= '1';
						if(first_byte = '1')then
							data_val_buf	<= '0'; --kdyz se jeste nestihlo presunout data na ftdi branu, tak by doslo k odeslani falesnych dat
						else
							data_val_buf	<= '1';
						end if;
						
						data_buf	<= FTDI_DATA;
						data_buf_b	<= CH_AF_DATA;
						
						actual_state <= wait_0;
					--ftdi jiz dale neprijima data, ale jedna se jiz o posledni byte vycteny z fifa
					elsif(FTDI_nTXE = '1' and CH_AF_EMPTY = '1')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z');--CH_AF_DATA;
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --vycist
						
						--rozhodnuti jestli se ma ulozit byte na brane ftdi
						if(first_byte = '1')then
							data_val_buf <= '0';
						else
							data_val_buf <= '1';
							data_buf	<= FTDI_DATA;
						end if;
						--ulozeni bytu vycteneho z fifa abych o nej neprisel
						data_val_buf_b	<= '1';
						data_buf_b	<= CH_AF_DATA;
						--ve fifu nebudou spravna data 
						data_val_fifo	<= '0';
	
						actual_state <= wait_0;
					end if;
					
				--ukonceni procesu odesilani
				when transmition_1 =>
						FTDI_nOE 	<= '1'; --prepnuti portu FTDI na vystupni
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						if(FTDI_nTXE = '0')then
							data_val_buf	<= '0'; 
						else
							data_val_buf	<= '1'; --abych neprisel o dato vyctene z fifa, ktere nebylo mozne odeslat
							data_buf	<= FTDI_DATA;
						end if;
						
						data_val_fifo	<= '0';
							
						
						CH_FA_WREN	<= '0'; --neukladat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state	<= wait_0;
				
				when wait_0 =>
					--prijem dat ma nejvyssi prioritu 
					if(FTDI_nRXF = '0' and CH_FA_ALMOST_FULL = '0')then -- pokud je kam prijimat, zacnu prijimat data
						FTDI_nOE 	<= '0';
						FTDI_nRD	<= '1';--'0';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0';--neukladat '1'; --ulozit
						CH_AF_RDEN	<= '0'; --necist
						CH_FA_DATA	<= FTDI_DATA;
						
						actual_state <= reception_a;
					elsif(FTDI_nTXE = '0' and data_val_buf = '1')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state <= transmition_buf_0;
					elsif(FTDI_nTXE = '0' and data_val_buf_b = '1')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state <= transmition_buf_b_0;
						
					elsif(FTDI_nTXE = '0' and data_val_fifo = '1')then --na sbernici zbyl byte dat, ktery zbyl vlivem preruseni odesilani
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '0'; --necist
						
						actual_state <= transmition_f_0;
					--odesilani dat vyctenych z fifa
					elsif(FTDI_nTXE = '0' and CH_AF_EMPTY = '0')then
						FTDI_nOE 	<= '1';
						FTDI_nRD	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						FTDI_nWR	<= '1';
									
						actual_state	<= transmition_a;
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '1'; --vycist
						
					--pokud zustava v klidovem stavu
					else
						--FTDI_nOE 	<= '0';
						FTDI_nOE 	<= '1'; --XXX

						FTDI_nRD	<= '1';
						FTDI_nWR	<= '1';
						FTDI_DATA	<= (others => 'Z'); --kdyz se cte, brana uvedena v hiZ stavu
						FTDI_BE 	<= (others => 'Z');
						
						CH_FA_WREN	<= '0'; --nezapisovat
						CH_AF_RDEN	<= '0'; --necist
						
						CH_FA_DATA	<= (others => '1');
						actual_state <= wait_0;
					end if;
					
				when others => 
					actual_state <= wait_0;
			end case;
		end if;
	end process;
end architecture;

