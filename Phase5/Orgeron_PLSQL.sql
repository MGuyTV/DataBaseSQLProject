--Consider the nurse table. Write an anonymous PL/SQL block that will do the following:

--1. Report the average, minimum, and maximum salaries for all nurses. 
DECLARE
    average INTEGER;
    minimum INTEGER;
    maximum INTEGER;
BEGIN
    SELECT AVG(salary) INTO average FROM Nurse;
    SELECT MIN(salary) INTO minimum FROM Nurse;
    SELECT MAX(salary) INTO maximum FROM Nurse;


    DBMS_OUTPUT.PUT_LINE(average);
    DBMS_OUTPUT.PUT_LINE(minimum);
    DBMS_OUTPUT.PUT_LINE(maximum);
END;
/

--2. Output the name and salary for each nurse. Also, convert each salary into a rating based on the average 
--salary for all nurses. The ratings are “Below Average” if the nurse makes less than the average, “Average” 
--if a nurse’s salary is equal to the average, and “Above Average” if the nurse makes more than the average salary.
DECLARE
    A_salary Nurse.salary%TYPE;
    CURSOR Salaries IS (SELECT salary FROM Nurse);
    average INTEGER;
BEGIN
    SELECT AVG(salary) INTO average FROM Nurse;
    OPEN Salaries;

    LOOP
        FETCH Salaries INTO A_salary;
        EXIT WHEN Salaries%NOTFOUND;
            IF A_salary = average THEN
                DBMS_OUTPUT.PUT_LINE('Average');
            ELSEIF A_salary < average THEN
                DBMS_OUTPUT.PUT_LINE('Below Average');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Above Average');
            END IF;
        END LOOP;
        CLOSE Salaries;
END;
/
















