--Mountain Valley Community Hospital
--Intermediate Retrieval Queries (91 points, 7 pts each)
--1. Retrieve the names of all patients with referred by the physician with ID 1 and are assigned a bed in the “Intensive Care Unit” unit.
--Note: I had to chane my units from numbers to strings
SELECT *
FROM Patient, Bed
WHERE Patient.PhysicianID = 1
AND Bed.PatientNumber = Patient.PatientNumber--check
AND Bed.Unit = 'Intensive Care';


--2. List all room numbers for beds that have a patient assigned to that room number whose name is the same as the nurse monitoring that bed.
SELECT *
FROM Bed, Patient, Nurse
WHERE Bed.PatientNumber = Patient.PatientNumber--check
AND PatientName = NurseName;

--3. Find the names of all nurses that are supervised by “Chris Summa”. Do not hardcode an SSN. (use darth vader instead)
SELECT NurseName
FROM Nurse
WHERE SupervisorID = (SELECT IDNumber FROM Nurse WHERE NurseName = 'Chris Summa');--check


--4. For each physician, list their name, specialty, and total hours worked.
SELECT PhysicianName, Specialty, TimeHours
FROM Physician, Timecard
WHERE Physician.IDNumber = Timecard.PhysicianID;--Check

--5. Retrieve the names of all patients who are assigned to a bed that is monitored by a nurse.
SELECT  PatientName
FROM Patient, Bed, Nurse
Where Bed.PatientNumber = Patient.PatientNumber--check
AND Bed.NurseNumber = Nurse.IDNumber;

--6. Retrieve the names of all patients who are assigned to a bed that is not monitored by a nurse.
SELECT  Distinct PatientName
FROM Patient, Bed, Nurse
Where Bed.PatientNumber = Patient.PatientNumber--Check
AND Bed.NurseNumber IS NULL;
--7. For each unit that beds can be located, retrieve the unit and the average salary of nurses assigned to beds in that unit.
SELECT Unit, AVG(Salary)
FROM Bed, Nurse
Where Bed.NurseNumber = Nurse.IDNumber--Check
GROUP BY Unit;
--8. Retrieve the average of all hours worked by physicians with “General Practice” specialty.
SELECT AVG(Timehours)
FROM Physician, TimeCard
Where Timecard.PhysicianID = Physician.IDNumber--Check
AND Physician.Specialty = 'general practice';
--9. List the names of all physicians who have not submitted a timecard. 
SELECT PhysicianName
FROM Physician, Timecard
WHERE Timecard.PhysicianID != Physician.IDNumber
ORDER BY PhysicianName;



CREAT VIEW MYVIEW1 AS SELECT Physician.IDNumber, COUNT(Physician.IDNumber)
FROM Physician ,  TimeCard
WHERE Physician.IDNumber != Timecard.PhysicianID
GROUP BY Physician.IDNumber
HAVING COUNT(Physician.IDNumber) = (SELECT COUNT(Timecard.PhysicianID) FROM Timecard);--the count of the ones it doesnt match = the count of the ones there are in the timecard row


--10. Find the average salary of nurses who monitor exactly 2 beds.
SELECT AVG(AVG(Salary))
FROM Nurse, Bed
WHERE Bed.NurseNumber = Nurse.IDNumber--check
GROUP BY Nurse.IDNumber
HAVING COUNT(Bed.NurseNumber) = 2;





















--11. For each nurse whose salary is greater than $70K, list the nurse’s name and the number of beds they monitor.
SELECT NurseName, COUNT(Bed.NurseNumber)
FROM Nurse, Bed
WHERE Bed.NurseNumber = Nurse.IDNumber;
AND Salary > 70000
GROUP BY Bed.NurseName;
--12. Retrieve the names of a nurses whose supervisor has a salary greater than $90K.
SELECT *
FROM Nurse N1, Nurse N2
WHERE N1.SupervisorID = N2.IDNumber--check
AND N2.Salary > 90000;
--13. For each specialty, find the total number of physicians and the total hours worked by those physicians.
SELECT Specialty, COUNT(Physician.PhysicianName), SUM(Timecard.TimeHours)
FROM Physician, Timecard
WHERE Physician.IDNumber = Timecard.PhysicianID
GROUP BY Specialty;
--Retrieval Queries Requiring Regular Expressions (9 points, 3 pts each)
--14. Find physicians whose specialty consists of exactly 2 words. For example, the query should return records for “General Practice”, but not “Oncology”.
SELECT *
FROM Physician
WHERE REGEXP_LIKE(Specialty, '\s');
--15. Assume patient name stores a first and last name (it is fine if you do not have these values). Find all patients whose name is properly capitalized 
--(both first and last name start from an upper-case letter, rest of the name is lower-case). For example, the query should return results for “Ben Samuel” but not “ben Samuel”. 
SELECT *
FROM Nurse
WHERE REGEXP_LIKE(NurseName, '[A-Z]{1}*\s[A-Z]{1}*');
--16. Find all beds in room numbers that end in odd numbers. 
SELECT *
FROM Bed
WHERE REGEXP_LIKE(BedNumber, '.[1, 3, 5, 7, 9]{1}');




