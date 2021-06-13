-- Banco de dados exemplificando o registro de ponto de uma empresa
-- Criando o banco de dados
CREATE DATABASE Empresa;

-- Selecionando o banco de dados
USE Empresa;

-- Criando a tabela empresa
CREATE TABLE empresa (
  idEmpresa             INT PRIMARY KEY AUTO_INCREMENT,
  nomeEmpresa 			VARCHAR(100) NOT NULL,
  CNPJ 					CHAR(20) NOT NULL, -- 14 Dígitos Fixos + Ponto e Barra
  logradouro			VARCHAR(200) NOT NULL,
  bairro 				VARCHAR(200) NOT NULL,
  cidade				VARCHAR(50) NOT NULL,
  CEP					CHAR(9) NOT NULL, -- 8 Dígitos Fixos + Traço
  email					VARCHAR(50) NOT NULL,
  telefone				CHAR(14) NOT NULL -- 8 Dígito Fixos + DDD e Parênteses
) auto_increment = 1;

select * from empresa;

-- Criando a tabela usuario
CREATE TABLE usuario(
	idUsuario 				INT PRIMARY KEY auto_increment, -- Primary Key que será inserida apenas quando fkUsuario do funcionário for atualizado de null para algum numero
    email					VARCHAR(50) NOT NULL,
    senha					VARCHAR(20) NOT NULL 
);

select * from usuario;

update usuario set email = "termoio@termoio.com" where idusuario = 11;
update usuario set senha = "termoio" where idusuario = 11;
-- Criando a tabela funcionario
CREATE TABLE funcionario (
  idFuncionario			INT PRIMARY KEY AUTO_INCREMENT, -- auto_increment para facilitar a inserção de novos id's 
  nomeFuncionario 		VARCHAR(50) NOT NULL,
  fkEmpresa				INT, -- 14 digitos fixo + pontos e barra
  CPF 					CHAR(14) NOT NULL, -- 11 dígitos fixos + pontos e traço
  RG 					CHAR(12) NOT NULL, -- 11 dígitos que podem variar de acordo com o Estado + pontos e traço
  fkUsuario				INT,
  dataNasc				DATE NOT NULL,
  FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa) -- foreign key que referencia o CNPJ adicionado na tabela "Empresa" 
)auto_increment = 100;

CREATE TABLE relogio_de_ponto_sensor(
	idRelogio_de_ponto 		INT PRIMARY KEY auto_increment, 
    localizacao 			VARCHAR(50) NOT NULL,
    fkEmpresa				INT,
    idSensor				INT,
    FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
)auto_increment = 10000;

-- Criando a tabela registro_de_ponto
CREATE TABLE registro_de_ponto (
	idPonto					INT PRIMARY KEY auto_increment, 
    fkFuncionario 			INT NOT NULL,
    temperatura 			DECIMAL(4,2) NOT NULL, -- Decimal de no maximo 4 dígitos e 2 após a virgula
    data_horario 			DATETIME NOT NULL, -- DATETIME é a data + horário
    fkRelogio_de_ponto		INT, -- Identificação de qual sensor o funcionario usou para bater o ponto
    NSR 					INT NOT NULL, -- NSR é a ordem de chegada de cada funcionario ao bater o ponto- Ex. 1º, 2º, 3º   
    FOREIGN KEY (fkFuncionario) REFERENCES Funcionario(idFuncionario),
    FOREIGN KEY (fkRelogio_de_ponto) REFERENCES Relogio_de_ponto_sensor(idRelogio_de_ponto)
)auto_increment = 10000;

select * from registro_de_ponto;

select count(temperatura) as 'hipotermia' from registro_de_ponto where temperatura <= 22;

select(select count(temperatura) from registro_de_ponto where temperatura < 19 ) as 'hipotermia', (select count(temperatura) from registro_de_ponto where temperatura between 19 and 22) as 'febre', (select count(temperatura) from registro_de_ponto where temperatura > 23 ) as 'febre alta', (select count(temperatura) from registro_de_ponto where temperatura > 23 ) as 'hipertermia', count(idPonto) as 'totalUsers' from registro_de_ponto;

select(select count(temperatura) from registro_de_ponto where data_horario between "2021-01-01" and "2021-01-31" ) as 'janeiro',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-02-01" and "2021-02-28" ) as 'fevereiro',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-03-01" and "2021-03-31" ) as 'março',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-04-01" and "2021-04-30" ) as 'abril',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-05-01" and "2021-05-31" ) as 'maio',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-06-01" and "2021-06-30" ) as 'junho',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-07-01" and "2021-07-31" ) as 'julho',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-08-01" and "2021-08-31" ) as 'agosto',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-09-01" and "2021-09-30" ) as 'setembro',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-10-01" and "2021-10-31" ) as 'outubro',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-11-01" and "2021-11-30" ) as 'novembro',
 (select count(temperatura) from registro_de_ponto where data_horario between "2021-12-01" and "2021-12-31" ) as 'dezembro';
 
 insert into registro_de_ponto values (null, 100, 32.7, '2021-08-21 00:00:00', 10000, 10); 
 
SELECT count(temperatura)
FROM registro_de_ponto
WHERE MONTH(data_horario) = MONTH(current_date()) and temperatura between 21.69 and 24.12;

select (select count(temperatura) from registro_de_ponto where (temperatura < 23 or temperatura > 25)  and data_horario between '2021-06-01' and '2021-06-30')  as 'temperaturas anormais no mês';
select (select count(temperatura) from registro_de_ponto) as 'total temperaturas';
 
  select(select count(temperatura) from registro_de_ponto where temperatura between 21.69 and 24.12) as 'temperaturas_anormais';