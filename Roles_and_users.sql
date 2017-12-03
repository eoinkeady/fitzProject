--First role as a guest. This user can only view data and not manipulate it

CREATE role guest_role;
GRANT create session to guest_role;
GRANT select on hospital.appointment to guest_role;
GRANT select on hospital.drug to guest_role;
GRANT select on hospital.nurse to guest_role;
GRANT select on hospital.operation to guest_role;
GRANT select on hospital.physician to guest_role;
GRANT select on hospital.prescription to guest_role;
GRANT select on hospital.room to guest_role;
GRANT select on hospital.stay to guest_role;
GRANT select on hospital.treatment to guest_role;
GRANT select on hospital.ward to guest_role;
GRANT select on hospital.patient to guest_role;

--Second role as a user of the database. This user can access and manipulate data.

CREATE role user_role;
grant create session to user_role;
GRANT select on hospital.appointment to user_role;
GRANT select on hospital.drug to user_role;
GRANT select on hospital.nurse to user_role;
GRANT select on hospital.operation to user_role;
GRANT select on hospital.physician to user_role;
GRANT select on hospital.prescription to user_role;
GRANT select on hospital.room to user_role;
GRANT select on hospital.stay to user_role;
GRANT select on hospital.treatment to user_role;
GRANT select on hospital.ward to user_role;
GRANT select on hospital.patient to user_role;

GRANT UPDATE on hospital.appointment to user_role;
GRANT UPDATE on hospital.drug to user_role;
GRANT UPDATE on hospital.nurse to user_role;
GRANT UPDATE on hospital.operation to user_role;
GRANT UPDATE on hospital.physician to user_role;
GRANT UPDATE on hospital.prescription to user_role;
GRANT UPDATE on hospital.room to user_role;
GRANT UPDATE on hospital.stay to user_role;
GRANT UPDATE on hospital.treatment to user_role;
GRANT UPDATE on hospital.ward to user_role;
GRANT UPDATE on hospital.patient to user_role;

GRANT INSERT on hospital.appointment to user_role;
GRANT INSERT on hospital.drug to user_role;
GRANT INSERT on hospital.nurse to user_role;
GRANT INSERT on hospital.operation to user_role;
GRANT INSERT on hospital.physician to user_role;
GRANT INSERT on hospital.prescription to user_role;
GRANT INSERT on hospital.room to user_role;
GRANT INSERT on hospital.stay to user_role;
GRANT INSERT on hospital.treatment to user_role;
GRANT INSERT on hospital.ward to user_role;
GRANT INSERT on hospital.patient to user_role;

GRANT DELETE on hospital.appointment to user_role;
GRANT DELETE on hospital.drug to user_role;
GRANT DELETE on hospital.nurse to user_role;
GRANT DELETE on hospital.operation to user_role;
GRANT DELETE on hospital.physician to user_role;
GRANT DELETE on hospital.prescription to user_role;
GRANT DELETE on hospital.room to user_role;
GRANT DELETE on hospital.stay to user_role;
GRANT DELETE on hospital.treatment to user_role;
GRANT DELETE on hospital.ward to user_role;
GRANT DELETE on hospital.patient to user_role;

--Create the users

create user guest identified by guestPassword;
grant create session to guest;
GRANT guest_role to guest;

create user fullUser identified by userPassword;
grant create session to fullUser;
GRANT user_role to fullUser;









