/* TEKST ZADATKA
Informacije o ljubimcima su �uvani unutar dvije razli�ite tablice: 

TABLE dogs 

  id INTEGER NOT NULL PRIMARY KEY, 

  name VARCHAR(50) NOT NULL 

TABLE cats 

  id INTEGER NOT NULL PRIMARY KEY, 

  name VARCHAR(50) NOT NULL 

Napi�ite upit koji �e vratiti sva razli�ita imena iz obje tablice. 
*/

--RIJE�ENJE
USE master
GO
USE MAITestTaskDatabase
GO

SELECT name FROM dogs UNION SELECT name FROM cats
GO



