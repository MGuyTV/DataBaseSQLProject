--1. Find all nurses (their names) with a salary greater than $70,000.
SELECT NurseName
FROM nurse
WHERE Salary > 70000;



--2. Find all the “general practice” (for the specialty) physicians and sort the query output by names (any direction).
SELECT PhysicianName
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
SELECT NurseName
FROM NURSE
WHERE Salary BETWEEN 70000 AND 80000;



--6. Find the names of the physicians who have a specialty containing “ology”.
SELECT PhysicianName
FROM Physician
WHERE Specialty LIKE '%ology';



--7. Find the minimum and maximum salaries amongst all nurses. Use only one query.
SELECT Salary 
FROM Nurse
WHERE Salary = (SELECT MAX(Salary) FROM Nurse)
OR Salary = (SELECT MIN(Salary) FROM NURSE);



--8. Find the average salary for all nurses.
SELECT AVG(Salary)
FROM Nurse; 

--9. Find the name of the nurse that has the highest salary. Do not hardcode any salaries or other values.
SELECT NurseName
FROM NURSE
WHERE Salary = (SELECT MAX(Salary) FROM Nurse);

--10. Find the nurses with a salary less than the average overall salary for all nurses + 20% 
--    (i.e., less than 1.2 * average salary). Do not hardcode any salaries or other values.
SELECT NurseName
FROM Nurse
WHERE Salary < (SELECT 1.2 * AVG(Salary) FROM Nurse);

