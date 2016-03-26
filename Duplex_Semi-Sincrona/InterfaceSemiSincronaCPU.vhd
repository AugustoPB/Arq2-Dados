library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSincronaCPU is
	type ESTADO_TRANSMISSAO is (transmite, esperaAck, esperaResposta, aloca, processa);
end definicoesTransmissaoSincronaCPU;



library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use work.definicoesTransmissaoSincronaCPU.all;

entity InterfaceCPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona
		send: out STD_LOGIC;
		ack: in STD_LOGIC;
		dataOut : out STD_LOGIC_VECTOR(7 downto 0);
		
		receive: in STD_LOGIC;
		accept: out STD_LOGIC;
		dataIn: in STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoDaMaq : in STD_LOGIC_VECTOR(7 downto 0);
		prontoParaProximoDado: out STD_LOGIC;
		transmitirDado: in STD_LOGIC;
		
		dadoParaMaq: out STD_LOGIC_VECTOR(7 downto 0);
		dadoRecebido: out STD_LOGIC
	);
end InterfaceCPU;

architecture InterfaceCPU of InterfaceCPU is
	signal regDataOut: STD_LOGIC_VECTOR(7 downto 0);
	signal regDataIn: STD_LOGIC_VECTOR(7 downto 0);
	signal estadoTx: ESTADO_TRANSMISSAO;
	signal contador: STD_LOGIC_VECTOR(15 downto 0);
	signal regDadoMaq: STD_LOGIC_VECTOR(7 downto 0);
begin
	dataOut <= regDadoMaq;
	dadoParaMaq <= regDataIn;
	regDataIn <= dataIn;
	
	regDadoMaq <= (others=>'1') when dadoDaMaq = 7 or dadoDaMaq = 14 else dadoDaMaq;
	
	
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			prontoParaProximoDado <= '0';
			contador <= (others=>'0');
			dadoRecebido <= '0';
			accept <= '0';
			send <= '0';
			estadoTx <= transmite;
			
		elsif clock'event and clock = '1' then
			case estadoTX is
			
				when transmite =>
					prontoParaProximoDado <= '0';
				if transmitirDado = '1' then
					send <= '1';
					estadoTx <= esperaAck;
				end if;
					
				when esperaAck =>
					if ack = '1' then
						if regDadoMaq = x"FF" then
							estadoTx <= esperaResposta;
						else
							prontoParaProximoDado <= '1';
							estadoTx <= transmite;
						end if;
						
						send <= '0';
					end if;
				
				when esperaResposta =>
					if receive = '1' then
						dadoRecebido <= '1';
						accept <= '1';
						estadoTx <= aloca;
					end if;
					
				when aloca =>
					accept <= '0';
					dadoRecebido <= '0';
					if regDataIn = x"FF" then
						estadoTx <= processa;
					else
						estadoTx <= esperaResposta;
					end if;
				
				when processa =>
					if contador < 5 then
						contador <= contador + 1;
					else
						contador <= (others=>'0');
						prontoParaProximoDado <= '1';
						estadoTx <= transmite;
					end if;
					
			end case;
			
		end if;
	end process;
end InterfaceCPU;

