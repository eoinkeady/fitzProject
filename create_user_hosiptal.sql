-- creating the user/schema HOSPITAL
-- Author: eoin.keady@gmail.com
-- Date: 09-Dec-2017

CREATE USER hospital IDENTIFIED BY password1
    DEFAULT TABLESPACE hospital_db
QUOTA 20 M ON hospital_db;