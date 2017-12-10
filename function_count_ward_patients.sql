create or replace function hospital.count_patients_in_ward
(wardid ward.ward_id%type)
return number
IS
pat_count NUMBER(6);
Begin
select count(patient_id) INTO pat_count from
(select s.patient_id, pr.ward_id from hospital.stay s join(
select r.room_id, w.ward_id from hospital.room r 
join hospital.ward w ON (r.ward_id = w.ward_id)) pr on (s.room_id = pr.room_id))
where ward_id = wardid;

return pat_count;
END;


SET SERVEROUTPUT ON
Begin
DBMS_OUTPUT.PUT_LINE(hospital.count_patients_in_ward(7));
END;
