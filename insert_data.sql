insert into hospital.patient ( patient_id, first_name, last_name, email, phone_number)
values (456789, 'Eoin', 'Keady', 'eoin.keady@gmail.ie', '087123546');

insert into hospital.department values (12345, 'Heart Disease');


insert into hospital.drug values (12, 'Panadol');

insert into hospital.ward values(12345, 'Ward A');

insert into hospital.nurse values(1234, 'Tom', 'Looney', 12345);

insert into hospital.room values(654321, '2', 12345);

insert into hospital.physician values(123, 'Julius', 'Hibbert', 12345);

insert into hospital.prescription values(4567891, 456789, 12, 'test');

insert into hospital.stay values(78945, DATE '2017-10-11', DATE '2017-10-06', 654321, 456789);

insert into hospital.operation values(963, 'Heart transplant', 'testasdfasdfasdfasdfasdf');

insert into hospital.treatment values(123, 963);

select p.first_name, s.room_id from hospital.patient p
    join hospital.stay s on(s.patient_id = p.patient_id);