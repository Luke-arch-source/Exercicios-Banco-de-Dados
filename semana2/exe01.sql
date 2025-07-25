/*
Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados 
deverá ter o seguinte nome db_pizzaria_legal. O sistema trabalhará com as 
informações dos produtos comercializados pela empresa. O sistema trabalhará 
com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.
*/

CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_pizzas(
	codigo BIGINT AUTO_INCREMENT,
    tipo VARCHAR(255) NOT NULL,
    molho VARCHAR(255) NOT NULL,
    acompanhamento VARCHAR(255) NOT NULL,
    preco DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY(codigo)
);


INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES ("Frango com Catupiry", "tomate", "Refrigerante Coca-Cola", 15.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES ("Calabresa", "cenoura", "Salgadinho Cheetos", 30.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES ("Palmito", "sem molho", "sem acompanhamento", 40.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES("Baiana", "tomate", "Refrigerante Pepsi", 10.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES("Marinara", "tomate", "Salgadinho Fandangos", 20.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES("Chicago", "sem molho", "Refrigerante Coca-Cola", 500.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES ("Thin Crust", "cenoura", "sem acompanhamento", 600.00);
INSERT INTO tb_pizzas (tipo, molho, acompanhamento, preco) VALUES ("Toscana", "sem molho", "sem acompanhamento", 800.00);

CREATE TABLE tb_categorias(
	codigo bigint AUTO_INCREMENT,
    massa VARCHAR(255) NOT NULL,
    tempero VARCHAR(255) NOT NULL,
    sabor VARCHAR(255) NOT NULL,
    PRIMARY KEY(codigo)
);

INSERT INTO tb_categorias (massa, tempero, sabor) VALUES ("Grossa", "Gengibre", "doce");
INSERT INTO tb_categorias (massa, tempero, sabor) VALUES ("Fina", "Cebola", "salgado");
INSERT INTO tb_categorias (massa, tempero, sabor) VALUES ("Grossa", "Alçafrão", "doce");
INSERT INTO tb_categorias (massa, tempero, sabor) VALUES ("Espessa", "Cebola", "salgado");
INSERT INTO tb_categorias (massa, tempero, sabor) VALUES ("Fina", "Gengibre", "doce");

SELECT * FROM tb_categorias;




ALTER TABLE tb_pizzas ADD categoria_codigo BIGINT;

UPDATE tb_pizzas SET categoria_codigo = 1 WHERE codigo IN (1, 2, 8);
UPDATE tb_pizzas SET categoria_codigo = 2 WHERE codigo IN (3, 4, 6);

SELECT * FROM tb_pizzas;
SELECT * FROM tb_categorias;
ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categoria_codigo) REFERENCES tb_categorias(codigo);


SELECT * FROM tb_pizzas WHERE preco > 45.00;
SELECT * FROM tb_pizzas WHERE preco >= 50 AND preco <= 100;
SELECT * FROM tb_pizzas WHERE tipo LIKE "%M%";


SELECT tipo, preco FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_codigo = tb_categorias.codigo;

SELECT molho, acompanhamento FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_pizzas LEFT JOIN tb_categorias
ON tb_pizzas.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_pizzas RIGHT JOIN tb_categorias
ON tb_pizzas.categoria_codigo = tb_categorias.codigo;

SELECT * FROM tb_pizzas;
