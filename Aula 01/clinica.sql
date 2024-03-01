create database clinica;

use clinica;

create table sala (
	numeroSala int primary key unique not null ,
    andar int unique not null
);

create table medicos (
	CRM varchar(15) primary key unique not null,
    nome varchar(40) not null,
    idade int,
    especialidade char(20) not null default 'Ortopedia',
    CPF varchar(15) unique not null,
    dataAdmissao date
);

create table pacientes (
	RG varchar(15) primary key unique not null,
    nome varchar(40) not null,
    dataNasc date,
    cidade char(30) default 'Itabuna',
    doenca varchar(40) not null,
    planoSaude varchar(40) not null default 'SUS'
);

create table funcionario (
	matricula varchar(15) primary key unique not null,
    nome varchar(40) not null,
    dataNasc date not null,
    dateAdmissao date not null,
    cargo varchar(40) not null default 'Assistente Médico',
    salario float not null default '510'
);

create table consulta (
	codigoConsulta int primary key unique not null,
    dataHorario datetime 
);

