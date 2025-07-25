/*
Crie um banco de dados para uma plataforma de Cursos Online (EAD). O nome do 
Banco de dados deverá ter o seguinte nome db_curso_da_minha_vida. O sistema 
trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_cursos e tb_categorias, que deverão 
estar relacionadas.
*/

CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_cursos(
	codigo BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    numero_alunos INT NOT NULL,
    valor DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY(codigo)
);


INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES ("Matemática para o Ensino Médio e Fundamental", "Exatas", 300, 400.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES ("Arqueologia para Iniciantes", "Humanidades", 400, 1000.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES ("Engenharia Avançada", "Exatas", 200, 3000.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES("Português para Concursos", "Humanidades", 500, 200.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES("Python para Iniciantes", "Programação", 600, 450.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES("Espanhol para Iniciantes", "Humanidades", 500, 150.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES ("Literatura Avançada", "Humanidades", 600, 40.00);
INSERT INTO tb_cursos (nome, tipo, numero_alunos, valor) VALUES ("Java para Iniciantes", "Programação", 500, 30.00);

CREATE TABLE tb_categorias(
	codigo bigint AUTO_INCREMENT,
    numero_docentes INT NOT NULL,
    tempo_conclusao_dias INT NOT NULL,
    idioma_do_curso VARCHAR(255) NOT NULL,
    PRIMARY KEY(codigo)
);

INSERT INTO tb_categorias (numero_docentes, tempo_conclusao_dias, idioma_do_curso) VALUES (20, 150, "Português");
INSERT INTO tb_categorias (numero_docentes, tempo_conclusao_dias, idioma_do_curso) VALUES (30, 30, "Inglês");
INSERT INTO tb_categorias (numero_docentes, tempo_conclusao_dias, idioma_do_curso) VALUES (15, 120, "Português");
INSERT INTO tb_categorias (numero_docentes, tempo_conclusao_dias, idioma_do_curso) VALUES (15, 60, "Inglês");
INSERT INTO tb_categorias (numero_docentes, tempo_conclusao_dias, idioma_do_curso) VALUES (40, 90, "Português");

SELECT * FROM tb_categorias;

ALTER TABLE tb_cursos ADD categoria_codigo BIGINT;

UPDATE tb_cursos SET categoria_codigo = 1 WHERE codigo IN (1, 4, 6);
UPDATE tb_cursos SET categoria_codigo = 4 WHERE codigo IN (2, 5, 8);

SELECT * FROM tb_cursos;
SELECT * FROM tb_categorias;

ALTER TABLE tb_cursos ADD CONSTRAINT fk_cursos_categorias
FOREIGN KEY (categoria_codigo) REFERENCES tb_categorias(codigo);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE "%J%";


SELECT nome, valor FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_codigo = tb_categorias.codigo;

SELECT tipo FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_cursos LEFT JOIN tb_categorias
ON tb_cursos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_cursos RIGHT JOIN tb_categorias
ON tb_cursos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_cursos;




