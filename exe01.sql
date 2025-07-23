CREATE DATABASE db_colaboradores;
USE db_colaboradores;

CREATE TABLE tb_colaboradores(
	senha BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    dataentrada DATE,
    salario DECIMAL NOT NULL,
    PRIMARY KEY(senha)



);



INSERT INTO tb_colaboradores(nome, idade, dataentrada, salario) 
VALUES ("MARTHA", 36, "2025-06-15", 2400.00),
("PEDRO", 26, "2024-08-12", 2500.00),
("LUKE", 80, "2022-12-17", 1000.00),
("JONATHAN", 75, "2021-08-14", 2800.00),
("ULISSES", 28, "2020-06-24", 3000.00),
("JACK", 50, "2019-11-10", 4000.00);

SELECT * FROM tb_colaboradores WHERE salario > 2000;
SELECT * FROM tb_colaboradores WHERE salario < 2000;

UPDATE tb_colaboradores SET salario = 3000.00 WHERE senha = 2;
SELECT * FROM tb_colaboradores;
