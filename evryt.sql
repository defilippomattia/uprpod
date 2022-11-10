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



SELECT SPORTSKI_OBJEKT.IME SPORTSKI_OBJEKT_IME,  TEREN.VRSTA_TERENA, TEREN.TEREN_ID, REZERVACIJA.POCETAK,REZERVACIJA.KRAJ FROM REZERVACIJA
JOIN KORISNIK ON REZERVACIJA.OIB = KORISNIK.OIB
JOIN TEREN ON REZERVACIJA.TEREN_ID = TEREN.TEREN_ID
JOIN SPORTSKI_OBJEKT ON teren.sportski_objekt_id = sportski_objekt.sportski_objekt_id
WHERE REZERVACIJA.POCETAK BETWEEN 
    TO_DATE('09-NOV-22 14:00', 'dd-MON-yy hh24:mi') AND
    TO_DATE('24-NOV-22 14:00', 'dd-MON-yy hh24:mi')
AND KORISNIK.OIB IN ('0541');

SELECT * FROM REZERVACIJA WHERE OIB IN ('0541')

SELECT * FROM REZERVACIJA

alter session set nls_date_format = 'dd-MON-yy hh24:mi'

SELECT * FROM TEREN

SELECT COUNT(*) FROM TEREN

select round(DBMS_RANDOM.VALUE (1, 5));

select round(dbms_random.value(1,SELECT COUNT(*) system.FROM TEREN)) num from dual;

declare
    ukupno_terena integer;
    rand_teren integer;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    rand_teren := dbms_random.value(1,ukupno_terena);
    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        '6',
        TO_DATE('27-NOV-22 11:00', 'dd-MON-yy hh24:mi'),
        TO_DATE('27-NOV-22 12:00', 'dd-MON-yy hh24:mi'),
        rand_teren,
        '0515'
    );
end; 
/

SELECT * FROM REZERVACIJA 

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '2',
    TO_DATE('23-DEC-21 14:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('23-DEC-21 15:00', 'dd-MON-yy hh24:mi'),
    '1',
    '0311');


    
declare
    ukupno_terena integer;
    rand_teren integer;
    res_id integer;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    
    SELECT COUNT(*) INTO res_id
    FROM rezervacija;
    
    rand_teren := dbms_random.value(1,ukupno_terena);

    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        res_id+1,
        TO_DATE('27-NOV-22 11:00', 'dd-MON-yy hh24:mi'),
        TO_DATE('27-NOV-22 12:00', 'dd-MON-yy hh24:mi'),
        rand_teren,
        '0515'
    );
end; 
/


declare
    ukupno_terena integer;
    rand_teren integer;
    res_id integer;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    
    SELECT COUNT(*) INTO res_id
    FROM rezervacija;
    
    rand_teren := dbms_random.value(1,ukupno_terena);

    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        res_id+1,
        TO_DATE('27-NOV-22 11:00', 'dd-MON-yy hh24:mi'),
        TO_DATE('27-NOV-22 12:00', 'dd-MON-yy hh24:mi'),
        rand_teren,
        '0311'
    );
end; 
/

CREATE OR REPLACE FUNCTION simple_function
    RETURN VARCHAR2
IS
BEGIN
    RETURN '0311';
END simple_function;
SELECT * FROM REZERVACIJA;
SELECT simple_function() FROM dual;


declare
    ukupno_terena integer;
    rand_teren integer;
    res_id integer;
    rand_start_time date;
    rand_end_time date;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    
    SELECT COUNT(*) INTO res_id
    FROM rezervacija;
    
    rand_teren := dbms_random.value(1,ukupno_terena);
    rand_start_time:= TO_DATE(get_rand_start_time(),'dd-MON-yy hh24:mi');
    rand_end_time:= TO_DATE(rand_start_time+1/24,'dd-MON-yy hh24:mi');

    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        res_id+1,
        rand_start_time,
        rand_end_time,
        rand_teren,
        '0311'
    );
end; 
/

SELECT * FROM REZERVACIJA




CREATE OR REPLACE FUNCTION get_rand_start_time
    RETURN VARCHAR2
IS
    rand_start_time integer;
    rand_end_time integer;
    date_only varchar2(30);
    full_start_date varchar2(30);
    full_end_date varchar2(30);
BEGIN
    rand_start_time := dbms_random.value(10,20);
    rand_end_time := rand_start_time + 1;
    date_only:= SUBSTR(CURRENT_DATE,0,9);
    date_only:= CONCAT(date_only,' ');
    full_start_date:= CONCAT(date_only,rand_start_time);
    full_start_date:= CONCAT(full_start_date,':00');
    RETURN full_start_date;
