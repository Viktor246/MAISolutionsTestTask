/* TEKST ZADATKA
Informacije o ljubimcima su èuvani unutar dvije razlièite tablice: 

TABLE dogs 

  id INTEGER NOT NULL PRIMARY KEY, 

  name VARCHAR(50) NOT NULL 

TABLE cats 

  id INTEGER NOT NULL PRIMARY KEY, 

  name VARCHAR(50) NOT NULL 

Napišite upit koji æe vratiti sva razlièita imena iz obje tablice. 
*/

--RIJEŠENJE
USE master
GO
USE MAITestTaskDatabase
GO

SELECT name FROM dogs UNION SELECT name FROM cats
GO



