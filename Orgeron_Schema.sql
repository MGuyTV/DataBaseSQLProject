CREATE TABLE Patient(
PatientNumber   NUMBER(10),
PatientName     VARCHAR(30),
PhysicianID      NUMBER(10),
CONSTRAINT PatientPK PRIMARY KEY (PatientNumber),
CONSTRAINT PatientFK Foreign Key (PhysicianID)
REFERENCES Physician(PhysicianID)
);

CREATE TABLE Order(
OrderDate  VARCHAR(9),
OrderTime    VARCHAR(6),
PatientNumber NUMBER(10),
PhysicianID NUMBER(10),
TestName
TestNumber
);

CREATE TABLE Result();//Skip this table for now, you may need to just put the result falue to order

CREATE TABLE Bed(
BedNumber
RoomNumber
Unit
PatientNumber
NurseNumber
);

CREATE TABLE Nurse(
IDNumber
NurseName
Salary
SupervisorID

);

CREATE TABLE Physician(
IDNumber
PatientName
Specialty
);

CREATE TABLE Test(
TestName
TestNumber
);

CREATE TABLE Timecard(
Date
PhysicianID
Hours
);