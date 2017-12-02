insert into hospital.patient (first_name, last_name, email, phone_number)
values ('Eoin', 'Keady', 'eoin.keady@gmail.ie', '087123546');

insert into hospital.patient (first_name, last_name, email, phone_number)
values ('Mairead', 'Lambert', 'eoin.keady@gmail.ie', '087123546');

insert into hospital.drug (DRUG_NAME)
values ('nurofen');

insert into hospital.ward (WARD_NAME)
values('Ward B');

insert into hospital.nurse (FIRST_NAME, LAST_NAME, WARD_ID)
values('Tom', 'Looney', 1);

insert into hospital.room (FLOOR_NUMBER, WARD_ID)
values('2', 1);

insert into hospital.physician(FIRST_NAME, LAST_NAME, WARD_ID)
values('Julius', 'Hibbert', 1);

insert into hospital.prescription(PATIENT_ID, DRUG_ID, DOSE)
values(1, 1, 'test');

insert into hospital.stay(START_DATE, ROOM_ID, PATIENT_ID)
values(DATE '2017-11-02', 1, 1);

insert into hospital.operation(PROCEDURE_NAME, DESCRIPTION)
values('Heart transplant', 'testasdfasdfasdfasdfasdf');

insert into hospital.treatment values(1, 1);

insert into hospital.appointment (PATIENT_ID, PHYSICIAN_ID, START_DATE, ROOM_ID)
values (1, 1, DATE '2017-12-02', 1);

select p.first_name, s.room_id from hospital.patient p
    join hospital.stay s on(s.patient_id = p.patient_id);