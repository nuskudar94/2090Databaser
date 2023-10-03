CREATE SCHEMA kunde;

CREATE TABLE kunde.Kunde(
	kundenummer serial PRIMARY KEY,
	kundenavn text NOT NULL,
	kundeadresse text,
	postnr int,
	poststed text
	);

CREATE TABLE kunde.Prosjekt(
	prosjektnummer serial PRIMARY KEY,
	prosjektleder text REFERENCES kunde.Ansatt(ansattnr),
	prosjektnavn text NOT NULL,
	kundenummer int REFERENCES kunde.Kunde(kundenummer),
	status text 
		CHECK (status = 'planlagt' OR status = 'aktiv' OR status = 'ferdig')
	);

CREATE TABLE kunde.Ansatt(
	ansattnr int PRIMARY KEY,
	navn text NOT NULL,
	fødselsdato date ,
	ansattDato date 
	);

CREATE TABLE AnsattDeltarIProsjekt(
	ansattnr serial REFERENCES kunde.Ansatt(ansattnr),
	prosjektnr serial REFERENCES kunde.Prosjekt(prosjektnummer)
	CONSTRAINT ansattDelt PRIMARY KEY (ansattnr,prosjektnr)
	);

--Hva er primærnøkkelen i relasjonen Ansatt? Hva med relasjonen AnsattDeltarIProsjekt?
-- Ansattnr ,   ansattnr,prosjektnr

--Hva er nøkkelattributtene i relasjonen Ansatt? Hva med relasjonen AnsattDeltarIProsjekt?
--ansattnr,  (ansattnr,prosjektnr)

--Har relasjonen Ansatt en kandidatnøkkel? I så fall, hva er kandidatnøkkelen?
--ansattnr, det betyr at 

--Hva er supernøklene i relasjonen Ansatt?
-- (ansattnr,navn), ansattnr


--Legg til info kunde
INSERT INTO kunde.Kunde(kundenavn, kundeadresse, postnr, poststed)
VALUES ("KIWI","MOLDEGATA 23", 0445,"OSLO" ), ("REMA1000", "ASENGATA 5",0332,"OSLO");


