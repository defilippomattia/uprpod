git clone https://github.com/defilippomattia/uprpod
cd uprpod docker-compose up -d --force-recreate
login to sqldeveloper
execute: alter session set nls_date_format = 'dd/MON/yyyy hh24:mi'

### Odgovori

1. Želim dobiti popis svih rezervacija za određenog korisnika u određenom vremenskom razdoblju. 
Primjer:
Sportski objekt, Sport, Oznaka terena, Datum i vrijeme početka, Datum i vrijeme 
završetka
ŠRC Šalata, tenis, 7, 3. 11. 2022. u 11 sati, 3. 11. 2022. u 13 sati 
ŠRC Trnje, nogomet, 3, 4. 11. 2022. u 21 sat, 4. 11. 2022. u 21.30 sati

SELECT SPORTSKI_OBJEKT.IME SPORTSKI_OBJEKT_IME,  TEREN.VRSTA_TERENA, TEREN.TEREN_ID, REZERVACIJA.POCETAK,REZERVACIJA.KRAJ FROM REZERVACIJA
JOIN KORISNIK ON REZERVACIJA.OIB = KORISNIK.OIB
JOIN TEREN ON REZERVACIJA.TEREN_ID = TEREN.TEREN_ID
JOIN SPORTSKI_OBJEKT ON teren.sportski_objekt_id = sportski_objekt.sportski_objekt_id
WHERE REZERVACIJA.POCETAK BETWEEN 
    TO_DATE('2021/01/10 11:00', 'yyyy/mm/dd hh24:mi') AND
    TO_DATE('2021/05/26 16:00', 'yyyy/mm/dd hh24:mi')
AND KORISNIK.OIB IN ('0515');

3. 
Želim dobiti popis svih rezervacija za određeni kvart.
Primjer:
Sportski objekt, Sport, Oznaka terena, Datum i vrijeme početka, Datum i vrijeme
završetka
TC Maksimir, tenis, 4, 5. 11. 2022. u 10 sati, 5. 11. 2022. u 12 sati
ŠRC Svetice, nogomet, 2, 6. 11. 2022. u 20 sati, 6. 11. 2022. u 21.30 sati 

SELECT KVART.IME KVART_IME,SPORTSKI_OBJEKT.IME SPORTSKI_OBJEKT_IME, TEREN.VRSTA_TERENA, TEREN.TEREN_ID, REZERVACIJA.POCETAK, REZERVACIJA.KRAJ  FROM
REZERVACIJA
INNER JOIN TEREN
ON REZERVACIJA.TEREN_ID = TEREN.TEREN_ID
INNER JOIN SPORTSKI_OBJEKT
ON SPORTSKI_OBJEKT.SPORTSKI_OBJEKT_ID =  TEREN.SPORTSKI_OBJEKT_ID
INNER JOIN KVART
ON SPORTSKI_OBJEKT.KVART_ID = KVART.KVART_ID
WHERE KVART.IME IN ('Trnje')

4.
Želim dobiti popis svih objekata u kojima je moguće iznajmiti određeni rekvizit i u kojoj je količini 
trenutno taj rekvizit raspoloživ. 
Primjer:
Sportski objekt, Količina 
TC Maksimir, 5 
ŠRC Svetice, 8 
ŠRC Šalata, 3

Dodatni dio na aplikacijskom sloju

SELECT TIP, SPORTSKI_OBJEKT.IME, COUNT(*) UKUPNO_REKVIZITA FROM REKVIZIT
LEFT OUTER JOIN SPORTSKI_OBJEKT
ON rekvizit.sportski_objekt_id = SPORTSKI_OBJEKT.SPORTSKI_OBJEKT_ID
GROUP BY TIP, SPORTSKI_OBJEKT.IME