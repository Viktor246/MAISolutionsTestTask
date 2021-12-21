/* TEKST ZADATKA
Unutar kompanije, nekoliko razlièitih aplikacija radi insert redova u messages tablicu koja bi kasnije trebala biti parsirana i zapisi bi trebali biti insertirani u tablice kojima zapisi nativno pripadaju. Uzmite u obzir sljedeæe tablice: 

TABLE messages 

  id INTEGER NOT NULL PRIMARY KEY, 

  type VARCHAR(30) NOT NULL 

  data VARCHAR(100) NOT NULL 

TABLE notifications 

  id INTEGER NOT NULL PRIMARY KEY, 

  message VARCHAR(100) NOT NULL 

TABLE alerts 

  id INTEGER NOT NULL PRIMARY KEY, 

  shortMessage VARCHAR(15) NOT NULL 

 

Napišite proceduru koja se zove ParseMessages, u default schemi, koja æe napraviti sljedeæe za sve redove u messages tablici: 

Insertirati sve redove gdje je u koloni type vrijednost 'notification' u notifications tablicu, a kolona message æe biti popunjena podacima iz kolone data tablice messages. 

Insertirati sve redove gdje je u koloni type vrijednost 'alerts' u alerts tablicu, a kolona shortMessage æe biti popunjena sa prvih 15 karaktera iz kolone data tablice messages. 

U oba sluèaja, kolona id treba u tablicama 'alerts' i 'notifications' biti jednaka koloni id u tablici messages. 

Bonus: Procedura može biti pokrenuta neogranièeno puta, na zahtjev (izbjeæi PK violation). */

--RIJEŠENJE
USE master
GO
USE MAITestTaskDatabase
GO
CREATE PROCEDURE ParseMessages
AS
INSERT INTO notifications (id, message) SELECT id, data FROM messages WHERE type LIKE 'notification' AND id NOT IN (SELECT id FROM notifications WHERE id IS NOT NULL)
INSERT INTO alerts (id, shortMessage) SELECT id, SUBSTRING(data,1,15) FROM messages WHERE type LIKE 'alert' AND id NOT IN (SELECT id FROM alerts WHERE id IS NOT NULL)
GO
EXEC ParseMessages
GO