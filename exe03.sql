CREATE DATABASE db_estudantes;
USE db_estudantes;

CREATE TABLE tb_estudantes(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    datadeentrada DATE,
    nota DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(id)



);



INSERT INTO tb_estudantes(nome, idade, datadeentrada, nota) 
VALUES ("JOANA", 15, "2020-09-13", 8.50),
("MICHAEL JACKSON", 10, "2021-04-15", 7.00),
("MARTHA", 8, "2022-04-04", 10.00),
("LUCAS", 16, "2018-07-07", 6.00),
("LUKE", 12, "2015-06-06", 8.00),
("LEX", 14, "2022-05-16", 3.00),
("ELIZABETH", 16, "2020-04-15", 4.00),
("KAYKE", 12, "2018-12-06", 5.00);

SELECT * FROM tb_estudantes WHERE nota > 7.0;
SELECT * FROM tb_estudantes WHERE nota < 7.0;
UPDATE tb_estudantes SET nota = 10.00 WHERE id = 6;
SELECT * FROM tb_estudantes; 