DROP TABLE IF EXISTS cadastro;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS categoria_prod;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS entrega;
DROP TABLE IF EXISTS pagamento;

CREATE TABLE cadastro(
	cod_cliente serial,
	nome_cliente varchar(50),
	cpf varchar(16),
	email varchar(30),
	nome_usuario varchar(20) NOT NULL UNIQUE,
	senha varchar(8) NOT NULL,
	PRIMARY KEY(cod_cliente)
);

CREATE TABLE categoria_prod(
	cod_categoria serial,
	nome_categoria varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY(cod_categoria)	
);

CREATE TABLE produto(
	cod_prod serial,
	nome_prod varchar(50) NOT NULL,
	descricao_prod varchar(100),
	qtde_estoque numeric, 
	preco_prod numeric NOT NULL,
	cod_categoria int NOT NULL,
	PRIMARY KEY(cod_prod),
	FOREIGN KEY(cod_categoria) REFERENCES categoria_prod
);

CREATE TABLE compra(
	cod_compra serial unique,
	data_compra date,
	numero_compra serial unique,
	total_compra numeric,
	cod_cliente int NOT NULL,
	PRIMARY KEY(cod_compra),
	FOREIGN KEY(cod_cliente) REFERENCES cadastro
);

CREATE TABLE entrega(
	cod_entrega serial,
	endereco varchar(100),
	cidade varchar(50),
	cep varchar(10),
	uf varchar(2),
	cod_compra int NOT NULL,
	PRIMARY KEY(cod_entrega),
	FOREIGN KEY(cod_compra) REFERENCES compra
);

CREATE TABLE pagamento(
	cod_pagamento serial,
	data_pagamento date,
	forma_pagamento int NOT NULL,
	valor_total numeric,
	PRIMARY KEY(cod_pagamento),
	FOREIGN KEY(cod_compra) REFERENCES compra
);

INSERT INTO cadastro(nome_cliente, cpf, email, nome_usuario, senha)   VALUES('USUARIO', '439', 'JOICE@HOTMAIL', 'USUARIO', 'senha');

INSERT INTO categoria_prod VALUES(default, 'Alimentos');
INSERT INTO categoria_prod VALUES(default, 'Limpeza');
INSERT INTO categoria_prod VALUES(default, 'Higiene');
INSERT INTO categoria_prod VALUES(default, 'Bebidas');


INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Arroz Namorado', '1kg de arro tipo 1', 19, 12.00, 1);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Farinha de Trigo Dona Benta', '1kg de farinha de trigo', 15, 2.00, 1);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Chocolate Hersheys', '25g', 28, 4.00, 1);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Suco Del Vale', '1 Litro', 14, 4.60, 4);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Sabonete Protex', 'Cream 90g', 45, 1.05, 3);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Sabão OMO multiação', '1kg', 2, 7.00, 2);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Pipoca Yoki Premium', '500g', 18, 2.50, 1);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Colgate', '90g', 30, 2.00, 3);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Coca Cola Lata', '375ml', 50, 2.50, 4);  
INSERT INTO produto (nome_prod, descricao_prod, qtde_estoque, preco_prod, cod_categoria) values ('Bom Bril', '60g', 20, 2.00, 2);  