/* TEKST ZADATKA
Osiguravajuæa kuæa èuva zapise prodaje od strane svojih zaposlenika. Svaki zaposlenik je dio županije (state). Županije su dio regija (region). Sljedeæe tablice sadrže navedene podatke: 

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

 

 

 

Menadžment zahtjeva komparativni analitièki izvještaj za prodaju po regijama. 

Napišite upit koji vraæa: 

Naziv regije. 

Prosjeènu prodaju po zaposleniku za regiju (Ukupna prodaja po regiji / Broj zaposlenih po regiji). 

Razliku izmeðu prosjeène prodaje po regiji sa najveæom prosjeènom prodajom i prosjeène prodaje po zaposleniku za trenutnu regiju. 

Zaposlenici mogu imati višestruke prodaje. Regija bez prodaje isto treba biti meðu rezultatima. Za prosjeènu prodaju za takve regije bez prodaje treba biti vraæena 0 (nula). 
*/

--RIJEŠENJE
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