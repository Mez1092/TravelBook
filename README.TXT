----------------------------------
Requisiti e creazione del database
----------------------------------

Il software richiede il dbms MySQL versione 5 o successiva.

Dalla linea di comando di MySQl, creare un nuovo database per il progetto:

 CREATE DATABASE progetto;

Creare ora un utente per il nostro database con il comando:

 CREATE USER progetto;

E concedere tutti i privilegi all'utente sul database creato (preferibilmente,
assegnare anche una password all'utente):

 GRANT ALL ON progetto.* to 'progetto'@'localhost' identified by 'password';

--------------------
Caricamento database
--------------------

 mysql -u root -p dbtravel < TravelBook.sql

-------------
Lancio Django
-------------

Da terminale, posizionandosi all'interno della cartella myTravel:

 python manage.py runserver

Copiare l'indirizzo generato su browser

NB. Alcuni oggetti utilizzati (checkbox, fieldset,..) potrebbero funzionare solo su google chrome.
	E' pertanto utilizzare un browser di quel tipo.

---------
Dati User
---------

User: admin pw: admin
User: marco pw: paolini
User: paolo pw: paolini

Gli user marco e admin hanno i permessi per creare room e location.


Modificato da PyCharm




Modificato da Git



