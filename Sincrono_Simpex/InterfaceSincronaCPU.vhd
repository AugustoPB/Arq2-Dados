library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSincronaCPU is
	type ESTADO_TRANSMISSAO is (esperaDados, esperaClockAlto, esperaClockBaixo);
end definicoesTransmissaoSincronaCPU;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesTransmissaoSincronaCPU.all;

entity InterfaceCPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona
		send: out STD_LOGIC;
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
		elsif  clock'event then
			case estadoTx is
				when esperaDados =>
					if transmitirDado = '1' and  clock = '1' then 
						regDataOut <= dadoDaMaq;
						prontoParaProximoDado <= '0';
						estadoTx <= esperaClockBaixo;
					end if;
				when esperaClockBaixo =>
						if clock = '0' then 
						send <= '1';
						estadoTx <= esperaClockAlto;
						end if;
				when esperaClockAlto =>
					if clock = '1' then
						send <= '0';
						prontoParaProximoDado <= '1';
						estadoTx <= esperaDados;
					end if;
				when others => null;
			end case;
		end if;
	end process;
end InterfaceCPU;
