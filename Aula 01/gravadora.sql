-- Código para criação de database --
create database gravadora;

-- ativar o banco de dados --
use gravadora;

-- comando para criar a tabela --
create table cd (
	codigo int primary key auto_increment,
    nome varchar(100),
    gravadora varchar(100),
    anoGravação date
);

create table banda (
	codigo int primary key auto_increment,
    nome varchar(100),
    biografia varchar(500)    
);

-- tabela associativa --
create table musica (
	numero int primary key auto_increment,
    titulo varchar(100),
    tempo int,
    genero varchar(100),
    -- declarar variaveis para buscar dados de outras tabelas --
    cd_codigo int,
	banda_codigo int,
	-- ligar os dados de outra tabela com a variaveis dessa tabela --
    foreign key(cd_codigo)references cd (codigo),
    foreign key(banda_codigo)references banda (codigo)
);
