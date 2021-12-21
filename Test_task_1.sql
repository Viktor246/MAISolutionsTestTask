/* TEKST ZADATKA
Sljedeće dvije tablice definiraju korisnike aplikacije i njihove uloge: 

 

TABLE users 

  id INTEGER NOT NULL PRIMARY KEY, 

  userName VARCHAR(50) NOT NULL 

 

TABLE roles 

  id INTEGER NOT NULL PRIMARY KEY, 

  role VARCHAR(20) NOT NULL 

users_roles tablica sadrži mapiranje između svakog korisnika i njegovih uloga. Svaki korisnik može imati više uloga i svaka uloga može imati više korisnika. 

Ažurirajte donji CREATE TABLE upit, na način da: 

Samo korisnici iz users tablice mogu postojati unutar tablice users_roles. 

Samo uloge iz roles tablice mogu postojati unutar tablice users_roles. 

Korisnik može imati specifičnu ulogu samo jednom. 

 CREATE TABLE users_roles ( 

roleId INTEGER, 

userId INTEGER 

) 
*/

--RIJEŠENJE
USE master
GO
USE MAITestTaskDatabase
GO

CREATE TABLE users_roles ( 
	roleId INTEGER, 
	userId INTEGER,
	FOREIGN KEY (roleId)
	REFERENCES roles(id),
	FOREIGN KEY (userId)
	REFERENCES users(id),
	CONSTRAINT unique_roles UNIQUE (roleId, userId)
) 
GO