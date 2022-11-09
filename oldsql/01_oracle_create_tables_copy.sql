alter session set nls_date_format = 'dd/MON/yyyy hh24:mi'

CREATE TABLE system.grad
(
  grad_id INT NOT NULL,
  ime VARCHAR(50) NOT NULL,
  drzava VARCHAR(50) NOT NULL,
  PRIMARY KEY (grad_id)
);

CREATE TABLE system.sportski_objekt
(
  sportski_objekt_id INT NOT NULL,
  ime VARCHAR(50) NOT NULL,
  web_stranica VARCHAR(50) NOT NULL,
  grad_id INT NOT NULL,
  PRIMARY KEY (sportski_objekt_id),
  FOREIGN KEY (grad_id) REFERENCES system.grad(grad_id)
);

CREATE TABLE system.korisnik
(
  oib INT NOT NULL,
  ime VARCHAR(50) NOT NULL,
  prezime VARCHAR(50) NOT NULL,
  PRIMARY KEY (oib)
);

CREATE TABLE system.dodatni_sadrzaj
(
  dodatni_sadrzaj_id INT NOT NULL,
  tip VARCHAR(50) NOT NULL,
  PRIMARY KEY (dodatni_sadrzaj_id)
);

CREATE TABLE system.objekt_sadrzaj
(
  sportski_objekt_id INT NOT NULL,
  dodatni_sadrzaj_id INT NOT NULL,
  PRIMARY KEY (sportski_objekt_id, dodatni_sadrzaj_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES system.sportski_objekt(sportski_objekt_id),
  FOREIGN KEY (dodatni_sadrzaj_id) REFERENCES system.dodatni_sadrzaj(dodatni_sadrzaj_id)
);

CREATE TABLE system.kvart
(
  kvart_id INT NOT NULL,
  ime VARCHAR(50) NOT NULL,
  grad_id INT NOT NULL,
  PRIMARY KEY (kvart_id),
  FOREIGN KEY (grad_id) REFERENCES system.grad(grad_id)
);

CREATE TABLE system.teren
(
  teren_id INT NOT NULL,
  vrsta_terena VARCHAR(50) NOT NULL,
  natkriven VARCHAR(50) NOT NULL,
  ime VARCHAR(50) NOT NULL,
  sportski_objekt_id INT NOT NULL,
  kvart_id INT NOT NULL,
  PRIMARY KEY (teren_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES system.sportski_objekt(sportski_objekt_id),
  FOREIGN KEY (kvart_id) REFERENCES system.kvart(kvart_id)
);

CREATE TABLE system.rezervacija
(
  pocetak VARCHAR(50) NOT NULL,
  kraj VARCHAR(50) NOT NULL,
  rezervacija_id INT NOT NULL,
  teren_id INT NOT NULL,
  oib INT NOT NULL,
  PRIMARY KEY (rezervacija_id),
  FOREIGN KEY (teren_id) REFERENCES system.teren(teren_id),
  FOREIGN KEY (oib) REFERENCES system.korisnik(oib)
);

CREATE TABLE system.rekvizit
(
  rekvizit_id INT NOT NULL,
  tip VARCHAR(50) NOT NULL,
  iznajmljen VARCHAR(50) NOT NULL,
  sportski_objekt_id INT NOT NULL,
  rezervacija_id INT NOT NULL,
  PRIMARY KEY (rekvizit_id),
  FOREIGN KEY (sportski_objekt_id) REFERENCES system.sportski_objekt(sportski_objekt_id),
  FOREIGN KEY (rezervacija_id) REFERENCES system.rezervacija(rezervacija_id)
);