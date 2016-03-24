library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSemiSincronaCPU is
	type ESTADO_TRANSMISSAO is (esperaDados, esperaAck, esperaFimAck);
end definicoesTransmissaoSemiSincronaCPU;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesTransmissaoSemiSincronaCPU.all;

entity InterfaceCPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona
		send: out STD_LOGIC;
		ack: in STD_LOGIC;
		dataOut : out STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoDaMaq : in STD_LOGIC_VECTOR(7 downto 0);
		prontoParaProximoDado: out STD_LOGIC;
		transmitirDado: in STD_LOGIC
	);
end InterfaceCPU;

architecture InterfaceCPU of InterfaceCPU is
	signal estadoTx: ESTADO_TRANSMISSAO;
	signal regDataOut: STD_LOGIC_VECTOR(7 downto 0);
begin
	dataOut <= regDataOut;
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			estadoTx <= esperaDados;
			prontoParaProximoDado <= '0';
   	 		send <= '0';
		elsif clock'event and clock = '1' then
			case estadoTx is
				when esperaDados =>
					prontoParaProximoDado <= '0';
					if transmitirDado = '1' then
						regDataOut <= dadoDaMaq;
						send <= '1';
						estadoTx <= esperaAck;
					end if;	
					
				when esperaAck =>
					if ack = '1' then
						send <= '0';
						estadoTx <= esperaFimAck;
					end if;

				when esperaFimAck =>
					if ack = '0' then
						estadoTx <= esperaDados;
						prontoParaProximoDado <= '1';
					end if;
				when others => null;
			end case;
		end if;
	end process;
end InterfaceCPU;
