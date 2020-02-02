--CREATE DATABASE COMERCIO_STAGE 
USE COMERCIO_STAGE

-- CLIENTE
-- VENDEDOR
-- CATEGORIA
-- FORNECEDOR
-- PRODUTO
-- FORMA PAGAMENTO

-- Fatos

-- TOTAL
-- QUANTIDADE
-- LUCRO
-- CUSTO

-- Tabela de cliente

ALTER TABLE ST_CLIENTE
ADD EMAIL VARCHAR(100)

CREATE TABLE ST_CLIENTE(
	 IDCLIENTE		INT DEFAULT NULL
	,NOME			VARCHAR(100) DEFAULT NULL
	,SEXO			VARCHAR(20) DEFAULT NULL
	,NASCIMENTO		DATE DEFAULT NULL
	,CIDADE 		VARCHAR(100) DEFAULT NULL
	,ESTADO			VARCHAR(10) DEFAULT NULL
	,REGIAO			VARCHAR(20) DEFAULT NULL
) 

CREATE TABLE ST_VENDEDOR(
	 IDVENDEDOR		INT DEFAULT NULL
	,NOME			VARCHAR(50) DEFAULT NULL
	,SEXO			VARCHAR(20) DEFAULT NULL
	,IDGERENTE		INT DEFAULT NULL
)

CREATE TABLE ST_FORNECEDOR(
	 IDFORNECEDOR	INT DEFAULT NULL
	,NOME			VARCHAR(50) DEFAULT NULL
)

CREATE TABLE ST_CATEGORIA(
	 IDCATEGORIA		INT DEFAULT NULL
	,NOME			VARCHAR(100) DEFAULT NULL
)

CREATE TABLE ST_FORMA(
	 IDFORMA		INT DEFAULT NULL
	,FORMA			VARCHAR(50) DEFAULT NULL
)

DROP TABLE ST_PRODUTO
CREATE TABLE ST_PRODUTO(
	 IDPRODUTO		INT DEFAULT NULL
	,PRODUTO			VARCHAR(100) DEFAULT NULL
	,VALOR_UNITARIO NUMERIC(10,2) DEFAULT NULL
	,CUSTO_MEDIO	NUMERIC(10,2) DEFAULT NULL
	,ID_CATEGORIA	INT DEFAULT NULL
)

CREATE TABLE ST_NOTA(
	 IDNOTA		INT DEFAULT NULL
)

CREATE TABLE ST_FATO(
	 ID_CLIENTE		INT DEFAULT NULL
	,ID_VENDEDOR	INT DEFAULT NULL
	,ID_PRODUTO		INT DEFAULT NULL
	,ID_FORNECEDOR	INT DEFAULT NULL
	,ID_NOTA		INT DEFAULT NULL
	,ID_FORMA		INT DEFAULT NULL
	,QUANTIDADE		INT DEFAULT NULL
	,TOTAL_ITEM		NUMERIC(10,2) DEFAULT NULL
	,DATA			DATE DEFAULT NULL
	,CUSTO_TOTAL	NUMERIC(10,2) DEFAULT NULL
	,LUCRO_TOTAL	NUMERIC(10,2) DEFAULT NULL
)

TRUNCATE TABLE ST_VENDEDOR

SELECT * FROM ST_CLIENTE