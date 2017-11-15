--Buscar as cotacoes com o fornecedor,
--Utilizando CONVERT e a função ISNULL

DECLARE @DataInicio DateTime,
@DataFim DateTime,
@ID INT

SET @DataInicio = ‘[%DataInicio%]’
SET @DataFim = ‘[%DataFinal%]’
SET @ID = 1920633

SELECT
[Cotação ME] = c.cotacao,
[Cotação Cliente] = C.CodigoCliente,
[FORNECEDOR] = MF.FORNECEDORCLIENTE,
[DATA INTEGRACAO] = CONVERT (VARCHAR(10),C.DataColocacao,103) + ‘ ‘ + CONVERT (VARCHAR(5),C.DataColocacao,108),
[DATA RESPOSTA] = ISNULL(CONVERT(VARCHAR(10), DC.DataResposta, 103), ”) + ‘ ‘ + ISNULL(CONVERT(VARCHAR(5),DC.DataResposta,108),”)
FROM
COTACOES C
JOIN USUARIOSWF U (NOLOCK)
ON U.IDWF = C.ID
JOIN DESTINATARIOSCOTACAO DC (NOLOCK)
ON DC.COTACAO = C.COTACAO
JOIN MEUSFORNECEDORES MF (NOLOCK)
ON MF.Fornecedor = DC.ID
WHERE
U.ID = @ID
AND C.DataColocacao BETWEEN @DataInicio AND @DataFim
AND MF.ID = 1920633