--Utilizando CTE

WITH CONSULTA(LOGINN, CLIENTE)
AS
(select U.LOGINNAME LOGINN,
UWF.IDWF CLIENTE
from USUARIOS U
INNER JOIN USUARIOSWF UWF
ON U.ID = UWF.IDWF
INNER JOIN GrupoComprasUsuarios GC
ON UWF.IDWF = GC.IDWF
WHERE UWF.ID = 1803460
AND UWF.LIBERADO = 1)

--CONSULTA PORTERIOR
SELECT DISTINCT C.CLIENTE, C.LOGINN,
IIF(G.GRUPOCOMPRAS = �OBR�, �OBR�,(IIF (G.GRUPOCOMPRAS = �MDO�, �MDO�,(IIF (G.GRUPOCOMPRAS = �P04�, �P04�, �Outros�)))))
AS STATUS_CONTRATO
from consulta C
INNER JOIN GrupoComprasUsuarios G
ON G.IDWF = C.CLIENTE
GROUP BY C.CLIENTE, C.LOGINN