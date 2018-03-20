		--compara a mesma coluna (a206) em dias diferentes
		SELECT F.IDSER,F.DATASER,f.A206,T.a206, (F.A206-T.A206) COMP
		FROM VALORFAM751 F 
		JOIN VALORFAM751 T
		ON F.IDSER = T.IDSER
		WHERE F.dataser = '20170124' AND T.dataser = '20170125' 
		
