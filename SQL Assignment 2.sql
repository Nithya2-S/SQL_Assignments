-- Clause & Operators

SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Location;

-- 1.DISTINCT VALUES
SELECT DISTINCT Salary FROM Employees;

SELECT COUNT(DISTINCT Salary) as Distinct_Salary_Count FROM Employees;

-- 2.ALIAS (AS)
SELECT Age Employee_Age,Salary Employee_Salary FROM Employees;

-- 3.WHERE CLAUSE & OPERATORS
SELECT * FROM Employees WHERE Salary > 50000 and Hire_Date < '2016-01-01';

SELECT * FROM Employees WHERE Designation IS NULL;

UPDATE Employees SET Designation ='Data Scientist' WHERE Employee_ID = 5004;
SELECT * FROM Employees WHERE Employee_ID = '5004';


-- Sorting and Grouping Data

-- 1.ORDER BY
SELECT * FROM Employees ORDER BY Department_ID, Salary DESC;

-- 2.LIMIT
SELECT * FROM Employees WHERE YEAR(Hire_Date)='2018' ORDER BY Hire_Date LIMIT 5;

-- 3.AGGREGATE FUNCTIONS
-- Finance Department Salary
SELECT SUM(E.Salary) Total_Fianance_Salary FROM Employees E
JOIN Departments D
ON E.Department_ID = D.Department_ID
WHERE D.Department_Name = 'Finance';

-- Minimum Age
SELECT MIN(Age) Minimum_Age FROM Employees;

-- 4.GROUP BY
-- Maximum Salary by Location
SELECT L.Location, MAX(E.Salary) Maximum_Salary FROM Employees E
JOIN Location L
ON E.Location_ID = L.Location_ID
GROUP BY L.Location;

-- Avereage Salary by Like Analyst Designation
SELECT Designation,AVG(Salary) Average_Salary FROM Employees
Where Designation LIKE '%analyst%'
GROUP BY Designation;

-- 5.HAVING
SELECT E.Department_ID,D.Department_Name , COUNT(*) Employee_Count 
FROM Employees E
JOIN Departments D
ON E.Department_ID = D.Department_ID
GROUP BY Department_ID
HAVING COUNT(*) < 3;

SELECT L.Location, AVG(E.Age) Average_Age
FROM Employees E
JOIN Location L
ON E.Location_ID = L.Location_ID
WHERE Gender = 'F'
GROUP BY L.Location
HAVING AVG(E.Age) < 30;
 

-- JOINS

-- 1.INNER JOIN
SELECT E.Employee_Name, E.Designation, D.Department_Name 
From Employees E
INNER join Departments D
ON E.Department_ID = D. Department_ID;

-- 2.LEFT JOIN
SELECT D.Department_Name, COUNT(E.Employee_ID) Total_Employees
FROM Departments D
LEFT JOIN Employees E
ON D.Department_ID = E.Department_ID
GROUP BY Department_Name;

-- 3.RIGHT JOIN
SELECT L.Location, E.Employee_Name 
FROM Employees E
RIGHT JOIN Location L
ON E.Location_ID = L.Location_ID;

-- 4.CROSS JOIN
SELECT D.Department_Name, L.Location
FROM Departments D
CROSS JOIN Location L;

-- 5.SELF JOIN
SELECT E1.Employee_Name Employee_1,E2.Employee_Name Employee_2, E1.Department_ID
FROM Employees E1
JOIN Employees E2
ON E1.Department_ID = E2.Department_ID
AND E1.Employee_ID < E2.Employee_ID;

-- Windows function
-- RANK_()
SELECT Employee_Name, Salary, 
RANK() OVER (ORDER BY Salary DESC) Salary_Rank
FROM Employees;

-- DENSE_RANK()
SELECT Employee_Name,Department_ID, Salary,
DENSE_RANK() OVER (PARTITION BY Department_ID ORDER BY Salary DESC) Salary_Rank_By_Dept
FROM Employees;

-- RUNNING TOTAL
SELECT Employee_Name, Department_ID, Salary,
SUM(Salary) OVER (PARTITION BY Department_ID ORDER BY Salary) Running_Total_Salary
FROM Employees;