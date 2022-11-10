INSERT INTO system.GRAD(GRAD_ID,IME,DRZAVA) VALUES ('1','Zagreb','RH');
INSERT INTO system.GRAD(GRAD_ID,IME,DRZAVA) VALUES ('2','Osijek','RH');

INSERT INTO system.KORISNIK(OIB,IME,PREZIME) VALUES ('0541','Marko','Markic');
INSERT INTO system.KORISNIK(OIB,IME,PREZIME) VALUES ('0311','Ivo','Ivic');
INSERT INTO system.KORISNIK(OIB,IME,PREZIME) VALUES ('0515','Lovro','Loric');

INSERT INTO system.DODATNI_SADRZAJ(DODATNI_SADRZAJ_ID,TIP) VALUES('1','Kafic');
INSERT INTO system.DODATNI_SADRZAJ(DODATNI_SADRZAJ_ID,TIP) VALUES('2','Tusevi');
INSERT INTO system.DODATNI_SADRZAJ(DODATNI_SADRZAJ_ID,TIP) VALUES('3','Teretana');

INSERT INTO system.KVART(KVART_ID,IME,GRAD_ID) VALUES ('1','Trnje','1');
INSERT INTO system.KVART(KVART_ID,IME,GRAD_ID) VALUES ('2','Tresnjevka','1');
INSERT INTO system.KVART(KVART_ID,IME,GRAD_ID) VALUES ('3','Kruge','1');
INSERT INTO system.KVART(KVART_ID,IME,GRAD_ID) VALUES ('4','Spansko','1');

INSERT INTO system.SPORTSKI_OBJEKT(SPORTSKI_OBJEKT_ID,IME,WEB_STRANICA, KVART_ID) VALUES ('1','SRC Trnje','www.srctrnje.com','1');
INSERT INTO system.SPORTSKI_OBJEKT(SPORTSKI_OBJEKT_ID,IME,WEB_STRANICA, KVART_ID) VALUES ('2','Centar Sporta','www.centsport.com','1');
INSERT INTO system.SPORTSKI_OBJEKT(SPORTSKI_OBJEKT_ID,IME,WEB_STRANICA, KVART_ID) VALUES ('3','Sport Sport','www.sportsport.com','3');
INSERT INTO system.SPORTSKI_OBJEKT(SPORTSKI_OBJEKT_ID,IME,WEB_STRANICA, KVART_ID) VALUES ('4','SK Tres','www.sktres.com','2');

INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('1','Nogomet',1,'Nogalo NT',1);
INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('2','Nogomet',0,'Nogalo NT pomocni',1);
INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('3','Tenis',0,'Teren A',1);
INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('4','Nogomet',0,'Terenko 1',1);
INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('5','Odbojka',1,'Odbojkasko 1',4);
INSERT INTO system.TEREN(TEREN_ID,VRSTA_TERENA,NATKRIVEN,IME,SPORTSKI_OBJEKT_ID) VALUES ('6','Kosarka',1,'Kosarkasko 1',4);

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '1',
    TO_DATE('23-NOV-21 19:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('23-NOV-21 20:00', 'dd-MON-yy hh24:mi'),
    '1',
    '0541');

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '2',
    TO_DATE('23-DEC-21 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('23-DEC-21 15:00', 'dd-MON-yy hh24:mi'),
    '1',
    '0311');
INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '3',
    TO_DATE('05-MAY-22 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('05-MAY-22 15:00', 'dd-MON-yy hh24:mi'),
    '2',
    '0311');

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '4',
    TO_DATE('25-NOV-22 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('25-NOV-22 15:00', 'dd-MON-yy hh24:mi'),
    '5',
    '0515');

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '5',
    TO_DATE('27-NOV-22 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('27-NOV-22 15:00', 'dd-MON-yy hh24:mi'),
    '4',
    '0515');



-- INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
--     '5',
--     TO_DATE('2021/05/23 15:00', 'yyyy/mm/dd hh24:mi'),
--     TO_DATE('2021/05/23 16:00', 'yyyy/mm/dd hh24:mi'),
--     '5',
--     '0515');

-- INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
--     '6',
--     TO_DATE('2021/05/25 15:00', 'yyyy/mm/dd hh24:mi'),
--     TO_DATE('2021/05/25 16:00', 'yyyy/mm/dd hh24:mi'),
--     '5',
--     '0515');


-- INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
--     '7',
--     TO_DATE('2021/05/27 15:00', 'yyyy/mm/dd hh24:mi'),
--     TO_DATE('2021/05/27 16:00', 'yyyy/mm/dd hh24:mi'),
--     '4',
--     '0515');

-- INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
--     '8',
--     TO_DATE('2021/05/26 15:00', 'yyyy/mm/dd hh24:mi'),
--     TO_DATE('2021/05/26 16:00', 'yyyy/mm/dd hh24:mi'),
--     '1',
--     '0515');


INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('1','Nogometna lopta','Nike','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('2','Nogometna lopta','Umbro','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('3','Kosarkaska lopta','Adidas','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('4','Kosarkaska lopta','Adidas','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('5','Kosarkaska lopta','Adidas','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('6','Kosarkaska lopta','Adidas','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('7','Teniski reket','Wilson','1');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('8','Teniski reket','Wilson','2');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('9','Teniski reket','Wilson','2');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('10','Teniski reket','Wilson','2');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('11','Kosarkaska lopta','Adidas','4');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('12','Odbojkaska lopta','Mikasa','4');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('13','Odbojkaska lopta','Mikasa','4');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('14','Odbojkaska lopta','Mikasa','4');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('15','Odbojkaska lopta','Mikasa','4');
INSERT INTO system.REKVIZIT(REKVIZIT_ID,TIP,MARKA, SPORTSKI_OBJEKT_ID) VALUES ('16','Nogometna lopta','Nike','4');


INSERT INTO system.REZERVACIJA_REKVIZIT(REZERVACIJA_ID,REKVIZIT_ID) VALUES ('1','1');
INSERT INTO system.REZERVACIJA_REKVIZIT(REZERVACIJA_ID,REKVIZIT_ID) VALUES ('2','2');

INSERT INTO system.REZERVACIJA_REKVIZIT(REZERVACIJA_ID,REKVIZIT_ID) VALUES ('4','12');
INSERT INTO system.REZERVACIJA_REKVIZIT(REZERVACIJA_ID,REKVIZIT_ID) VALUES ('4','13');
INSERT INTO system.REZERVACIJA_REKVIZIT(REZERVACIJA_ID,REKVIZIT_ID) VALUES ('4','14');


INSERT INTO system.OBJEKT_SADRZAJ(SPORTSKI_OBJEKT_ID,DODATNI_SADRZAJ_ID) VALUES('1','1');
INSERT INTO system.OBJEKT_SADRZAJ(SPORTSKI_OBJEKT_ID,DODATNI_SADRZAJ_ID) VALUES('1','2');