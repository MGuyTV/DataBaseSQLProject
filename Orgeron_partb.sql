--1. Find all nurses (their names) with a salary greater than $70,000.
SELECT *
FROM nurse
WHERE Salary > 70000



--2. Find all the “general practice” (for the specialty) physicians and sort the query output by names (any direction).
SELECT *
FROM Physician
WHERE Specialty = 'general practice'
ORDER BY PhysicianName DESC;



--3. Find all physicians with medicine in their specialty name (hint: remember the LIKE operator).

SELECT * 
FROM PHYSICIAN
WHERE Specialty LIKE 'Medicine%'
OR Specialty LIKE '%Medicine';



--4. Find all physicians whose specialty is not available in the database.
SELECT * 
FROM Physician
WHERE specialty IS NULL;



--5. Find the names of all nurses with a salary between $70,000 and $80,000.
SELECT *
FROM NURSE
WHERE Salary BETWEEN 70000 AND 80000



--6. Find the names of the physicians who have a specialty containing “ology”.
SELECT *
FROM Physician
WHERE Specialty LIKE '%ology';



--7. Find the minimum and maximum salaries amongst all nurses. Use only one query.
SELECT MIN(Salary) AND MAX(Salary)
FROM Nurse;



--8. Find the average salary for all nurses.
SELECT AVG(Salary)
FROM Nurse; 
