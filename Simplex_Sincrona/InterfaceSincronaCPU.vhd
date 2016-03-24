library IEEE;
use IEEE.STD_LOGIC_1164.all;

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
		transmitirDado: in STD_LOGIC
	);
end InterfaceCPU;

architecture InterfaceCPU of InterfaceCPU is
	signal regDataOut: STD_LOGIC_VECTOR(7 downto 0);
begin
	dataOut <= regDataOut;
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
   	 	send <= '0';
		elsif clock'event and clock = '1' then
				regDataOut <= dadoDaMaq;
				send <= '0';
		else
			if transmitirDado = '1' then
				send <= '1';
			end if;
		end if;
	end process;
end InterfaceCPU;
