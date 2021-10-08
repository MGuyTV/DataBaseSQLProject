CREATE TABLE Patient(
PatientNumber   NUMBER(10),
PatientName     VARCHAR(30),
PhysicianID      NUMBER(10),
CONSTRAINT PatientPK PRIMARY KEY (PatientNumber),
CONSTRAINT PatientFK Foreign Key (PhysicianID)
REFERENCES Physician(IDNumber)
);

CREATE TABLE Order(
OrderDate  VARCHAR(9),
OrderTime    VARCHAR(6),
PatientNumber NUMBER(10),
PhysicianID NUMBER(10),
TestName VARCHAR(30),
TestNumber NUMBER(10)
CONSTRAINT OrderPK PRIMARY KEY(OrderDate,OrderTime,PatientNumber,PhysicianID,TestName,TestNumber),
CONSTRAINT PNFK FOREIGN KEY(PatientNumber) REFERENCES Patient(PatientID),
CONSTRAINT PIDFK FOREIGN KEY(PhysicianID) REFERENCES Physcian(IDNumber),
CONSTRAINT TNFK FOREIGN KEY(TestName) REFERENCES Test(TestName),
CONSTRAINT TNBRFK FOREIGN KEY(TestNumber) REFERENCES Test(TestName)
);

CREATE TABLE Result();//Skip this table for now, you may need to just put the result falue to order

CREATE TABLE Bed(
BedNumber NUMBER(10),
RoomNumber NUMBER(10),
Unit    NUMBER(10),
PatientNumber NUMBER(10),
NurseNumber NUMBER(10)
CONSTRAINT BedPK PRIMARY KEY(BedNumber),
CONSTRAINT PNFK FOREIGN KEY(PatientNumber) REFERENCES Patient(PatientNumber),
CONSTRAINT NNFK FOREIGN KEY(NurseNumber) REFERENCES Nurse(IDNumber)
);

CREATE TABLE Nurse(
IDNumber NUMBER(10),
NurseName VARCHAR(30),
Salary NUMBER(9),
SupervisorID NUMBER(10)
CONSTRAINT NursePK PRIMARY KEY(IDNumber),
CONSTRAINT NurseFK FOREIGN KEY(SupervisorID) REFERENCES Nurse(IDNumber)
);

CREATE TABLE Physician(
IDNumber NUMBER(10),
PatientName VARCHAR(30),
Specialty VARCHAR(30),
CONSTRAINT PhysicianPK PRIMARY KEY(IDNumber)
);

CREATE TABLE Test(
TestName VARCHAR(30),
TestNumber NUMBER(10)
CONSTRAINT TestPK PRIMARY KEY(TestName,TestNumber)
);

CREATE TABLE Timecard(
Date VARCHAR(9),
PhysicianID NUMBER(10),
Hours NUMBER(10)
CONSTRAINT CardPK PRIMARY KEY(Date, PhysicianID),
CONSTRAINT CardFK FOREIGN KEY(PhysicianID)
);