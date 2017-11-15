--Update utilizando JOIN

BEGIN TRAN
UPDATE USUARIOS
SET STATUS = -1
FROM USUARIOS U
JOIN usuariosWF UWF
on u.id = UWF.idWF
where uwf.id = 1565186 AND u.loginname is null and u.datacadastramento > ‘2017-02-12’

UPDATE USUARIOSWF
SET LIBERADO = 0
FROM USUARIOS U
JOIN usuariosWF UWF on u.id = UWF.idWF
where uwf.id = 1565186 AND u.loginname is null and u.datacadastramento > ‘2017-02-12’