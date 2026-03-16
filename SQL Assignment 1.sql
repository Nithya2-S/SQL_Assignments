-- DDL Commands

-- Database Creation
CREATE DATABASE Employee;
USE Employee;

-- 1. Tables Creation
CREATE TABLE Departments (
Department_ID INT,
Department_Name VARCHAR(100)
);

CREATE TABLE Location(
Location_ID INT,
Location VARCHAR(30)
);

CREATE TABLE Employees (
Employee_ID INT,
Employee_Name VARCHAR(50),
Gender ENUM('M','F'),
Age INT,
Hire_Date DATE,
Designation VARCHAR(100),
Department_ID INT,
Location_ID INT,
Salary DECIMAL(10,2)
);


-- 2. Table Alteration(ALTER)
-- Add Column
ALTER TABLE Employees ADD COLUMN Email VARCHAR(30);

-- Modify Datatype
ALTER TABLE Employees MODIFY COLUMN Designation VARCHAR(120);

-- Drop column
ALTER TABLE Employees DROP COLUMN AGE;

--	Rename Column
ALTER TABLE Employees RENAME COLUMN Hire_Date TO Date_Of_Joining;


-- 3.Table Renaming(RENAME)
RENAME TABLE Departments to Departments_Into;
RENAME TABLE Location to Locations;


-- 4.Table Truncation(TRUNCATE)
TRUNCATE TABLE employees;


-- 5.Database & Table Dropping (DROP)
DROP TABLE Employees;
DROP DATABASE Employee;


-- CONSTRAINTS

-- 1.Database Recreation
DROP DATABASE IF EXISTS Employee;

CREATE DATABASE Employee;
USE Employee;

-- Tables Recreation
CREATE TABLE Departments(
Department_ID INT PRIMARY KEY,
Department_Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Location(
Location_ID INT AUTO_INCREMENT PRIMARY KEY,
Location VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Employees (
Employee_ID INT PRIMARY KEY,
Employee_Name VARCHAR(50) NOT NULL,
Gender ENUM('M','F'),
Age INT CHECK(Age >= 18),
Hire_Date DATE DEFAULT(CURDATE()),
Designation VARCHAR(100),
Salary DECIMAL(10,2),
Department_ID INT,
Location_ID INT,
FOREIGN KEY(Department_ID) REFERENCES Departments(Department_ID),
FOREIGN KEY(Location_ID) REFERENCES Location(Location_ID)
);

