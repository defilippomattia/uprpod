SELECT * FROM TEREN
JOIN SPORTSKI_OBJEKT ON teren.sportski_objekt_id = sportski_objekt.sportski_objekt_id
JOIN KVART ON sportski_objekt.kvart_id = kvart.kvart_id

SELECT TEREN.VRSTA_TERENA, TEREN.NATKRIVEN, SPORTSKI_OBJEKT.IME SPORTSKI_OBJEKT_IME, KVART.IME KVART_IME
FROM TEREN
JOIN SPORTSKI_OBJEKT ON teren.sportski_objekt_id = sportski_objekt.sportski_objekt_id
JOIN KVART ON sportski_objekt.kvart_id = kvart.kvart_id

SELECT * FROM REZERVACIJA 
JOIN TEREN ON teren.teren_id = rezervacija.teren_id
JOIN SPORTSKI_OBJEKT ON sportski_objekt.sportski_objekt_id = teren.sportski_objekt_id
JOIN KVART ON kvart.kvart_id = sportski_objekt.kvart_id
WHERE CURRENT_DATE < pocetak

SELECT pocetak, kraj, teren.vrsta_terena, teren.ime TEREN_IME, kvart.ime KVART_IME FROM REZERVACIJA 
JOIN TEREN ON teren.teren_id = rezervacija.teren_id
JOIN SPORTSKI_OBJEKT ON sportski_objekt.sportski_objekt_id = teren.sportski_objekt_id
JOIN KVART ON kvart.kvart_id = sportski_objekt.kvart_id
WHERE CURRENT_DATE < pocetak

SELECT * FROM REZERVACIJA


INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '41',
    TO_DATE('27-NOV-22 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('27-NOV-22 15:00', 'dd-MON-yy hh24:mi'),
    '4',
    '0515');




SELECT * FROM REZERVACIJA.POCETAK WHERE CURRENT_DATE < TO_DATE(pocetak,'dd-MON-yy hh24:mi');

SELECT * FROM REZERVACIJA

SELECT CURRENT_DATE, rezervacija.pocetak from rezervacija
WHERE CURRENT_DATE < rezervacija.pocetak;

