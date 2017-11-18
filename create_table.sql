CREATE TABLESPACE hospital_db DATAFILE
    'project.dat' SIZE 20 M
ONLINE;

CREATE TEMPORARY TABLESPACE hospital_temp TEMPFILE
    'project_tempfile.dbf' SIZE 5 M
        AUTOEXTEND ON;

CREATE USER hospital IDENTIFIED BY password1
    DEFAULT TABLESPACE hospital_db
    TEMPORARY TABLESPACE hospital_temp
    QUOTA 20 M ON hospital_db;

DROP TABLE hospital.patient;

CREATE TABLE hospital.patient (
    "PATIENT_ID"     NUMBER(6,0)
        CONSTRAINT "PAT_PK" PRIMARY KEY,
    "FIRST_NAME"     VARCHAR2(20 BYTE),
    "LAST_NAME"      VARCHAR2(25 BYTE)
        CONSTRAINT "PAT_LAST_NAME_NN" NOT NULL ENABLE,
    "EMAIL"          VARCHAR2(25 BYTE)
        CONSTRAINT "PAT_EMAIL_NN" NOT NULL ENABLE,
    "PHONE_NUMBER"   VARCHAR2(20 BYTE)
);

CREATE TABLE hospital.stay (
    "ADMISSION_ID"   NUMBER(8,0),
    "START_DATE"     DATE DEFAULT ( SYSDATE ),
    "END_DATE"       DATE
        CONSTRAINT adm_end_date NOT NULL ENABLE,
    "ROOM_ID"        NUMBER(5,0)
        CONSTRAINT room_nn NOT NULL ENABLE,
    "PATIENT_ID"     NUMBER(6,0)
);

CREATE TABLE room (
    "ROOM_ID"        NUMBER(5,0)
        CONSTRAINT room_pk PRIMARY KEY,
    "FLOOR_NUMBER"   NUMBER(0) NOT NULL,
    "WARD_ID"        NUMBER(3) NOT NULL
        CONSTRAINT ward_fk
            REFERENCES hospital.ward ( ward_id )
);

CREATE TABLE ward (
    ward_id      NUMBER(5,0)
        CONSTRAINT ward_pk PRIMARY KEY,
    ward_name    VARCHAR(20) NOT NULL,
    head_nurse   NUMBER(4) NOT NULL
        CONSTRAINT head_nurse
            REFERENCES hospital.nurse ( nurse_id )
);

CREATE TABLE nurse (
    nurse_id     NUMBER(4,0)
        CONSTRAINT nurse_pk PRIMARY KEY,
    first_name   VARCHAR(20) NOT NULL,
    last_name    VARCHAR(25) NOT NULL,
    ward_id      NUMBER(5,0) NOT NULL
        CONSTRAINT nurse_ward
            REFERENCES hospital.ward ( ward_id )
);

CREATE TABLE nurse (
    nurse_id     NUMBER(4,0)
        CONSTRAINT nurse_pk PRIMARY KEY,
    first_name   VARCHAR(20) NOT NULL,
    last_name    VARCHAR(25) NOT NULL,
    ward_id      NUMBER(5,0) NOT NULL
        CONSTRAINT nurse_ward
            REFERENCES hospital.ward ( ward_id )
);

CREATE TABLE appointment (
    appointment_id   NUMBER(4,0)
        CONSTRAINT app_pk PRIMARY KEY,
    patient_id       NUMBER(6,0) NOT NULL
        CONSTRAINT pat_fk
            REFERENCES hospital.patient ( patient_id ),
    physician_id     NUMBER(3,0) NOT NULL
        CONSTRAINT phy_fk
            REFERENCES hospital.physicians ( physician_id ),
    start_date       DATE NOT NULL,
    end_date         DATE NOT NULL,
    room_id          NUMBER(5,0) NOT NULL
        CONSTRAINT room_fk
            REFERENCES hospital.room ( room_id )
);

CREATE TABLE physician (
    physician_id   NUMBER(3,0) NOT NULL,
    first_name     VARCHAR(20) NOT NULL,
    last_name      VARCHAR(25) NOT NULL,
    ward_id        NUMBER(5,0) NOT NULL
        CONSTRAINT dept_fk
            REFERENCES hospital.department ( department_id )
);

CREATE TABLE treatment (
    physician_id   NUMBER(3,0) NOT NULL,
    constraint     phy_fk
        REFERENCES hospital.physician ( physician_id ),
    procedure_id   NUMBER(3,0) NOT NULL,
    constraint     phy_fk
        REFERENCES hospital.procedure ( procedure_id )
);