 

  SET statement_timeout = 0;
  SET lock_timeout = 0;
  SET client_encoding = 'UTF8';
  SET standard_conforming_strings = on;
  SET check_function_bodies = false;
  SET client_min_messages = warning;



  SET default_tablespace = '';

  SET default_with_oids = false;

  DROP TABLE IF EXISTS Alunos;
  DROP TABLE IF EXISTS Presenca;
  DROP TABLE IF EXISTS Atividades;
  DROP TABLE IF EXISTS Pagamentos;

CREATE DATABASE Escola;

USE Escola;

CREATE TABLE Alunos (
    aluno_id INT IDENTITY(1,1) PRIMARY KEY,  
    nome NVARCHAR(100) NOT NULL,              
    email NVARCHAR(150) NOT NULL UNIQUE,      
    data_nascimento DATE NOT NULL,            
    data_cadastro DATETIME DEFAULT GETDATE()  
);


CREATE TABLE Presenca (
    presenca_id INT IDENTITY(1,1) PRIMARY KEY,  
    aluno_id INT NOT NULL,                       
    data_presenca DATE NOT NULL,                 
    status CHAR(1) NOT NULL,                     
    CONSTRAINT fk_presenca_aluno FOREIGN KEY (aluno_id) 
        REFERENCES Alunos(aluno_id)
);


CREATE TABLE Atividades (
    atividade_id INT IDENTITY(1,1) PRIMARY KEY,  
    descricao NVARCHAR(255) NOT NULL,            
    data_atividade DATE NOT NULL,                
    local NVARCHAR(150) NULL                     
);


CREATE TABLE Pagamentos (
    pagamento_id INT IDENTITY(1,1) PRIMARY KEY,  
    aluno_id INT NOT NULL,                       
    data_pagamento DATE NOT NULL,                
    valor DECIMAL(10,2) NOT NULL,                
    forma_pagamento NVARCHAR(50) NOT NULL,       
    CONSTRAINT fk_pagamento_aluno FOREIGN KEY (aluno_id)
        REFERENCES Alunos(aluno_id)
); 