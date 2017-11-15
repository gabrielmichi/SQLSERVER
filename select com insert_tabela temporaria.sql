--QUERY SIMPLES UTILIZANDO VARIAVEL, SELECT COM INSERT
BEGIN TRAN
declare @PPEDIDO INT = 17361595
INSERT INTO ITEMPEDIDO (PEDIDO,item,quantidade,descricao,preco,unidade,codigo,fabricante,complemento,prazo,ipi,ipiincluso,estoque,observacao,icms,icmsincluso,tipoimposto,precofob,pis,pisincluso,cofins,cofinsIncluso,basecalculo,basecalculoimposto,dataprevista,nbm,cotacao,agrupador,ValorLiquidoSAP,arredondamentoIVA,iva_codigo,PrecoCheio,obsfor,produto,localfaturamento,localentrega,grupocompras)
SELECT @PPEDIDO,item,quantidade,descricao,preco,unidade,codigo,fabricante,complemento,prazo,ipi,ipiincluso,estoque,observacao,icms,icmsincluso,tipoimposto,precofob,pis,pisincluso,cofins,cofinsIncluso,basecalculo,basecalculoimposto,dataprevista,nbm,cotacao,agrupador,ValorLiquidoSAP,arredondamentoIVA,iva_codigo,PrecoCheio,obsfor,produto,localfaturamento,localentrega,grupocompras
FROM ItemPrePedidoWF
WHERE prepedido = 11233037


--QUERY UTILIZADA PARA CORRIGIR MOTOR DE REGRAS TECNISA
--COM TABELA TEMPORARIA
BEGIN TRAN
DECLARE @MOTORREGRA INT
CREATE TABLE #tmpTECNISA (MOTORDEREGRAS INT, CONTROLE INT )
INSERT INTO #tmpTECNISA VALUES(3852065,0),(3852349,0)
WHILE EXISTS(SELECT * FROM #tmpTECNISA WHERE controle = 0) BEGIN
SELECT @MOTORREGRA = MAX(MOTORDEREGRAS) FROM #tmpTECNISA WHERE Controle = 0
–INSERT INTO fluxostatusdocumento (tiporegraid,documentomotorregrasid,id,estadoinicial,estadofinal,qtdeaprovadores,datainicial,datafinal,datacriacao)
SELECT tiporegraid,@MOTORREGRA,id,estadoinicial,estadofinal,qtdeaprovadores,datainicial,datafinal,datacriacao
FROM fluxostatusdocumento
WHERE datainicial = (SELECT MAX(DATAINICIAL) FROM fluxostatusdocumento WHERE documentomotorregrasid = @MOTORREGRA
AND ESTADOINICIAL = 107 AND ESTADOFINAL = 105)
UPDATE #tmpTECNISA SET Controle = 1 WHERE MOTORDEREGRAS = @MOTORREGRA
END
DROP TABLE #tmpTECNISA
SELECT cNmColuna = C.name
,cTpColuna = UPPER(TYPE_NAME(C.user_type_id))
,iMaxDigit = CASE
WHEN T.precision = 0
THEN C.max_length
ELSE T.precision
END
FROM sys.all_columns C WITH(NOLOCK)
INNER JOIN sys.types T WITH(NOLOCK) ON T.user_type_id = C.user_type_id
WHERE C.object_id = Object_Id('TABELA')