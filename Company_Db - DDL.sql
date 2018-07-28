/************************************
--Author: Jacob Schulz
--Function: This script will create all of the necessary tables for the Company_Db database.
--Execution: You can run this in its entirety by clicking the 'Execute' button.
--Last Modified: 2018-05-15 19:37
*************************************/

--Uses the master database
USE master
GO

--The below statement must be run in conjunction with the above IF EXISTS statement
CREATE DATABASE Company
GO

--Changing the name of the database to Company_Db
ALTER DATABASE Company MODIFY NAME = Company_Db
GO

--Selecting the Company to add the tables to (if necessary)
USE Company_Db
GO

--Creates the Department Schema
CREATE SCHEMA Dept
GO

--Checks to see if a table like Department exists in this database
IF NOT EXISTS
(
	SELECT Name 
	FROM sys.tables
	WHERE Name LIKE '%Department%'
)
--The below statement must be run in conjunction with the above IF EXISTS statement
--This statement will create the table 'Department' in the 'Dept' schema
CREATE TABLE Dept.Department
(
    Department_Id INT PRIMARY KEY,
	Department_Name VARCHAR(30)
)
GO

--Create the schema relative to HR/Employees, etc.
CREATE SCHEMA HR
GO

--Create the Job Roles table
CREATE TABLE HR.Job_Roles
(
    Job_Title_Id INT PRIMARY KEY IDENTITY (1,1),
    Job_Title VARCHAR(50),
    Job_Description VARCHAR(300),
    Department_Id INT,
	CONSTRAINT FK_Dept_Id_Job FOREIGN KEY (Department_Id)
		REFERENCES Dept.Department(Department_Id)
)
GO

--Create the Employee table
CREATE TABLE HR.Employee
(
    Employee_id INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(30),
    Email VARCHAR(25),
    Job_Title_Id INT,
    Department_Id INT,
	CONSTRAINT FK_Dept_Id_Deptartment FOREIGN KEY (Department_Id)
		REFERENCES Dept.Department(Department_Id),
	CONSTRAINT FK_Job_Title_Id_Job_Roles FOREIGN KEY (Job_Title_Id)
		REFERENCES HR.Job_Roles(Job_Title_Id)
)
GO

--Create the schema relative to Products
CREATE SCHEMA Prod
GO

--Create the Products table
CREATE TABLE Prod.Products
(
    Product_Id INT PRIMARY KEY,
	Mod_Version DECIMAL (3,2) DEFAULT 0.0,
    Module_Name VARCHAR(30),
    Mod_Descr VARCHAR(100),
    Database_Incl CHAR(3),
	Unit_Price DECIMAL (6,2) DEFAULT 0.00,
	Date_Modified DATETIME
)
GO

--Create the Support Packages table
CREATE TABLE Prod.Support_Packages
(
	Supt_Pkg_Id INT PRIMARY KEY,
	Pkg_Version DECIMAL (3,2) DEFAULT 0.0,
	Pkg_Name VARCHAR(30),
	Pkg_Descr VARCHAR(140),
	Pkg_Status BIT DEFAULT 0,
	Status_Descr CHAR(8),
	Pkg_Cost DECIMAL (6,2) DEFAULT 0.00,
	Date_Modified DATETIME
)
GO

--Create the schema for Customers
CREATE SCHEMA Cust
GO

--Create Customers table
CREATE TABLE Cust.Customers
(
	Customer_Id INT PRIMARY KEY,
	Customer_Name VARCHAR(50),
	Ftp_Address VARCHAR(40),
	Date_Modified DATETIME
)
GO

--Create the Customer Contacts table
CREATE TABLE Cust.CustomerContacts
(
	Contact_Id INT PRIMARY KEY,
	First_Name VARCHAR(50),
	Last_Name VARCHAR(50),
	Email VARCHAR(50),
	Customer_Id INT,
	Date_Modified DATETIME
	CONSTRAINT FK_Customer_Id_Customers FOREIGN KEY (Customer_Id)
		REFERENCES Cust.Customers(Customer_Id)
)
GO

--Create the schema relative to sales/transactions
CREATE SCHEMA Sales
GO

--Create the Products sold table
--The keyword IDENTITY means that it will automatically increment each row, (you don't need to add an ID. Additionally, the first number in parenthesis means we will start with the number one. The second number means that each row will increase by one.
CREATE TABLE Sales.Product_Sales
(
    Transaction_Id INT PRIMARY KEY IDENTITY (1,1), --Notes for IDENTITY are above
    Product_Id INT,
	Unit_Price DECIMAL (6,2) DEFAULT 0.00,
    Quantity INT,
	Prod_Total_Cost AS Quantity * Unit_Price, --This is a computed column
    Customer_Id INT,
	Supt_Pkg_Id INT,
	Supt_Pkg_Cost DECIMAL (6,2) DEFAULT 0.00,
    Date_Purchased DATETIME,
		CONSTRAINT FK_Product_Id_Products FOREIGN KEY (Product_Id) 
			REFERENCES Prod.Products(Product_Id),
		CONSTRAINT FK_Customer_Id_Customers FOREIGN KEY (Customer_Id) 
			REFERENCES Cust.Customers(Customer_Id),
		CONSTRAINT FK_Supt_Pkg_Id_Supt_Pkgs FOREIGN KEY (Supt_Pkg_Id)
			REFERENCES Prod.Support_Packages(Supt_Pkg_Id)
)
GO

USE master
GO

/********************
End of Table Creation
*********************/
