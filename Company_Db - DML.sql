/************************************
--Author: Jacob Schulz
--Function: This script will add all of the necessary data to the Company_Db database.
--Execution: You can run this in its entirety by clicking the 'Execute' button.
--Last Modified: 2018-05-15 19:37
*************************************/

--Uses the master database
USE master
GO

--Selecting the Company_Db to run the DML statements against
USE Company_Db
GO

--Add to the Departments table
INSERT INTO Dept.Department
(Department_Id, Department_Name)
VALUES
	(1,'Marketing'),
	(2,'Development'),
	(3,'Sales'),
	(4,'Human Resources'),
	(5,'Customer Support'),
	(6,'Project Management'),
	(7,'Information Technology'),
	(8,'Finance/Payroll'),
	(9,'Research and Development')
GO

--Add Job Roles
INSERT INTO HR.Job_Roles
(Job_Title, Job_Description, Department_Id)
VALUES
	('Web Developer', 'Develops the front and back end of the main website of the company', 1),
	('Software Engineer', 'Develops the product. This includes front and back end development of the software itself.', 2),
	('Marketing Manager', 'Delegates the sales tasks and oversees the marketing deparment. Additional duties include discovering new methods for boosting sales.', 3),
	('HR Representative', 'Ensure that policies and procedures are being followed by all employees. Manage hiring of employees.', 4),
	('Support Representative', 'Respond to incoming calls from customers. Provide product support and find resolutions.', 5),
	('Implementation Manager', 'Assist with clientel who are on-boarding with the product. Ensure all training and technical aspects are handled correctly.', 6),
	('System Admin/IT', 'Ensure all servers and databases are well secured and databases have back-ups. Manage firewalls and other securities.', 7),
	('Finance Assistant', 'Ensure that all employees receive payroll on time. Manage company finances.', 8)
GO

--Add Employees
INSERT INTO HR.Employee
	(Employee_id, First_Name, Last_Name, Email, Job_Title_Id, Department_Id)
VALUES
	(0001, 'John', 'Smith', 'jsmith@company.com', 1, 1),
	(0002, 'Debbie', 'Anderson', 'danderson@company.com', 2, 2),
	(0003, 'Craig', 'Johnson', 'cjohnson@company.com', 3, 3),
	(0004, 'Dan', 'Armijo', 'darmijo@company.com', 4, 4),
	(0005, 'Mary', 'Sanderson', 'msanderson@company.com', 5, 5),
	(0006, 'Marcus', 'Darley', 'mdarley@company.com', 6, 6),
	(0007, 'Carrie', 'Abel', 'cabel@company.com', 7, 7),
	(0008, 'Jessica', 'Armstrong', 'jarmstrong@company.com', 8, 8)
GO

--Add to the Products table
INSERT INTO Prod.Products
	(Product_Id, Mod_Version, Module_Name, Mod_Descr, Database_Incl, Unit_Price, Date_Modified)
VALUES
	(1, 1.0, 'Module A', 'Interface for using GIS maps.', 'Yes', 1000.00, GETDATE()),
	(2, 1.0, 'Module B', 'Database system that allows them to enter spatial data.', 'Yes', 1500.00, GETDATE()),
	(3, 1.0, 'Module C', 'Email application that sends emails based on spatial preferences.', 'No', 750.00, GETDATE()),
	(4, 1.0, 'Module D', 'Hosting service for all modules.', 'No', 2500.00, GETDATE())
GO

--Add data to the Support Packages table
INSERT INTO Prod.Support_Packages
(Supt_Pkg_Id, Pkg_Version, Pkg_Name, Pkg_Descr, Pkg_Status, Status_Descr, Pkg_Cost, Date_Modified)
VALUES
(1, 1.0, 'General Support Package', 'This package provides support for all modules, including bug fixes, updates and upgrades. This represents an inactive support package.', 0, 'Inactive', 0.00, GETDATE()),
(2, 1.0, 'General Support Package', 'This package provides support for all modules, including bug fixes, updates and upgrades. This represents an active support package.', 1, 'Active', 250.00, GETDATE())
GO

