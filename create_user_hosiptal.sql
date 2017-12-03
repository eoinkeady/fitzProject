CREATE USER hospital IDENTIFIED BY password1
    DEFAULT TABLESPACE hospital_db
    TEMPORARY TABLESPACE hospital_temp
QUOTA 20 M ON hospital_db;