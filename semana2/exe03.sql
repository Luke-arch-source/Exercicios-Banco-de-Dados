/*
Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados 
deverá ter o seguinte nome db_farmacia_bem_estar. O sistema trabalhará com as 
informações dos produtos comercializados pela empresa. O sistema trabalhará com 
2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.
*/

CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos(
	codigo BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    qta_dose INT NOT NULL,
    preco DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY(codigo)
);


INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES ("Minoxidil União Química", "Capilar", 300, 400.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES ("Desloratadina Globo Pharma", "Nasal", 400, 1000.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES ("Cloridrato de Duloxetina EMS", "Anti-depressivo", 200, 3000.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES("Succinato de Sumatriptana Biolab Genéricos", "Enxaqueca", 500, 200.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES("Pregabalina Sandoz", "Dores neuropáticas/ansiedade", 600, 450.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES("Oxcarbazepina Medley", "Antiepilépticos", 500, 150.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES ("Erfandel", "Câncer de bexiga", 600, 40.00);
INSERT INTO tb_produtos (nome, tipo, qta_dose, preco) VALUES ("Sonrisal", "azia/má digestão/acidez estomacal", 500, 30.00);

SELECT * FROM tb_produtos;

# qta_comprar: quantos itens desse produto podem ser comprados de uma vez
CREATE TABLE tb_categorias(
	codigo bigint AUTO_INCREMENT,
    quantia INT NOT NULL,
    qta_comprar INT NULL,
    PRIMARY KEY(codigo)
);

INSERT INTO tb_categorias (quantia, qta_comprar) VALUES (200, 100);
INSERT INTO tb_categorias (quantia, qta_comprar) VALUES (300, 30);
INSERT INTO tb_categorias (quantia, qta_comprar) VALUES (150, 20);
INSERT INTO tb_categorias (quantia, qta_comprar) VALUES (160, 100);
INSERT INTO tb_categorias (quantia, qta_comprar) VALUES (400, 97);

SELECT * FROM tb_categorias;

ALTER TABLE tb_produtos ADD categoria_codigo BIGINT;

UPDATE tb_produtos SET categoria_codigo = 1 WHERE codigo IN (1, 2, 3);
UPDATE tb_produtos SET categoria_codigo = 4 WHERE codigo IN (4, 5, 6);

SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoria_codigo) REFERENCES tb_categorias(codigo);


SELECT * FROM tb_produtos WHERE preco > 50.00;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;
SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, preco FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_codigo = tb_categorias.codigo;

SELECT tipo FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_produtos;