--Utilizando OVER combinado com PARTITION BY
SELECT Name, Salary, Gender, 
	COUNT(Gender) OVER(PARTITION BY Gender) AS GenderTotals, 
	AVG(SALARY) OVER(PARTITION BY Gender) AS AvgSal, 
	MIN(Salary) OVER(PARTITION BY Gender) AS MinSal, 
	MAX(Salary) OVER(PARTITION BY Gender) AS MaxSal
FROM Employees

--https://gabrielmichi.wordpress.com/2016/12/13/como-utilizar-a-clausula-over-partition-by-order-by-no-sql-server/#more-250