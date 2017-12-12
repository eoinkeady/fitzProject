-- Declare package components.
-- Author: eoin.keady@gmail.com
-- Date: 09-Dec-2017
CREATE OR REPLACE PACKAGE hospital.data_pack AUTHID current_user IS
    PROCEDURE check_appointments (
        first_date    VARCHAR2,
        second_date   VARCHAR2,
        doc_id        physician.physician_id%TYPE
    );

    PROCEDURE make_appointment (
        pat_id        IN patient.patient_id%TYPE,
        doc_id        IN physician.physician_id%TYPE,
        app_date      IN VARCHAR2,
        room_number   IN room.room_id%TYPE
    );

    FUNCTION count_nurses_in_ward (
        wardid ward.ward_id%TYPE
    ) RETURN NUMBER;

    FUNCTION count_patients_in_ward (
        wardid ward.ward_id%TYPE
    ) RETURN NUMBER;

END;
/

CREATE OR REPLACE PACKAGE BODY hospital.data_pack IS

--this procedure takes two dates and a doctor ID and returns any appointments between those two dates

    PROCEDURE check_appointments (
        first_date    VARCHAR2,
        second_date   VARCHAR2,
        doc_id        physician.physician_id%TYPE
    )
        IS
    BEGIN
        dbms_output.put_line('These are all future appointments for Physician ID: '
        || doc_id
        || ' between '
        || first_date
        || ' and '
        || second_date);

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
    
    
--This function takes a ward ID and returns the amount of nurses working in that ward
    FUNCTION count_nurses_in_ward (
        wardid ward.ward_id%TYPE
    ) RETURN NUMBER IS
        nurse_count   NUMBER(3);
    BEGIN
        SELECT
            COUNT(nurse_id)
        INTO
            nurse_count
        FROM
            hospital.nurse
        WHERE
            ward_id = wardid;

        RETURN nurse_count;
    END;
    
    
--This function takes the ward ID and returns the number of patients curently staying in this ward

    FUNCTION count_patients_in_ward (
        wardid ward.ward_id%TYPE
    ) RETURN NUMBER IS
        pat_count   NUMBER(6);
    BEGIN
        SELECT
            COUNT(patient_id)
        INTO
            pat_count
        FROM
            (
                SELECT
                    *
                FROM
                    hospital.stay s
                    JOIN (
                        SELECT
                            r.room_id,
                            w.ward_id
                        FROM
                            hospital.room r
                            JOIN hospital.ward w ON ( r.ward_id = w.ward_id )
                    ) pr ON ( s.room_id = pr.room_id )
                    --this WHERE clause is to ensure that the patient is currently in that ward
                WHERE
                    (
                        ( s.end_date > SYSDATE )
                        OR    ( s.end_date IS NULL )
                    )
                    AND   ( s.start_date < SYSDATE )
            )
        WHERE
            ward_id = wardid;

        RETURN pat_count;
    END;

END;