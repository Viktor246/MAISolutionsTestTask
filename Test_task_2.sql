/* TEKST ZADATKA
Zapisi kori�tenja aplikacije su �uvani unutar sljede�e tablice: 

TABLE sessions 

  id INTEGER PRIMARY KEY, 

  userId INTEGER NOT NULL, 

  duration DECIMAL NOT NULL 

Napi�ite upit koji vra�a userId i prosje�no trajanje sesije za svakog korisnika koji ima vi�e od jedne sesije.  
*/

--RIJE�ENJE
USE master
GO
USE MAITestTaskDatabase
GO

SELECT userId, AVG(duration) FROM sessions GROUP BY userId HAVING COUNT(*) > 1
GO