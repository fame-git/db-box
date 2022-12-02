-- Show the first and last names of the employee with ssn 20766 
SELECT fname, lname
FROM employee
WHERE ssn = 20766;


-- List the surnames and ssn's of the employees born before 1980
SELECT lname, ssn
FROM employee
WHERE bdate < '1/1/1980';


-- What projects are the Administration department working on?
SELECT pname
FROM project, department
WHERE dnum = dnumber AND dname = 'Administration';


-- List the highest salary from each department along with the department name.
SELECT dname, MAX(salary)
FROM department, employee
WHERE dnumber = dno
GROUP BY dname;

