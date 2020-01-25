[dbo].[ITEM_NOTA]


CREATE VIEW _TESTE AS
SELECT 
	 IDNOTA 
	,DATA
	,ID_FORMA
	,ID_CLIENTE
	,ID_VENDEDOR
	,SUM(INF.TOTAL) AS TOTAL
FROM [dbo].[NOTA_FISCAL] NF
INNER JOIN ITEM_NOTA INF
ON INF.ID_NOTA_FISCAL = NF.IDNOTA
WHERE IDNOTA = 1010
GROUP BY IDNOTA 
		 ,DATA
		 ,ID_FORMA
		 ,ID_CLIENTE
		 ,ID_VENDEDOR
		 ,ID_NOTA_FISCAL



UPDATE NF
SET 
NF.TOTAL = INF.TOTAL
FROM _TESTE INF
INNER JOIN [dbo].[NOTA_FISCAL] NF
ON INF.IDNOTA = NF.IDNOTA




CREATE VIEW V_RELATORIO_OLTP AS
SELECT C.NOME, C.SOBRENOME, C.SEXO, DATA, IDNOTA, P.PRODUTO, NF.TOTAL
FROM CLIENTE C
INNER JOIN NOTA_FISCAL NF
ON IDCLIENTE = ID_CLIENTE
INNER JOIN ITEM_NOTA INF 
ON NF.IDNOTA = INF.ID_NOTA_FISCAL
INNER JOIN PRODUTO P
ON P.IDPRODUTO = INF.ID_PRODUTO

SELECT * FROM V_RELATORIO_OLTP

ALTER TABLE [dbo].[ENDERECO]
ADD CONSTRAINT FK_ENDERECO_ID_CLIENTE FOREIGN KEY (ID_CLIENTE)
REFERENCES [dbo].[CLIENTE] (IDCLIENTE)


ALTER TABLE [dbo].[NOTA_FISCAL]
ADD CONSTRAINT FK_NOTA_FISCAL_ID_CLIENTE FOREIGN KEY (ID_CLIENTE)
REFERENCES [dbo].[CLIENTE] (IDCLIENTE)

ALTER TABLE [dbo].[NOTA_FISCAL]
ADD CONSTRAINT FK_NOTA_FISCAL_ID_FORMA FOREIGN KEY (ID_FORMA)
REFERENCES [dbo].[FORMA_PAGAMENTO] (IDFORMA)

ALTER TABLE [dbo].[NOTA_FISCAL]
ADD CONSTRAINT FK_NOTA_FISCAL_ID_VENDEDOR FOREIGN KEY (ID_VENDEDOR)
REFERENCES [dbo].[VENDEDOR] (IDVENDEDOR)




ALTER TABLE [dbo].[ITEM_NOTA]
ADD CONSTRAINT FK_ITEM_NOTA_ID_PRODUTO FOREIGN KEY (ID_PRODUTO)
REFERENCES [dbo].[PRODUTO] (IDPRODUTO)

ALTER TABLE [dbo].[ITEM_NOTA]
ADD CONSTRAINT FK_ITEM_NOTA_ID_NOTA FOREIGN KEY (ID_NOTA_FISCAL)
REFERENCES [dbo].[NOTA_FISCAL] (IDNOTA)


ALTER TABLE [dbo].[PRODUTO]
ADD CONSTRAINT FK_PRODUTO_ID_FORNECEDOR FOREIGN KEY (ID_FORNECEDOR)
REFERENCES [dbo].[FORNECEDOR] (IDFORNECEDOR)

ALTER TABLE [dbo].[PRODUTO]
ADD CONSTRAINT FK_PRODUTO_ID_CATEGORIA FOREIGN KEY (ID_CATEGORIA)
REFERENCES [dbo].[CATEGORIA] (IDCATEGORIA)


ALTER TABLE [dbo].[VENDEDOR]
ADD CONSTRAINT FK_VENDEDOR_ID_GERENTE FOREIGN KEY (ID_GERENTE)
REFERENCES [dbo].[VENDEDOR] (IDVENDEDOR)





