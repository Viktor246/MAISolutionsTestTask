/* TEKST ZADATKA
Tablica sadrži studente koji su upisani u godišnji teèaj i ima netoène podatke u zapisima sa id-evima izmeðu broja 20 i 100 (ukljuèujuæi navedene). 

TABLE enrollments 

  id INTEGER NOT NULL PRIMARY KEY, 

  year INTEGER NOT NULL, 

  studentId INTEGER NOT NULL 

Napišite upit koji æe ažurirati kolonu 'year' na vrijednost 2015 za sve navedene krive zapise. 
*/

--RIJEŠENJE
USE master
GO
USE MAITestTaskDatabase
GO

UPDATE enrollments SET year = 2015 WHERE id >= 20 AND id <= 100 --WHERE id BETWEEN 20 AND 100 
GO


