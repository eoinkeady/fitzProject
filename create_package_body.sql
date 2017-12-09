CREATE OR REPLACE PACKAGE BODY hospital.appointments_pack IS
    -- Author: eoin.keady@gmail.com
    -- Date: 09-Dec-2017
    -- Procedures to add and check appointments

    PROCEDURE check_appointments (
        first_date    VARCHAR2,
        second_date   VARCHAR2,
        doc_id        IN physician.physician_id%TYPE
    )
        IS
    BEGIN
        dbms_output.put_line('These are all future appointments for Physician ID: '
        || doc_id);
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
                AND   a.physician_id = doc_id
        ) LOOP
            dbms_output.put_line(app_cursor.first_name
            || ' '
            || app_cursor.last_name
            || ' '
            || app_cursor.start_date);
        END LOOP;

    END;

    --this procedure takes 4 paramaters and creates an appointment with the date supplied

    PROCEDURE make_appointment (
        pat_id        IN patient.patient_id%TYPE,
        doc_id        IN physician.physician_id%TYPE,
        app_date      IN VARCHAR2,
        room_number   IN room.room_id%TYPE
    ) IS
        not_a_valid_date EXCEPTION;
    BEGIN
        INSERT INTO hospital.appointment (
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

END;