--Add to the Customers table
INSERT INTO Cust.Customers
	(Customer_Id, Customer_Name, Ftp_Address, Date_Modified)
VALUES 
	(1, 'GeoStudy, Inc.', 'ftp.geostudy.com', GETDATE()),
	(2, 'Weather Watchers', 'sftp.weatherinfo.com', GETDATE()),
	(3, 'GIS In Motion', 'ftp.gismotion.com', GETDATE()),
	(4, 'GIS Tracker', 'sftp.gistracking.com', GETDATE()),
	(5, 'Earth Mapping', 'sftp.emap.com', GETDATE()),
	(6, 'Weather Cast', 'ftp.weathercast.net', GETDATE()),
	(7, 'Geo Mind', 'sftp.geomind.com', GETDATE()),
	(8, 'AR Organization', 'ftp.arorg.com', GETDATE()),
	(9, 'Earth Tracing', 'sftp.earthtracing.com',  GETDATE()),
	(10, 'DD Search', 'ftp.ddsearch.com', GETDATE())
GO

--Add to the Customer Contacts table
INSERT INTO Cust.CustomerContacts
	(Contact_Id, First_Name, Last_Name, Email, Customer_Id, Date_Modified)
VALUES
	(1, 'Edward', 'Randolph', 'erandolph@geostudy.com', 1, GETDATE()),
	(2, 'Stefan', 'Ashford', 'sashford@weatherinfo.com', 2, GETDATE()),
	(3, 'Nola', 'Barizaan', 'nbarizaan@gismotion.com', 3, GETDATE()),
	(4, 'Michael', 'Sampson', 'msampson@gistracking.com', 4, GETDATE()),
	(5, 'Linet', 'Ryall', 'lryall@emap.com', 5, GETDATE()),
	(6, 'James', 'Kegan', 'jkegan@weathercast.net', 6, GETDATE()),
	(7, 'George', 'Chandler', 'gchandler@geomind.com', 7, GETDATE()),
	(8, 'Arnold', 'Roudebush', 'aroudebush@arorg.com', 8, GETDATE()),
	(9, 'Eric', 'Zirilli', 'ezirilli@earthtracing.com', 9, GETDATE()),
	(10, 'Atsuko', 'Okita', 'aokita@ddsearch.com', 10, GETDATE())

INSERT INTO Sales.Product_Sales
	(Product_Id, Unit_Price, Quantity, Customer_Id, Supt_Pkg_Id, Supt_Pkg_Cost, Date_Purchased)
VALUES
	(1, 1000.00, 1, 1, 1, 0.00, GETDATE()),
	(1, 1000.00, 1, 2, 1, 0.00, GETDATE()),
	(2, 1500.00, 2, 3, 2, 250.00, GETDATE()),
	(3, 750.00, 1, 4, 2, 250.00, GETDATE()),
	(4, 2500.00, 1, 5, 2, 250.00, GETDATE()),
	(1, 1000.00, 1, 5, 2, 250.00, GETDATE()),
	(2, 1500.00, 1, 5, 2, 250.00, GETDATE()),
	(3, 750.00, 1, 5, 2, 250.00, GETDATE()),
	(4, 2500.00, 1, 6, 2, 250.00, GETDATE()),
	(2, 1500.00, 1, 7, 1, 0.00, GETDATE()),
	(3, 750.00, 1, 7, 1, 0.00, GETDATE()),
	(2, 1500.00, 2, 8, 2, 250.00, GETDATE()),
	(3, 750.00, 3, 9, 2, 250.00, GETDATE()),
	(1, 1000.00, 2, 10, 1, 0.00, GETDATE()),
	(3, 750.00, 1, 1, 2, 250.00, GETDATE()),
	(4, 2500.00, 1, 2, 2, 250.00, GETDATE()),
	(4, 2500.00, 1, 6, 2, 250.00, GETDATE()),
	(3, 750.00, 2, 8, 1, 0.00, GETDATE()),
	(1, 1000.00, 1, 9, 1, 0.00, GETDATE()),
	(1, 1000.00, 3, 4, 2, 250.00, GETDATE())
GO

USE master
GO

/********************
End of Data Insertion
*********************/
