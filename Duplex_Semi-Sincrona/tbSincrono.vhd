library ieee;
use ieee.std_logic_1164.all;

entity tbSincrono is
end tbSincrono;

architecture tbSincrono of tbSincrono is
-- Sinais da CPU e interface local
	signal clockCPU: std_logic;
	signal resetCPU: std_logic;
-- Sinais entre CPU e interface local
	signal prontoParaProximoDadoCPU: std_logic;
	signal dadoCPU: std_logic_vector(7 downto 0);
	signal transmitirDadoCPU: std_logic;
	signal dadoRecebidoCPU: std_logic;
	signal dadoDaInterfaceCPU: std_logic_vector(7 downto 0);
-- Sinais do Periferico e interface local
	signal clockPeriferico: std_logic;
	signal resetPeriferico: std_logic;
-- Sinais entre Periferico e interface local
	signal prontoParaProximoDadoPeriferico: std_logic;
	signal dadoPeriferico: std_logic_vector(7 downto 0);
	signal transmitirDadoPeriferico: std_logic;
	signal dadoRecebidoPeriferico: std_logic;
	signal dadoDaInterfacePeriferico: std_logic_vector(7 downto 0);
-- Sinais entre interfaces
 	signal send1: std_logic;
	signal dado1: std_logic_vector(7 downto 0);
	signal send2: std_logic;
	signal dado2: std_logic_vector(7 downto 0);
	signal ack1: std_logic;
	signal ack2: std_logic;

begin

	resetCPU <= '1', '0' after 90ns;
	process
	begin
		clockCPU <= '0', '1' after 15ns;
		wait for 30ns;
	end process;

	MaquinaCPU: entity work.CPU port map
	(
		clock => clockCPU,
		reset => resetCPU,
		dadoParaInterface => dadoCPU,
		prontoParaProximoDado => prontoParaProximoDadoCPU,
		transmitirDado => transmitirDadoCPU,
		dadoDaInterface => dadoDaInterfaceCPU,
		dadoRecebido => dadoRecebidoCPU
		);
	InterfaceCPU: entity work.InterfaceCPU port map
	(
		clock => clockCPU,
		reset => resetCPU,
		send => send1,
		ack => ack1,
		dataOut => dado1,
		receive => send2,
		accept => ack2,
		dataIn => dado2,
		dadoDaMaq => dadoCPU,
		prontoParaProximoDado => prontoParaProximoDadoCPU,
		transmitirDado => transmitirDadoCPU,
		dadoParaMaq => dadoDaInterfaceCPU,
		dadoRecebido => dadoRecebidoCPU
	);

	resetPeriferico <= '1', '0' after 90ns;
	process
	begin
		clockPeriferico <= '0', '1' after 15ns;
		wait for 30ns;
	end process;

	MaquinaPeriferico: entity work.Periferico port map
	(
		clock => clockPeriferico,
		reset => resetPeriferico,
		dadoParaInterface => dadoPeriferico,
		prontoParaProximoDado => prontoParaProximoDadoPeriferico,
		transmitirDado => transmitirDadoPeriferico,
		dadoDaInterface => dadoDaInterfacePeriferico,
		dadoRecebido => dadoRecebidoPeriferico
	);
	InterfacePeriferico: entity work.InterfacePeriferico port map
	(
		clock => clockPeriferico,
		reset => resetPeriferico,
		send => send2,
		ack => ack2,
		dataOut => dado2,
		receive => send1,
		accept => ack1,
		dataIn => dado1,
		dadoDaMaq => dadoPeriferico,
		prontoParaProximoDado => prontoParaProximoDadoPeriferico,
		transmitirDado => transmitirDadoPeriferico,
		dadoParaMaq => dadoDaInterfacePeriferico,
		dadoRecebido => dadoRecebidoPeriferico
	);
end tbSincrono;
