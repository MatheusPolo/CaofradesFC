--SCRIPT MIGRAÇÃO POSIÇÕES EM CAMPO
USE CAOFRADES_FC

INSERT INTO TBL_POSICAO_JOGADOR 
	VALUES
		('Goleiro'),
		('Zagueiro'),
		('Lateral'),
		('Volante'),
		('Meia'),
		('Atacante');