# Fitzwilliam PL\SQL Project
SQL database project for Fitzwilliam project

## Description

For the project I decided to create a sample hospital database.

The purpose of the database is to track and store information for patients, physicians, and nurses.

The relational diagram included shows the relationship between each table.

PATIENT can STAY in the hospital 
PATIENT can have a PRESCRIPTION
PATIENT can also undergo a TREATMENT
TREATMENT is done by a PHYSICIAN
TREATMENT has an OPERATION associated with it
ROOM is located in a WARD
each NURSE works in a WARD

### Prerequisites

Ensure that all the project files are located in the same folder

### Installing

To install the database just run the setup.sql file without the DROP statements. The DROP statements are included in case the database needs to be installed again.

### Procedures and functions

The package has two procedures and two functions that do the following:

CHECK_APPOINTMENTS
This procedure accepts two date values and a physician ID and using a cursor prints out all the appointments that the physician has between those dates.

MAKE_APPOINTMENT
Creates a new appointment.

COUNT_NURSES_IN_WARD
Accepts a ward ID and returns the number of nurses in that ward.

COUNT_PATIENTS_IN_WARD
Counts the number of patients in a certain ward.

### Sequences and Triggers
The primary key of each table is made using a sequence which is called by a trigger.

### Roles and Users
There are two roles.

guest_role - This role lets the user to just view data from each table.
user_role  - This role lets the user view and edit data on each table.

### Files and descriptions

create_tablespace.sql - Creates the tablespace. 
create_user_hosiptal.sql - Creates the schema.
create_table.sql - Creates all the tables for the database.
sequences.sql - Sets up all the sequences for the ID in each table.
id_triggers.sql - These triggers maker gets the next value of the sequence when inserting into a table
roles_and_users.sql - Sets up two users and two roles
insert_patient.sql - Inserts sample data.
insert_ward_drug.sql - Inserts sample data.
insert_nurses.sql - Inserts sample data.
insert_physician.sql - Inserts sample data.
insert_operations.sql - Inserts sample data.
insert_rooms.sql - Inserts sample data.
insert_appointments.sql - Inserts sample data.
insert_prescriptions.sql - Inserts sample data.
insert_stay.sql - Inserts sample data.
insert_treatment.sql - Inserts sample data.
create_package.sql - Creates the package that contains the procedures and functions.
create_view.sql - Creates a view of all the patients currently staying in the hospital.
call_functions_example.sql - Sample function call.
call_perocedures_example.sql - Sample procedure call.

## Authors

* **Eoin Keady**
* eoin.keady@gmail.com
* 0879306420


