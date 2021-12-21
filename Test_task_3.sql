/* TEKST ZADATKA
Tablica sadr�i studente koji su upisani u godi�nji te�aj i ima neto�ne podatke u zapisima sa id-evima izme�u broja 20 i 100 (uklju�uju�i navedene). 

TABLE enrollments 

  id INTEGER NOT NULL PRIMARY KEY, 

  year INTEGER NOT NULL, 

  studentId INTEGER NOT NULL 

Napi�ite upit koji �e a�urirati kolonu 'year' na vrijednost 2015 za sve navedene krive zapise. 
*/

--RIJE�ENJE
USE master
GO
USE MAITestTaskDatabase
GO

UPDATE enrollments SET year = 2015 WHERE id >= 20 AND id <= 100 --WHERE id BETWEEN 20 AND 100 
GO


