library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSincronaPERIF is
	type ESTADO_TRANSMISSAO is (transmite, esperaResposta, processa);
end definicoesTransmissaoSincronaPERIF;




library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use work.definicoesTransmissaoSincronaCPU.all;

entity InterfacePeriferico is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona 
		send: out STD_LOGIC;
		dataOut : out STD_LOGIC_VECTOR(7 downto 0);
		
		receive: in STD_LOGIC;
		dataIn: in STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoDaMaq : in STD_LOGIC_VECTOR(7 downto 0);
		prontoParaProximoDado: out STD_LOGIC;
		transmitirDado: in STD_LOGIC;
		
		dadoParaMaq: out STD_LOGIC_VECTOR(7 downto 0);
		dadoRecebido: out STD_LOGIC
	);
end InterfacePeriferico;

architecture InterfacePeriferico of InterfacePeriferico is
	signal regDataOut: STD_LOGIC_VECTOR(7 downto 0);
	signal regDataIn: STD_LOGIC_VECTOR(7 downto 0);
	signal estadoTx: ESTADO_TRANSMISSAO;
	signal contadorT: STD_LOGIC_VECTOR(15 downto 0);
	signal contadorR: STD_LOGIC_VECTOR(15 downto 0);
begin
	dataOut <= regDataOut;
	dadoParaMaq <= regDataIn;
	regDataOut <= dadoDaMaq;
	
	send <= not(clock) when transmitirDado = '1' else '0';
	
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			prontoParaProximoDado <= '0';
			contadorT <= (others=>'0');
			contadorR <= (others=>'0');
			dadoRecebido <= '0';
			estadoTx <= esperaResposta;
		elsif clock'event and clock = '1' then
			case estadoTX is
				when transmite =>
					if contadorT < 2 then
						prontoParaProximoDado <= '1';								
						contadorT <= contadorT + 1;
					else
						contadorT <= (others=>'0');
						prontoParaProximoDado <= '0';	
						estadoTx <= esperaResposta;
					end if;
				when esperaResposta =>
					if receive = '1' and contadorR < 7 then
						regDataIn <= dataIn;
						dadoRecebido <= '1';
						contadorR <= contadorR + 1;
					elsif contadorR = 7 then
						dadoRecebido <= '0';
						contadorR <= (others=>'0');
						estadoTx <= processa;
					end if;
				when processa =>
					if contadorR < 7 then
						contadorR <= contadorR + 1;
					else
						contadorR <= (others=>'0');
						estadoTx <= transmite;
					end if;
					
			end case;
			
		end if;
	end process;
end InterfacePeriferico;

