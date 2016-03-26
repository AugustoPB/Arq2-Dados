library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity Periferico is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface com a interface de comunicacao
		dadoParaInterface: out STD_LOGIC_VECTOR(7 downto 0);
		prontoParaProximoDado: in STD_LOGIC;
		transmitirDado: out STD_LOGIC;
		
		dadoDaInterface: in STD_LOGIC_VECTOR(7 downto 0);
		dadoRecebido: in STD_LOGIC
	);
end Periferico;

architecture Periferico of Periferico is
	signal dadoT: STD_LOGIC_VECTOR(7 downto 0);
	signal dadoR: STD_LOGIC_VECTOR(7 downto 0);
	signal contadorT: STD_LOGIC_VECTOR(15 downto 0);
	signal contadorR: STD_LOGIC_VECTOR(15 downto 0);
begin
	
	dadoParaInterface <= dadoT;

	Recepcao: process(clock, reset)
	begin
		if reset = '1' then
			contadorR <= (others=>'0');
		elsif clock'event and clock = '1'  then
-- OBS.: O sinal dadoRecebido deve ficar apenas um ciclo em '1'
			if dadoRecebido = '1' then
				dadoR <= dadoDaInterface;
				contadorR <= contadorR + 1;
			end if;
		end if;
	end process;
		

	
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			dadoT <= x"00";
			transmitirDado <= '1';
			contadorT <= (others=>'0');
		elsif clock'event and clock = '1' then
			if prontoParaProximoDado = '1' and contadorT < 20 then
				transmitirDado <= '1';
				dadoT <= dadoT + 1;
				contadorT <= contadorT + 1;
			else
				transmitirDado <= '0';
			end if;			
		end if;
	end process;

end Periferico;
