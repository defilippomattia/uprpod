alter session set nls_date_format = 'dd/MON/yyyy hh24:mi'

CREATE TABLE grad
(
  grad_id INT NOT NULL,
  ime VARCHAR(60) NOT NULL,
  drzava VARCHAR(60) NOT NULL,
  PRIMARY KEY (grad_id)
);

CREATE TABLE korisnik
(
  oib VARCHAR(11) NOT NULL,
  ime VARCHAR(60) NOT NULL,
  prezime VARCHAR(60) NOT NULL,
  PRIMARY KEY (oib)
);

CREATE TABLE dodatni_sadrzaj
(
  dodatni_sadrzaj_id INT NOT NULL,
  tip VARCHAR(60) NOT NULL,
  PRIMARY KEY (dodatni_sadrzaj_id)
);

CREATE TABLE kvart
(
  kvart_id INT NOT NULL,
  ime VARCHAR(60) NOT NULL,
  grad_id INT NOT NULL,
  PRIMARY KEY (kvart_id),
  FOREIGN KEY (grad_id) REFERENCES grad(grad_id)
);

CREATE TABLE sportski_objekt
(
  sportski_objekt_id INT NOT NULL,
  ime VARCHAR(60) NOT NULL,
  web_stranica VARCHAR(60) NOT NULL,
  kvart_id INT NOT NULL,
  PRIMARY KEY (sportski_objekt_id),
  FOREIGN KEY (kvart_id) REFERENCES kvart(kvart_id)
);

CREATE TABLE teren
(
  teren_id INT NOT NULL,
  vrsta_terena VARCHAR(60) NOT NULL,
  natkriven INT NOT NULL,
  ime VARCHAR(60) NOT NULL,
  sportski_objekt_id INT NOT NULL,
  PRIMARY KEY (teren_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES sportski_objekt(sportski_objekt_id)
);

CREATE TABLE rezervacija
(
  pocetak DATE NOT NULL,
  kraj DATE NOT NULL,
  rezervacija_id INT NOT NULL,
  teren_id INT NOT NULL,
  oib VARCHAR(11) NOT NULL,
  PRIMARY KEY (rezervacija_id),
  FOREIGN KEY (teren_id) REFERENCES teren(teren_id),
  FOREIGN KEY (oib) REFERENCES korisnik(oib)
);

CREATE TABLE rekvizit
(
  rekvizit_id INT NOT NULL,
  tip VARCHAR(60) NOT NULL,
  marka VARCHAR(60) NOT NULL,
  sportski_objekt_id INT NOT NULL,
  PRIMARY KEY (rekvizit_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES sportski_objekt(sportski_objekt_id)
);

CREATE TABLE rezervacija_rekvizit
(
  rezervacija_id INT NOT NULL,
  rekvizit_id INT NOT NULL,
  PRIMARY KEY (rezervacija_id, rekvizit_id),
  FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(rezervacija_id),
  FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(rekvizit_id)
);

CREATE TABLE objekt_sadrzaj
(
  sportski_objekt_id INT NOT NULL,
  dodatni_sadrzaj_id INT NOT NULL,
  PRIMARY KEY (sportski_objekt_id, dodatni_sadrzaj_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES sportski_objekt(sportski_objekt_id),
  FOREIGN KEY (dodatni_sadrzaj_id) REFERENCES dodatni_sadrzaj(dodatni_sadrzaj_id)
);