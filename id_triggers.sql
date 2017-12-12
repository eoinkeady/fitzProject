-- These triggers all ensure that the primary key for each table is 
-- taken from the table's approptiate sequence
--sequences can be located in sequences.sql
-- Author: eoin.keady@gmail.com
-- Date: 09-Dec-2017

CREATE OR REPLACE TRIGGER hospital.update_appointment BEFORE
    INSERT ON hospital.appointment
    FOR EACH ROW
BEGIN
    :NEW.appointment_id := hospital.appointment_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_drug BEFORE
    INSERT ON hospital.DRUG
    FOR EACH ROW
BEGIN
    :NEW.DRUG_id := hospital.drug_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_nurse BEFORE
    INSERT ON hospital.nurse
    FOR EACH ROW
BEGIN
    :NEW.nurse_id := hospital.nurse_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_operation BEFORE
    INSERT ON hospital.operation
    FOR EACH ROW
BEGIN
    :NEW.operation_id := hospital.operation_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_patient BEFORE
    INSERT ON hospital.patient
    FOR EACH ROW
BEGIN
    :NEW.patient_id := hospital.patient_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_physician BEFORE
    INSERT ON hospital.physician
    FOR EACH ROW
BEGIN
    :NEW.physician_id := hospital.physician_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_prescription BEFORE
    INSERT ON hospital.prescription
    FOR EACH ROW
BEGIN
    :NEW.prescription_id := hospital.prescription_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_room BEFORE
    INSERT ON hospital.room
    FOR EACH ROW
BEGIN
    :NEW.room_id := hospital.room_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_stay BEFORE
    INSERT ON hospital.stay
    FOR EACH ROW
BEGIN
    :NEW.admission_id := hospital.stay_id_sequence.nextval;
END;
/
CREATE OR REPLACE TRIGGER hospital.update_ward BEFORE
    INSERT ON hospital.ward
    FOR EACH ROW
BEGIN
    :NEW.ward_id := hospital.ward_id_sequence.nextval;
END;
