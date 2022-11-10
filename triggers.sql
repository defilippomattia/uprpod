CREATE OR REPLACE TRIGGER insertTrigger
BEFORE INSERT ON system.rezervacija
FOR EACH ROW
DECLARE
  threeDaysException EXCEPTION;
  someNum INTEGER;
BEGIN
  SELECT COUNT(*) INTO someNum
  FROM KORISNIK
  JOIN REZERVACIJA ON KORISNIK.OIB = REZERVACIJA.OIB
  WHERE SUBSTR(CURRENT_DATE,0,9) = SUBSTR(REZERVACIJA.pocetak,0,9)
  AND :new.OIB = KORISNIK.OIB;
  IF (someNum>2) THEN
    RAISE threeDaysException;
  END IF;
EXCEPTION
  WHEN threeDaysException THEN
    RAISE_APPLICATION_ERROR(-20005, 'Only 3 reservations per day per user allowed');
END;
/

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

CREATE OR REPLACE TRIGGER insertTrigger3
BEFORE INSERT ON system.rezervacija
FOR EACH ROW
DECLARE
  alreadyPlayingElsewhere EXCEPTION;
  someNum INTEGER;
BEGIN
  SELECT COUNT(*) INTO someNum
  FROM REZERVACIJA
  WHERE :new.POCETAK = rezervacija.pocetak
  AND :new.OIB = rezervacija.oib;
  IF (someNum>0) THEN
    RAISE alreadyPlayingElsewhere;
  END IF;
EXCEPTION
  WHEN alreadyPlayingElsewhere THEN
    RAISE_APPLICATION_ERROR(-20005, 'You are already plaing at another field');
END;
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

