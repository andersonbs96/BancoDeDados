-- cria um banco de dados --
create database clinica_correcao;

-- ativa o banco de dados --
use clinica_correcao;

-- ENTIDADE FORTE --
create table salas (
	numeroSala 			int primary key unique not null,
    andar 				int unique not null,
    
    check (numeroSala > 1 and numeroSala < 50),
    check (andar < 12)
);


create table medicos (
	crm 				char(12) primary key,
    nome 				varchar(100) not null,
    idade 				int,
    especialidade 		varchar(50) not null default "Ortopedia",
	cpf 				char(11) unique not null,
    dataAdmissao		date not null,
    
    fk_numeroSala		int unique not null,
    
    foreign key (fk_numeroSala) references salas (numeroSala)
);

-- ENTIDADE FORTE --
create table pacientes (
	rg 					char(9) primary key,
    nome 				varchar(100) not null,
    dataNasc 			date,
    cidade 				varchar(30) default "Itabuna",
    doenca 				varchar(50) not null,
    planoSaude 			varchar(40) not null default "SUS"
);

-- ENTIDADE ASSOCIATIVA --
create table consulta (
	codConsulta 		int primary key not null unique,
    dataConsulta 		datetime not null,
    
    fk_rgPaciente 		char(9) not null,
    fk_crmMedico 		char(12) not null,
	
    -- Restrições -- 
	foreign key (fk_rgPaciente) references pacientes (rg) ,
    foreign key (fk_crmMedico) references medicos (crm)
);


create table funcionarios (
	matricula 			varchar(15) primary key unique not null,
    nome 				varchar(40) not null,
    dataNasc 			date not null,
    dateAdmissao 		date not null,
    cargo 				varchar(40) not null default "Assistente Médico",
    salario 			float not null default '510'
);
