library IEEE;
use IEEE.STD_LOGIC_1164.all;

package definicoesTransmissaoAssincronaPERF is
	type ESTADO_TRANSMISSAO is (esperaSend, esperaFimSend);
end definicoesTransmissaoAssincronaPERF;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesTransmissaoAssincronaPERF.all;

entity InterfacePeriferico is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona 
		receive: in STD_LOGIC;
		accept: out STD_LOGIC;
		dataIn: in STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoParaMaq: out STD_LOGIC_VECTOR(7 downto 0);
		dadoRecebido: out STD_LOGIC
	);
end InterfacePeriferico;

architecture InterfacePeriferico of InterfacePeriferico is
	signal estadoRx: ESTADO_TRANSMISSAO;
	signal regDataIn: STD_LOGIC_VECTOR(7 downto 0);
begin
	dadoParaMaq <= regDataIn;
	Recepcao: process(clock, reset)
	begin
		if reset = '1' then
			dadoRecebido <= '0';
			accept <= '0';
		elsif clock'event and clock = '1' then
			case estadoRx is
				when esperaSend =>
					if receive = '1' then
						regDataIn <= dataIn;
						accept <= '1';
						dadoRecebido <= '1';
						estadoRx <= esperaFimSend;
					end if;	
					
				when esperaFimSend =>
					dadoRecebido <= '0';
					if receive = '0' then
						accept <= '0';
						estadoRx <= esperaSend;
					end if;
				when others => null;
			end case;
		end if;
  end process;
end InterfacePeriferico;
