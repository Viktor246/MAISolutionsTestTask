/* TEKST ZADATKA
Osiguravaju�a ku�a �uva zapise prodaje od strane svojih zaposlenika. Svaki zaposlenik je dio �upanije (state). �upanije su dio regija (region). Sljede�e tablice sadr�e navedene podatke: 

TABLE regions 

  id INTEGER PRIMARY KEY 

  name VARCHAR(50) NOT NULL 

 

TABLE states 

  id INTEGER PRIMARY KEY 

  name VARCHAR(50) NOT NULL 

  regionId INTEGER NOT NULL REFERENCES regions(id) 

 

TABLE employees 

  id INTEGER PRIMARY KEY 

  name VARCHAR(50) NOT NULL 

  stateId INTEGER NOT NULL REFERENCES states(id) 

 

TABLE sales 

  id INTEGER PRIMARY KEY 

  amount INTEGER NOT NULL 

  employeeId INTEGER NOT NULL REFERENCES employees(id)   

 

 

 

Menad�ment zahtjeva komparativni analiti�ki izvje�taj za prodaju po regijama. 

Napi�ite upit koji vra�a: 

Naziv regije. 

Prosje�nu prodaju po zaposleniku za regiju (Ukupna prodaja po regiji / Broj zaposlenih po regiji). 

Razliku izme�u prosje�ne prodaje po regiji sa najve�om prosje�nom prodajom i prosje�ne prodaje po zaposleniku za trenutnu regiju. 

Zaposlenici mogu imati vi�estruke prodaje. Regija bez prodaje isto treba biti me�u rezultatima. Za prosje�nu prodaju za takve regije bez prodaje treba biti vra�ena 0 (nula). 
*/

--RIJE�ENJE
USE master
GO
USE MAITestTaskDatabase
GO

SELECT
	Region,
	AverageSales,
	MaxSales - AverageSales AS DifferenceMaxAvgCurrentAvg
FROM
	(
	SELECT 
		region.name AS Region,
		ISNULL((SUM(sale.amount)/COUNT(DISTINCT sale.employeeId)),0) AS AverageSales
	FROM 
		regions AS region
		FULL JOIN 
		states AS state
		ON region.id = state.regionId
		FULL JOIN 
		employees AS employee
		on state.id = employee.stateId
		FULL JOIN 
		sales AS sale
		on employee.id = sale.employeeId
	GROUP BY region.name
	) as I
CROSS JOIN 
(
	SELECT MAX(AverageSales) AS MaxSales FROM
		(SELECT 
			region.name AS Region,
			ISNULL((SUM(sale.amount)/COUNT(DISTINCT sale.employeeId)),0) AS AverageSales
		FROM 
			regions AS region
			FULL JOIN 
			states AS state
			ON region.id = state.regionId
			FULL JOIN 
			employees AS employee
			on state.id = employee.stateId
			FULL JOIN 
			sales AS sale
			on employee.id = sale.employeeId
		GROUP BY region.name
		) as M
) as N