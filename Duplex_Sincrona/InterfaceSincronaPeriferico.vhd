library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSincronaPERIF is
	type ESTADO_TRANSMISSAO is (transmite, esperaResposta, processa);
end definicoesTransmissaoSincronaPERIF;




library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use work.definicoesTransmissaoSincronaPERIF.all;

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
	signal contador: STD_LOGIC_VECTOR(15 downto 0);
	signal regDadoMaq: STD_LOGIC_VECTOR(7 downto 0);
	signal DadoReady: STD_LOGIC;
begin
	dataOut <= regDadoMaq;
	dadoParaMaq <= regDataIn;
	regDataIn <= dataIn;
	
	regDadoMaq <= (others=>'1') when dadoDaMaq = 1 or dadoDaMaq = 3 else dadoDaMaq;
	
	prontoParaProximoDado <= '1' when dadoReady = '1' else '0';
	
	dadoRecebido <= receive;
	
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			contador <= (others=>'0');
			estadoTx <= esperaResposta;
			send <= '0';
			dadoReady <= '0';
		elsif clock'event and clock = '1' then
			case estadoTX is
			
				when transmite =>
					send <= '1';
					if regDadoMaq = x"FF" then
						dadoReady <= '0';
						send <= '0';
						estadoTx <= esperaResposta;
					else
						dadoReady <= '1';
					end if;
				
				when esperaResposta =>
					if receive = '1' then
						if regDataIn = x"FF" then
							estadoTx <= processa;
						end if;
					end if;
				
				when processa =>
					if contador < 5 then
						contador <= contador + 1;
					else
						contador <= (others=>'0');
						estadoTx <= transmite;
					end if;
					
			end case;
			
		end if;
	end process;
end InterfacePeriferico;