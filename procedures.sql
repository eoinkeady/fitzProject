--created by Eoin Keady
--09-12-2017
--This file contains two procedures for the fitz project


--this procedure takes 4 paramaters and creates an appointment with the date supplied
CREATE OR REPLACE PROCEDURE hospital.make_appointment (
    pat_id        IN patient.patient_id%TYPE,
    doc_id        IN physician.physician_id%TYPE,
    app_date      IN VARCHAR2,
    room_number   IN room.room_id%TYPE
) IS
    not_a_valid_date EXCEPTION;
BEGIN
    INSERT INTO appointment (
        patient_id,
        physician_id,
        start_date,
        room_id
    ) VALUES (
        pat_id,
        doc_id,
        TO_DATE(app_date,'YYYY-MM-DD'),
        room_number
    );

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Issue with creating the appointment');
END;
--An example on how to run the procedure
BEGIN
    hospital.make_appointment(78,23,'2018-01-23',20);
END;


--this procedure displays all the appointments and the 
--respective patients between two dates
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE hospital.check_appointments (
    first_date VARCHAR2,
    second_date VARCHAR2
)
    IS
BEGIN
    FOR app_cursor IN (
        SELECT
            p.first_name,
            p.last_name,
            a.appointment_id,
            a.start_date
        FROM
            hospital.patient p
            JOIN hospital.appointment a ON ( a.patient_id = p.patient_id )
        WHERE
            a.start_date BETWEEN TO_DATE(first_date,'YYYY-MM-DD') AND TO_DATE(second_date,'YYYY-MM-DD')
    ) LOOP
        dbms_output.put_line(app_cursor.first_name
        || ' '
        || app_cursor.last_name
        || ' '
        || app_cursor.start_date);
    END LOOP;
END;
--Example on how to run the procedure
BEGIN
    hospital.check_appointments('2017-12-10','2017-12-15');
END;