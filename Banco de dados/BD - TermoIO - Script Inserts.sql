USE Empresa;

-- Inserindo dados na tabela empresa
INSERT INTO empresa VALUES 		
(1, 'Tivit', '43.124.548/7956-26', 'Avenida Nove de Julho, 1130', 'Vila Clementino', 'São Paulo', '04027-000', 'empresa@tivit.com.br', '(11)5832-7427');

SELECT * FROM empresa;

-- Inserindo dados dos funcionarios no banco de registro de ponto da mesma empresa
INSERT INTO funcionario	
VALUES 					
						(null,'Giovana Nascimento', null, '549.761.324-52', '64.785.132-5', null, '2000-08-08'),
						(null, 'Luiz Henrique', null, '654.225.874-95', '84.759.163-6', null, '2000-07-24'),
						(null,'Flavia Oliveira', null, '456.987.456-85', '78.512.549-6', null, '1998-05-14'),
						(null,'Breno Fraga', null, '485.316.958-45', '58.745.221-6', null, '2001-02-03'),
						(null,'Joao Henrique', null, '498.721.364-59', '47.596.154-2', null, '1998-04-10'),
						(null,'Joao Vitor', null, '958.746.215-85', '13.548.796-2', null, '2003-09-02');   

SELECT * FROM funcionario;
						
-- Inserindo valores do relogio de ponto acoplado ao sensor de temperatura                        
insert into relogio_de_ponto_sensor values (null, 'Bloco A - Porta 3', null, 10001),
										   (null, 'Bloco A - Porta 3', null, 10001),
									       (null, 'Bloco A - Porta 3', null, 10002),
                                           (null, 'Bloco A - Porta 3', null, 10003);
							
select * from relogio_de_ponto_sensor;

-- Como funcionará a medição de temperatura no Registro de Ponto
-- Inserindo dados na tabela resgistro_de_ponto 
INSERT INTO registro_de_ponto VALUES (null, 104, 40.00, now(), null, 1),
									 (null, 103, 38.00, now(), null, 2),
									 (null, 102, 36.50, NOW(), null, 3);

SELECT * FROM registro_de_ponto;
-- Como será concedida a um funcionario a permissão para acessar o Dashboard
-- Inserindo dados dos usuarios que terão acesso ao Login do site
INSERT INTO usuario VALUES (null, 'Giovana_Tivit', 'Giovana2021'),
						   (null, 'JoaoVitor_Tivit', 'Joao2021');
                           
-- Atualizando fkUsuario para deixar de ser null na tabela funcionario
update funcionario set fkUsuario = 10000 where idFuncionario = 10000;
update funcionario set fkUsuario = 10001 where idFuncionario = 10001;
         
-- Exibir os dados dos funcionarios que tem login         
SELECT * FROM usuario;