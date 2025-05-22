
CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Department (
  Dept_Number INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Location VARCHAR(50),
  ManagerSSN CHAR(9) UNIQUE,
  NumOfEmployees INT,
  ManagerStartDate DATE
);
CREATE TABLE Employee (
  SSN CHAR(9) PRIMARY KEY,
  Fname VARCHAR(20) NOT NULL,
  Minit CHAR(1),
  Lname VARCHAR(20),
  Address VARCHAR(100),
  Bdate DATE,
  Sex CHAR(1),
  Salary DECIMAL(10,2),
  Dept_Number INT NOT NULL,
  SupervisorSSN CHAR(9),
  FOREIGN KEY (Dept_Number) REFERENCES Department(Dept_Number),
  FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN)
);
CREATE TABLE Project (
  Project_Number INT PRIMARY KEY,
  Name VARCHAR(50),
  Location VARCHAR(50),
  Dept_Number INT,
  FOREIGN KEY (Dept_Number) REFERENCES Department(Dept_Number)
);
CREATE TABLE Dependent (
  Dependent_Name VARCHAR(50),
  SSN CHAR(9),
  Sex CHAR(1),
  BirthDate DATE,
  Relationship VARCHAR(20),
  PRIMARY KEY (Dependent_Name, SSN),
  FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
CREATE TABLE Works_On (
  SSN CHAR(9),
  Project_Number INT,
  Hours DECIMAL(4,1),
  PRIMARY KEY (SSN, Project_Number),
  FOREIGN KEY (SSN) REFERENCES Employee(SSN),
  FOREIGN KEY (Project_Number) REFERENCES Project(Project_Number)
);



















 SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';
SELECT name 
FROM sys.tables;

EXEC sp_help 'Employee';
SELECT * FROM Employee;

INSERT INTO Department (Dept_Number, Name, Location, NumOfEmployees, ManagerSSN, ManagerStartDate)
VALUES (1, 'HR', 'Muscat', 5, '123456789', '2024-01-10');

INSERT INTO Employee (SSN, Fname, Minit, Lname, Address, Bdate, Sex, Salary, Dept_Number, SupervisorSSN)
VALUES ('123456789', 'Zainab', 'A', 'Alghaithi', 'Muscat, Oman', '2000-05-18', 'F', 900.00, 1, NULL);
SELECT * FROM Employee
WHERE Dept_Number = 1;
