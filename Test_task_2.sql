/* TEKST ZADATKA
Zapisi korištenja aplikacije su èuvani unutar sljedeæe tablice: 

TABLE sessions 

  id INTEGER PRIMARY KEY, 

  userId INTEGER NOT NULL, 

  duration DECIMAL NOT NULL 

Napišite upit koji vraæa userId i prosjeèno trajanje sesije za svakog korisnika koji ima više od jedne sesije.  
*/

--RIJEŠENJE
USE master
GO
USE MAITestTaskDatabase
GO

SELECT userId, AVG(duration) FROM sessions GROUP BY userId HAVING COUNT(*) > 1
GO