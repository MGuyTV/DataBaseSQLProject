DROP TABLE TimeCard;
DROP TABLE Bed;
DROP TABLE Nurse;
DROP TABLE TheOrder;
DROP TABLE Patient;
DROP TABLE TheTest;
DROP TABLE Physician;

CREATE TABLE Physician(
IDNumber NUMBER(10),
PhysicianName VARCHAR(30),
Specialty VARCHAR(30),
CONSTRAINT PhysicianPK PRIMARY KEY(IDNumber)
);

CREATE TABLE TheTest(
TestName VARCHAR(30),
TestNumber NUMBER(10),
CONSTRAINT TestPK PRIMARY KEY(TestName,TestNumber)
);

CREATE TABLE Patient(
PatientNumber   NUMBER(10),
PatientName     VARCHAR(30),
PhysicianID      NUMBER(10),
CONSTRAINT PatientPK PRIMARY KEY (PatientNumber),
CONSTRAINT PatientFK FOREIGN KEY (PhysicianID)
REFERENCES Physician(IDNumber)
);

CREATE TABLE TheOrder(
OrderDate  VARCHAR(20),
OrderTime    VARCHAR(6),
Results VARCHAR(30),
PatientNumber NUMBER(10),
PhysicianID NUMBER(10),
TestName VARCHAR(30),
TestNumber NUMBER(10),
CONSTRAINT OrderPK PRIMARY KEY(OrderDate,OrderTime,Results,PatientNumber,PhysicianID,TestName,TestNumber),
CONSTRAINT PatientNFK FOREIGN KEY(PatientNumber) REFERENCES Patient(PatientNumber),
CONSTRAINT PhysicianIDFK FOREIGN KEY(PhysicianID) REFERENCES Physician(IDNumber),
CONSTRAINT TestPrimaryKeyFK FOREIGN KEY(TestName,TestNumber) REFERENCES TheTest(TestName,TestNumber)
);


CREATE TABLE Nurse(
IDNumber NUMBER(10),
NurseName VARCHAR(30),
Salary NUMBER(9),
SupervisorID NUMBER(10),
CONSTRAINT NursePK PRIMARY KEY(IDNumber),
CONSTRAINT NurseFK FOREIGN KEY(SupervisorID) REFERENCES Nurse(IDNumber)
);

CREATE TABLE Bed(
BedNumber NUMBER(10),
RoomNumber NUMBER(10),
Unit    NUMBER(10),
PatientNumber NUMBER(10),
NurseNumber NUMBER(10),
CONSTRAINT BedPK PRIMARY KEY(BedNumber),
CONSTRAINT PNFK FOREIGN KEY(PatientNumber) REFERENCES Patient(PatientNumber),
CONSTRAINT NNFK FOREIGN KEY(NurseNumber) REFERENCES Nurse(IDNumber)
);

CREATE TABLE Timecard(
TimeDate VARCHAR(20),
PhysicianID NUMBER(10),
TimeHours NUMBER(10),
CONSTRAINT CardPK PRIMARY KEY(TimeDate, PhysicianID),
CONSTRAINT CardFK FOREIGN KEY (PhysicianID) REFERENCES Physician(IDNumber)
);
