CREATE OR REPLACE VIEW hospital.view_patients AS
    ( SELECT
        p.patient_id,
        p.first_name,
        p.email,
        p.phone_number,
        sub.start_date AS admission,
        sub.ward_id,
        sub.room_id
      FROM
        hospital.patient p
        JOIN (
            SELECT
                s.admission_id,
                s.start_date,
                s.end_date,
                s.room_id,
                s.patient_id,
                pr.ward_id
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
        ) sub ON ( sub.patient_id = p.patient_id )
    );