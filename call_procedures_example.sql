-- Examples on how to call the procedures
-- Author: eoin.keady@gmail.com
-- Date: 09-Dec-2017


--An example on how to run the procedure
BEGIN
    hospital.data_pack.make_appointment(78,23,'2018-01-23',20);
END;


--this procedure displays all the appointments and the 
--respective patients between two dates

--Example on how to run the procedure
SET SERVEROUTPUT ON
BEGIN
    hospital.data_pack.check_appointments('2017-12-10','2017-12-15', 1);
END;