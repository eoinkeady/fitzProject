
--see how many patients are currently staying in a certain ward
--put ward id as a paramater into the function
SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line('The amount of patients currently in this ward is ' || hospital.data_pack.count_patients_in_ward(7) );
END;


--see how many nurses are working in a prticular. 
--put ward_id into the function as a paramater
SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line('The amount of nursesworking in this ward is ' || hospital.data_pack.count_nurses_in_ward('7') );
END;