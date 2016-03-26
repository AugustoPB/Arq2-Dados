library ieee;
use ieee.std_logic_1164.all;

entity tbSincrono is
end tbSincrono;

architecture tbSincrono of tbSincrono is
	signal clock: std_logic;
	signal reset: std_logic;
-- Sinais entre CPU e interface local
	signal prontoParaProximoDadoCPU: std_logic;
	signal dadoCPU: std_logic_vector(7 downto 0);
	signal transmitirDadoCPU: std_logic;
-- Sinais entre Periferico e interface local
	signal dadoRecebidoPeriferico: std_logic;
	signal dadoGuardadoPeriferico: std_logic;
	signal dadoDaInterfacePeriferico: std_logic_vector(7 downto 0);
-- Sinais entre interfaces
 	signal send: std_logic;
	signal ack: std_logic;
	signal dado: std_logic_vector(7 downto 0);

begin

	reset <= '1', '0' after 100 ns;
	process
	begin
		clock <= '0', '1' after 15 ns;
		wait for 30 ns;
	end process;

	MaquinaCPU: entity work.CPU port map
	(
		clock => clock,
		reset => reset,
		dadoParaInterface => dadoCPU,
		prontoParaProximoDado => prontoParaProximoDadoCPU,
		transmitirDado => transmitirDadoCPU
	);
	InterfaceCPU: entity work.InterfaceCPU port map
	(
		clock => clock,
		reset => reset,
		send => send,
		ack => ack,
		dataOut => dado,
		dadoDaMaq => dadoCPU,
		prontoParaProximoDado => prontoParaProximoDadoCPU,
		transmitirDado => transmitirDadoCPU
	);

	MaquinaPeriferico: entity work.Periferico port map
	(
		clock => clock,
		reset => reset,
		dadoDaInterface => dadoDaInterfacePeriferico,
		dadoRecebido => dadoRecebidoPeriferico,
		dadoGuardado=> dadoGuardadoPeriferico
	);
	
	InterfacePeriferico: entity work.InterfacePeriferico port map
	(
		clock => clock,
		reset => reset,
		receive => send,
		accept => ack,
		dataIn => dado,
		dadoGuardado => dadoGuardadoPeriferico,
		dadoParaMaq => dadoDaInterfacePeriferico,
		dadoRecebido => dadoRecebidoPeriferico
	);
end tbSincrono;
