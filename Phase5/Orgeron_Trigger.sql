--Your task is to write two triggers hat will maintain the number of beds a nurse is monitoring. 
--Add a column to the Nurse table to store this value using the following command:

ALTER TABLE Nurse ADD BedsMonitored NUMBER DEFAULT 0;

--1. Write a trigger that will fire when you INSERT a row into BED. This trigger will check the 
--value of BedsMonitored for the corresponding Nurse’s ID. If Nurse.BedsMonitored is less than 3,
--then a nurse can monitor more beds. If Nurse.BedsMonitored is equal to 3, then the nurse is too 
--busy so your trigger will cancel the INSERT and display an error message stating that the Nurse if busy. 
CREATE OR REPLACE TRIGGER TriggerOne
BEFORE UPDATE OF BedsMonitored on Nurse
FOR EACH ROW
WHEN(New.BedsMonitored > 3)
BEGIN
--:new.BedsMonitored := :old.BedsMonitored
raise_application_error(-20001, 'No nurse can monitor more than 1 bed!');
END;
/

--2. Write a trigger that will fire when a user attempts to DELETE one or more rows from BED. This trigger 
--will update the Nurse.BedsMonitored for the corresponding Nurse’s ID by decreasing the value by one each time a row is removed from BED.
CREATE OR REPLACE TRIGGER TriggerTwo
BEFORE DELETE ON Bed
FOR EACH ROW
DECLARE
MyNumber Integer;
BEGIN
MyNumber := :old.NurseNumber;
UPDATE Nurse
SET BedsMonitored = BedsMonitored -1
WHERE Nurse.IDNumber = MyNumber;
END;
/

--3. Write a trigger that will fire when the nurse ID for a bed record is changed (i.e., an UPDATE). 
--This trigger will update the Nurse.BedsMonitored for both the previous Nurse and the new Nurse using
--their respective ID’s. If the existing Nurse.BedsMonitored value for the new Nurse in the update is
--equal to 3, then the nurse is too busy so your trigger will cancel the UPDATE and display an error
--message stating that the Nurse is too busy (similar to the first trigger).
CREATE OR REPLACE TRIGGER TriggerThree
BEFORE UPDATE OF NurseNumber ON Bed
FOR EACH ROW
DECLARE
OldNurseID INTEGER;
NewNurseID INTEGER;
NewNurseBedsMonitored INTEGER;
BEGIN
OldNurseID := :old.NurseNumber;
NewNurseID := :new.NurseNumber;
SELECT BedsMonitored INTO NewNurseBedsMonitored FROM Nurse WHERE IDNumber = NewNurseID;
    IF NewNurseBedsMonitored = 3 THEN
        raise_application_error(-20002, 'This nurse is too busy!');
    ELSE
        --increment BedsMonitored for the new Nurse, and decrement BedsMonitored for the old Nurse
        UPDATE Nurse
        SET BedsMonitored = BedsMonitored + 1
        WHERE IDNumber = NewNurseID;
        
        UPDATE Nurse
        SET BedsMonitored = BedsMonitored -1
        WHERE IDNumber = OldNurseID;
    END IF;
END;
/

INSERT INTO Patient VALUES (40, 'Gandalf', 19);
INSERT INTO Patient VALUES (41, 'Dumbledore', 20);
INSERT INTO Patient VALUES (42, 'Palpatine', 21);
INSERT INTO Patient VALUES (43, 'asdf', 22);


--(BedNumber, Room, Unit, NurseID)
INSERT INTO Bed VALUES(1, 101, 'ICU', 40, 52);
UPDATE Nurse
SET BedsMonitored = 1 WHERE Nurse.IDNumber = 52;
INSERT INTO Bed VALUES(2, 201, 'ICU', 41, 52);
UPDATE Nurse
SET BedsMonitored = 2 WHERE Nurse.IDNumber = 52;
INSERT INTO Bed VALUES(3, 105, 'ICU', 42, 52);
UPDATE Nurse
SET BedsMonitored = 3 WHERE Nurse.IDNumber = 52;
INSERT INTO Bed VALUES(4, 104, 'icu', 43, 53);
update nurse
set bedsmonitored = 1 where nurse.idnumber = 53;

Update Bed
set NurseNumber = 53 Where Bed.BedNumber = 3;

SELECT * FROM Nurse;
SELECT * FROM Bed;

