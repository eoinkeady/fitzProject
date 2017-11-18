CREATE TABLESPACE hospital_db DATAFILE
    'project.dat' SIZE 20 M
ONLINE;

CREATE TEMPORARY TABLESPACE hospital_temp TEMPFILE
    'project_tempfile.dbf' SIZE 5 M
        AUTOEXTEND ON;