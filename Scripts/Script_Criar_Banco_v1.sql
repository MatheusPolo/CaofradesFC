--SCRIPT DE CRIA��O DE TABELAS

CREATE DATABASE CAOFRADES_FC 

USE CAOFRADES_FC

CREATE TABLE TBL_PESSOA(
	ID_PESSOA INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NOME NVARCHAR(MAX) NOT NULL,
	DATA_NASCIMENTO DATETIME NOT NULL
);

CREATE TABLE TBL_UNIFORME(
	ID_UNIFORME INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DESCRICAO NVARCHAR(MAX) NOT NULL
);

CREATE TABLE TBL_PONTO_ENCONTRO(
	ID_PONTO_ENCONTRO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	ENDERECO NVARCHAR(MAX) NOT NULL,
	DESCRICAO NVARCHAR(MAX) NULL
);

CREATE TABLE TBL_POSICAO_JOGADOR(
	ID_POSICAO_JOGADOR INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DESCRICAO VARCHAR(100) NOT NULL
);

CREATE TABLE TBL_STATUS_JOGADOR(
	ID_STATUS_JOGADOR INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DESCRICAO VARCHAR(100) NOT NULL
);

CREATE TABLE TBL_LOCAL_JOGO(
	ID_LOCAL_JOGO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	ENDERECO NVARCHAR(MAX) NOT NULL
);

CREATE TABLE TBL_RESULTADO_JOGO(
	ID_RESULTADO_JOGO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	RESULTADO VARCHAR(50) NOT NULL
);

CREATE TABLE TBL_CARTAO(
	ID_CARTAO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	TIPO_CARTAO VARCHAR(50) NOT NULL
);

CREATE TABLE TBL_ADVERSARIO(
	ID_ADVERSARIO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NOME NVARCHAR(MAX) NOT NULL,
	RESPONSAVEL NVARCHAR(MAX) NULL,
	GOLS_FEITOS INT NOT NULL,
);

CREATE TABLE TBL_STATUS_PARTIDA_JOGADOR(
	ID_STATUS_PARTIDA_JOGADOR INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DESCRICAO VARCHAR(100) NOT NULL
);

CREATE TABLE TBL_JOGADOR(
	ID_JOGADOR INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	NUM_CAMISA INT NULL,
	ID_PESSOA INT NOT NULL FOREIGN KEY REFERENCES TBL_PESSOA(ID_PESSOA),
	ID_POSICAO INT NOT NULL FOREIGN KEY REFERENCES TBL_POSICAO_JOGADOR(ID_POSICAO_JOGADOR),
	ID_STATUS_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_STATUS_JOGADOR(ID_STATUS_JOGADOR),
);

CREATE TABLE TBL_JOGOS(
	ID_JOGO INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	DATA_JOGO DATETIME NOT NULL,
	ID_PONTO_ENCONTRO INT NULL FOREIGN KEY REFERENCES TBL_PONTO_ENCONTRO(ID_PONTO_ENCONTRO),
	ID_LOCAL_JOGO INT NULL FOREIGN KEY REFERENCES TBL_LOCAL_JOGO(ID_LOCAL_JOGO),
	ID_ADVERSARIO INT NULL FOREIGN KEY REFERENCES TBL_ADVERSARIO(ID_ADVERSARIO),
	ID_RESULTADO_JOGO INT NULL FOREIGN KEY REFERENCES TBL_RESULTADO_JOGO(ID_RESULTADO_JOGO),
	ID_UNIFORME INT NULL FOREIGN KEY REFERENCES TBL_UNIFORME(ID_UNIFORME)
);

CREATE TABLE TBL_ESCALACAO_JOGO(
	ID_JOGO INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGOS(ID_JOGO),
	ID_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGADOR(ID_JOGADOR),
	ID_STATUS_PARTIDA_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_STATUS_PARTIDA_JOGADOR(ID_STATUS_PARTIDA_JOGADOR),
);

CREATE TABLE TBL_CARTAO_JOGO(
	ID_JOGO INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGOS(ID_JOGO),
	ID_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGADOR(ID_JOGADOR),
	ID_CARTAO INT NOT NULL FOREIGN KEY REFERENCES TBL_CARTAO(ID_CARTAO),
);

CREATE TABLE TBL_GOL_JOGO_CAO(
	ID_JOGO INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGOS(ID_JOGO),
	ID_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGADOR(ID_JOGADOR),
	NUM_GOL INT NOT NULL,
	DESCRICAO NVARCHAR(MAX) NULL
);

CREATE TABLE TBL_ASSISTENCIA_JOGO_CAO(
	ID_JOGO INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGOS(ID_JOGO),
	ID_JOGADOR INT NOT NULL FOREIGN KEY REFERENCES TBL_JOGADOR(ID_JOGADOR),
	NUM_ASSISTENCIA INT NOT NULL,
	DESCRICAO NVARCHAR(MAX) NULL
);