END get_rand_start_time;

SELECT get_rand_start_time() FROM dual;


declare
    ukupno_terena integer;
    rand_teren integer;
    res_id integer;
    rand_start_time date;
    rand_end_time date;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    
    SELECT COUNT(*) INTO res_id
    FROM rezervacija;
    
    rand_teren := dbms_random.value(1,ukupno_terena);
    rand_start_time:= TO_DATE(get_rand_start_time(),'dd-MON-yy hh24:mi');
    rand_end_time:= TO_DATE(rand_start_time+1/24,'dd-MON-yy hh24:mi');

    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        res_id+1,
        rand_start_time,
        rand_end_time,
        rand_teren,
        '0311'
    );
end; 
/



CREATE OR REPLACE FUNCTION get_rand_start_time
    RETURN VARCHAR2
IS
    rand_start_time integer;
    rand_end_time integer;
    date_only varchar2(30);
    full_start_date varchar2(30);
    full_end_date varchar2(30);
BEGIN
    rand_start_time := dbms_random.value(10,20);
    rand_end_time := rand_start_time + 1;
    date_only:= SUBSTR(CURRENT_DATE,0,9);
    date_only:= CONCAT(date_only,' ');
    full_start_date:= CONCAT(date_only,rand_start_time);
    full_start_date:= CONCAT(full_start_date,':00');
    RETURN full_start_date;
END get_rand_start_time;

SELECT get_rand_start_time() FROM dual;

SELECT * FROM REZERVACIJA


declare
    ukupno_terena integer;
    rand_teren integer;
    res_id integer;
    rand_start_time date;
    rand_end_time date;
begin
    SELECT COUNT(*) INTO ukupno_terena
    FROM teren;
    
    SELECT COUNT(*) INTO res_id
    FROM rezervacija;
    
    rand_teren := dbms_random.value(1,ukupno_terena);
    rand_start_time:= TO_DATE(get_rand_start_time(),'dd-MON-yy hh24:mi');
    rand_end_time:= TO_DATE(rand_start_time+1/24,'dd-MON-yy hh24:mi');

    INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
        res_id+1,
        rand_start_time,
        rand_end_time,
        rand_teren,
        '0311'
    );
end; 
/



CREATE OR REPLACE FUNCTION get_rand_start_time
    RETURN VARCHAR2
IS
    rand_start_time integer;
    rand_end_time integer;
    date_only varchar2(30);
    full_start_date varchar2(30);
    full_end_date varchar2(30);
BEGIN
    rand_start_time := dbms_random.value(10,20);
    rand_end_time := rand_start_time + 1;
    date_only:= SUBSTR(CURRENT_DATE,0,9);
    date_only:= CONCAT(date_only,' ');
    full_start_date:= CONCAT(date_only,rand_start_time);
    full_start_date:= CONCAT(full_start_date,':00');
    RETURN full_start_date;
END get_rand_start_time;

SELECT get_rand_start_time() FROM dual;

SELECT * FROM REZERVACIJA


CREATE OR REPLACE TRIGGER insertTrigger2
BEFORE INSERT ON system.rezervacija
FOR EACH ROW
DECLARE
  timeAlreadyReserverd EXCEPTION;
  someNum INTEGER;
BEGIN
  SELECT COUNT(*) INTO someNum
  FROM REZERVACIJA
  WHERE :new.TEREN_ID = TEREN_ID AND
        :new.POCETAK = rezervacija.pocetak;
  IF (someNum>0) THEN
    RAISE timeAlreadyReserverd;
  END IF;
EXCEPTION
  WHEN timeAlreadyReserverd THEN
    RAISE_APPLICATION_ERROR(-20005, 'Time slot is already reserved');
END;
/

SELECT * FROM REZERVACIJA WHERE POCETAK = '29-NOV-22 11:00' 

SELECT * FROM TEREN

SELECT * FROM REZERVACIJA

INSERT INTO system.REZERVACIJA(REZERVACIJA_ID,POCETAK,KRAJ,TEREN_ID,OIB) VALUES (
    '8',
    TO_DATE('29-NOV-22 12:00', 'dd-MON-yy hh24:mi'),
    TO_DATE('29-NOV-22 13:00', 'dd-MON-yy hh24:mi'),
    '4',
    '0515');
