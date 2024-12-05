/*
Author: Safrina Akter
ID:1285126
Date:09/09/2024
					             
								 SQL Project Name : Project Management System
							              Trainee Name : Safrina Akter   
						    	            Trainee ID : 1285126
							             Batch ID : CS/SCSL-M/61/01  

 ---------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------------------------

Table of Contents: DDL

			        ‣ SECTION 01: Create a 3NF database
			        ‣ SECTION 02: Created Appropriate Tables with column definition related to the project
					‣ SECTION 03: CREATE CLUSTERED AND NONCLUSTERED INDEX
					‣ SECTION 04: ALTER, DROP AND MODIFY TABLES,COLUMNS,CONSTRAINT & INDEX
			        ‣ SECTION 05: SEQUENCE(CREATE,ALTER,USE,DROP SEQUENCE)
			        ‣ SECTION 06: CREATE A VIEW, ALTER & DROP VIEW(SCHEMABINDING and Encryption)
					‣ SECTION 07: CREATING & DROPPING A Global Temporary table
			        ‣ SECTION 08: CREATE, ALTER & DROP STORED PROCEDURE
					‣ SECTION 09: CREATING SPROC with THROW Statement
					‣ SECTION 10: CREATING PROCEDURE with CRUD
					‣ SECTION 11: CTEATE, ALTER & DROP User-Defined Functions(Scalar,Table & Multi-Table Valued function)
			        ‣ SECTION 12: CREATE,ALTER & DROP FOR/AFTER and INSTEAD of TRIGGER
			        ‣ SECTION 13: CREATE LOGIN Statement(CREATE,ALTER & DROP)
					‣ SECTION 14: CREATE USER Statement(CREATE,ALTER & DROP)
					‣ SECTION 15: CREATE SCHEMA Statement(CREATE,ALTER & DROP)
                    ‣ SECTION 16: CREATE ROLE Statement(CREATE,ALTER & DROP)
*/

			        




             --=========================Section 01: Create a 3NF database===============================


  			      -------------------Question-1:(Create and Drop Database)--------------------------

USE master
GO 
IF DB_ID('ProjectDB') IS NOT NULL
DROP DATABASE ProjectDB

GO
CREATE DATABASE ProjectDB

ON(
name=ProjectDB_Data_1,
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProjectDB_Data_1.mdf',
size=25MB,
maxsize=100MB,
filegrowth=5%
)

LOG ON(
name=ProjectDB_Log_1,
filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProjectDB_Log_1.ldf',
size=2MB,
maxsize=25MB,
filegrowth=1%
)

                       
    --================Section 02: Created Appropriate Tables with column definition related to the project====================

				------------Question-2,3,4( Create table, Cluster INDEX, NonCluster INDEX)---------------------


GO
USE ProjectDB 
GO

CREATE TABLE ProjectManager(
ManagerId int primary key IDENTITY(1,1),
ManagerFName varchar(10) not null,
ManagerLName varchar(10) not null
)


     ----===================SECTION 03: CREATE CLUSTERED AND NONCLUSTERED INDEX=========================



CREATE NONCLUSTERED INDEX ix_ProjectManager_ManagerFName ON ProjectManager(ManagerFName)



CREATE TABLE Department(
DepartmentCode char(4) primary key nonclustered not null,
DepartmentName varchar(10) not null
)
                            
CREATE CLUSTERED INDEX ix_Department_DepartmentName ON Department(DepartmentName)


CREATE TABLE Employee(
EmployeeCode char(6) primary key not null,
EmployeeFName varchar(10) not null,
EmployeeLName varchar(10) not null,
DepartmentCode char(4) REFERENCES Department(DepartmentCode) not null,
) 

CREATE TABLE Project(
ProjectCode char(5) primary key not null,
ProjectTitle varchar(20) not null,
ProjectBudget money not null,
ManagerId int REFERENCES ProjectManager(ManagerId) not null
)


CREATE TABLE ProjectEmployeeRelationship(
ProjectCode char(5) REFERENCES Project(ProjectCode) not null,
EmployeeCode char(6) REFERENCES Employee(EmployeeCode) not null,
PRIMARY KEY(ProjectCode,EmployeeCode),
HourlyRate decimal(18,2) not null,
ProjectStartingDate datetime,
ProjectEndingDate datetime
)


CREATE TABLE ProjectFeedBack(
FeedBackId int not null,
FeedBack varchar(50) not null

)
GO
SELECT * FROM ProjectFeedBack				



    --====================== SECTION 04: ALTER, DROP AND MODIFY TABLES,COLUMNS,CONSTRAINT & INDEX===========================



                    ----------------Question-5: Alter a table to ADD a column.---------------------


ALTER TABLE Employee 
ADD PhoneNumber int



                          ------------------Question-6:Alter column-------------------------



ALTER TABLE Employee 
ALTER COLUMN PhoneNumber varchar(15)



                     ---------------Question-7: Write a script to delete a column.------------


ALTER TABLE Employee 
DROP COLUMN PhoneNumber


                    ----------------------Question-8: Add Constraint-----------------------



ALTER TABLE ProjectDuration 
ADD CONSTRAINT pk_PojectFeedBack PRIMARY KEY(FeedBackId)




                     -------------------Question-9: Drop constraint---------------------



ALTER TABLE ProjectFeedBack
DROP CONSTRAINT pk_PojectFeedBack



                        -------------------Question-10: Drop Index------------------------


--(NON Clustered INDEX)
DROP INDEX ix_ProjectManager_ManagerFName ON ProjectManager

--(Clustered INDEX)
DROP INDEX ix_Department_DepartmentName ON Department



                        ---------------------Question-11:Drop Table--------------------



DROP TABLE ProjectFeedBack



        --====================== SECTION 05: SEQUENCE(CREATE,ALTER,USE,DROP SEQUENCE) ====================



                   --------------Question 12: Creating SEQUENCE------------



USE ProjectDB
GO
CREATE SEQUENCE mySequence
AS INT
START WITH 100 
INCREMENT BY 5
MINVALUE 0 
MAXVALUE 10000
CYCLE CACHE 10


                -----------------------Question 13: ALTER a SEQUENCE--------------------


ALTER SEQUENCE mySequence
INCREMENT BY 5
MINVALUE 0 
MAXVALUE 2000
CYCLE CACHE 10


                -----------------------Question 14: Use a SEQUENCE--------------------


CREATE TABLE MySequenceTable(
SequenceNo int not null,
SeqDescription varchar(50) not null
)




                       ----------------Question 15: DROP SEQUENCE----------------


DROP SEQUENCE mySequence

GO

          ----================== SECTION 06: CREATE A VIEW, ALTER & DROP VIEW(SCHEMABINDING and Encryption) ==========================


                                ----------------Question 16: VIEW----------------



CREATE VIEW vu_Project
AS
SELECT * FROM ProjectEmployeeRelationship
WHERE HourlyRate>210

GO

                                ----------------Question 17: ALTER VIEW-----------------


ALTER VIEW vu_Project
AS 
SELECT * FROM ProjectEmployeeRelationship
WHERE HourlyRate>180 AND ProjectStartingDate>'2020-01-01'

GO
                              ------------Question 18: Dropping a VIEW--------------


DROP VIEW vu_Project



                 ------------Question-19: Creating a VIEW WITH SCHEMABINDING and Encryption---------------


GO
USE ProjectDB
GO
CREATE VIEW vu_ProjectInfoWithSchemaBindingandEncryption
WITH SCHEMABINDING,ENCRYPTION
AS 
SELECT p.ProjectTitle, (pm.ManagerFName+' '+pm.ManagerLName) AS ManagerName,
(e.EmployeeFName+' '+e.EmployeeLName) AS EmployeeName,
d.DepartmentName,pr.HourlyRate
FROM dbo.ProjectEmployeeRelationship pr 
JOIN dbo.Project p ON pr.ProjectCode=p.ProjectCode
JOIN dbo.ProjectManager pm ON p.ManagerId=pm.ManagerId
JOIN dbo.Employee e ON pr.EmployeeCode=e.EmployeeCode
JOIN dbo.Department d ON e.DepartmentCode = d.DepartmentCode



                  -------------------Question-20: Dropping a view-----------------
GO					


DROP VIEW vu_ProjectInfoWithSchemaBindingandEncryption

GO

   --======================SECTION 07: DROPPING A Local & Global Temporary table======================


 CREATE TABLE ##RandomTable(
SSN_ID int IDENTITY,
SSN char(9) DEFAULT 
CEILING(RAND()*10000)
);



                      --------------Question 22:DROPPING Global Temporary table-----------------


DROP TABLE ##RandomTable




              --======================SECTION 08: CREATE, ALTER & DROP STORED PROCEDURE===========================


           -----------Question 23: Dropping and Creating Procedure with RECOMPILE and ENCRYPTION------------



GO

IF OBJECT_ID('spProject') IS NOT NULL
DROP PROC spProject

GO
CREATE PROC spProject
@projectCode char(5)
AS
BEGIN
SELECT p.ProjectTitle, p.ProjectBudget, pm.ManagerFName FROM Project p
JOIN ProjectManager pm ON p.ManagerId=pm.ManagerId
WHERE ProjectBudget>1000000
AND p.ProjectCode>=@projectCode
END




                        -----------Question 24: ALTER Procedure----------------


GO
ALTER PROC spProject
@projectCode char(5)
AS
BEGIN
SELECT p.ProjectTitle, p.ProjectBudget, pm.ManagerFName FROM Project p
JOIN ProjectManager pm ON p.ManagerId=pm.ManagerId
WHERE ProjectBudget>1200000
AND p.ProjectCode>=@projectCode
END


GO
                          --------------Question 25: DROP Procedure---------------



DROP PROC spProject



              --======================SECTION 09: CREATING SPROC with THROW Statement===========================


            ------------Question 26: Creating Procedure with Conditional statement(IF EXIST) & THROW Statement--------------



GO
CREATE PROC spProject1
@projectCode char(5),@projectTitle varchar(20),@projectBudget money,@managerId int
AS
IF EXISTS 
(SELECT * FROM Project WHERE ProjectCode=@projectCode)
INSERT Project
VALUES
(@projectCode,@projectTitle,@projectBudget,@managerId)
ELSE
THROW 50001, 'NOT a valid ProjectCode!', 1;


GO
                      ---------------Question 27: DROP Procedure------------


DROP PROC spProject1





              --======================SECTION 10: CREATING PROCEDURE with CRUD===========================

GO

CREATE PROC spWithInputOutputTransactionSQLReturnType
@Statement varchar(6)='',
@DeptCode char(4),
@DeptName varchar(10),
@DeptTitle varchar(10) output
WITH RECOMPILE, ENCRYPTION
AS
BEGIN
IF @Statement='Select'
BEGIN 
SELECT * FROM Department
END


					       -----------Question 28: Inserting value in sproc------------


IF @Statement='Insert'

                       
					   
					       -----------Question 29: ERROR CHEKING,TransactionSQL------------


BEGIN 
BEGIN TRAN
BEGIN TRY
INSERT INTO Department(DepartmentCode,DepartmentName)
VALUES
(@DeptCode,@DeptName)
COMMIT TRAN
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE() AS ErrorMsg, 
ERROR_NUMBER() AS ErrorNumber,
ERROR_SEVERITY() AS ErrorSeverity,
ERROR_STATE() AS ErrorState FROM Department
ROLLBACK TRAN
END CATCH
END

					       -----------Question 30: Updating value in sproc------------


IF @Statement='Update'
BEGIN
UPDATE Department SET DepartmentName=@DeptName WHERE DepartmentCode=@DeptCode
END


					       -----------Question 31: Deleting value in sproc------------


IF @Statement='Delete'
BEGIN
DELETE FROM Department WHERE DepartmentCode=@DeptCode
END

					       -----------Question 32: Return a Output value in sproc------------


IF @Statement='Output'
BEGIN 
SELECT @DeptTitle=DepartmentName FROM Department WHERE DepartmentCode=@DeptCode
END

					       -----------Question 33: Return value in sproc------------


IF @Statement='Return'
BEGIN 
DECLARE @DeptCountReturn int;
SELECT @DeptCountReturn=COUNT(DepartmentCode) FROM Department
RETURN @DeptCountReturn
END
END


GO


                      ----------------Question-34: Dropping a stored procedure-------------------

DROP PROC spWithInputOutputTransactionSQLReturnType




 --==================SECTION 11:CTEATE, ALTER & DROP User-Defined Functions(Scalar,Table & Multi-Table Valued function) ==================




                 --------------------Question 35: Scalar-Valued function-------------------

GO
CREATE Function fn_GetSumOfHourlyRate(@projectCode char(5))
RETURNS Money
AS
BEGIN
RETURN(SELECT SUM(HourlyRate) FROM ProjectEmployeeRelationship WHERE ProjectCode=@projectCode)
END



                      -----------------Question 36: ALTER Scalar valued FUNCTION------------------


GO
ALTER Function fn_GetSumOfHourlyRate(@projectCode char(5))
RETURNS Money
AS
BEGIN
RETURN(SELECT AVG(HourlyRate) FROM ProjectEmployeeRelationship WHERE ProjectCode=@projectCode)
END

GO
                            ------------Question 37: DROP Scalar valued FUNCTION-------------


DROP FUNCTION dbo.fn_GetSumOfHourlyRate







                      --------------------Question 38: Table-Valued function-------------------


GO
CREATE Function fn_projectEmployeeInfo(@prijectCode char(5))
RETURNS table
RETURN
SELECT p.ProjectCode,p.ProjectTitle,pm.EmployeeCode,pm.HourlyRate 
FROM Project p JOIN ProjectEmployeeRelationship pm 
ON p.ProjectCode=pm.ProjectCode
WHERE HourlyRate>180



                         --------------Question 39: ALTER Table valued FUNCTION--------------

GO

ALTER Function fn_projectEmployeeInfo(@prijectCode char(5))
RETURNS table
RETURN
SELECT p.ProjectCode,p.ProjectTitle,pm.EmployeeCode,pm.HourlyRate 
FROM Project p JOIN ProjectEmployeeRelationship pm 
ON p.ProjectCode=pm.ProjectCode
WHERE HourlyRate>210

GO


                          -------------Question 40: DROP Table valued FUNCTION---------------


DROP FUNCTION dbo.fn_projectEmployeeInfo



                     ----------------Question 41: MultiTable-Valued function-----------------

GO

CREATE FUNCTION fn_MultiTableValuedFunction(@projectCode char(5), @money decimal)
RETURNS @outputTable table
            (ProjectCode char(5), EmployeeCode char(6),HourlyRate decimal(18,2), ProjectStartingDate datetime)
BEGIN
INSERT INTO @outputTable
SELECT * FROM ProjectEmployeeRelationship
WHERE HourlyRate>210
UPDATE @outputTable 
SET HourlyRate=HourlyRate+@money
RETURN;
END

GO


GO
                             ----------Question 42: Alter Multi-Table valued function------------



ALTER FUNCTION fn_MultiTableValuedFunction(@projectCode char(5), @money decimal)
RETURNS @outputTable table
            (ProjectCode char(5), EmployeeCode char(6),HourlyRate decimal(18,2), ProjectStartingDate datetime)
BEGIN
INSERT INTO @outputTable
SELECT * FROM ProjectEmployeeRelationship
WHERE HourlyRate>210
UPDATE @outputTable 
SET HourlyRate=HourlyRate+@money
RETURN;
END


GO
                              ----------------Question 43: DROP FUNCTION---------------


DROP FUNCTION dbo.fn_MultiTableValuedFunction



                 --=============SECTION 12: Creating FOR/AFTER and INSTEAD of TRIGGER===============



                           --------------Question 44: TRIGGER FOR INSERT---------------
GO

CREATE TRIGGER tr_ProjectManagerInsert
ON ProjectManager
FOR INSERT 
AS
BEGIN
SELECT * FROM inserted
END



                     -------------------Question 45: TRIGGER FOR DELETE-------------------
GO

CREATE TRIGGER tr_DeleteRaiseError
ON ProjectManager
AFTER DELETE
AS
BEGIN
RAISERROR('Delete Protected',1,1)
ROLLBACK TRANSACTION
END



            -------------------Question 46: TRIGGER for UPDATE with RAIS ERROR ------------------


GO
CREATE TRIGGER tr_ProjectUpdate
ON ProjectEmployeeRelationship
FOR UPDATE
AS
DECLARE @oldRate int, @newRate int
SELECT @oldRate=HourlyRate FROM deleted
SELECT @newRate=HourlyRate FROM inserted
IF @newRate<=@oldRate/2
BEGIN
RAISERROR('You can not reduce 50 percent or more',11,1)
ROLLBACK
END



                            ----------------Question 47: ALTER TRIGGER--------------


GO
ALTER TRIGGER tr_ProjectUpdate
ON ProjectEmployeeRelationship
FOR UPDATE
AS
DECLARE @oldRate int, @newRate int
SELECT @oldRate=HourlyRate FROM deleted
SELECT @newRate=HourlyRate FROM inserted
IF @newRate>=@oldRate*2
BEGIN
RAISERROR('We cannot afford it',11,1)
ROLLBACK
END


GO 

                        ---------------Question 48: DROP TRIGGER-----------------

DROP TRIGGER tr_ProjectUpdate




                        -------------------Question 49: INSTEAD of trigger---------------------

GO
CREATE TRIGGER tr_ProjectInsert
ON ProjectEmployeeRelationship
INSTEAD OF INSERT
AS
DECLARE @ProjectStartingDate datetime, @ProjectCode char(5),
@HourlyRate decimal(18,2), @EmployeeCode char(6),@DepartmentCode char(4),
@DepartmentName varchar(10),@ProjectEndingDate datetime,
@TestCount int

SELECT @TestCount=COUNT(*) FROM inserted
IF @TestCount=1
BEGIN
SELECT @ProjectCode=ProjectCode, @ProjectStartingDate=ProjectStartingDate,
@HourlyRate=HourlyRate FROM inserted
IF(@ProjectStartingDate IS NOT NULL AND @ProjectCode IS NOT NULL AND @HourlyRate IS NOT NULL)
BEGIN
SELECT @EmployeeCode=EmployeeCode, @DepartmentCode=DepartmentCode FROM Employee
WHERE EmployeeFName='Lewis'
SELECT @DepartmentName=DepartmentName FROM Department
WHERE DepartmentCode=@DepartmentCode
SET @ProjectEndingDate=DATEADD(YEAR, 2, @ProjectStartingDate) 
INSERT ProjectEmployeeRelationship(ProjectCode,EmployeeCode,HourlyRate,ProjectStartingDate,ProjectEndingDate)
VALUES
(@ProjectCode,@EmployeeCode,@HourlyRate,@ProjectStartingDate,@ProjectEndingDate)
END
END
ELSE
THROW 50027, 'Limit INSERT to a single row. ',1;

GO


                      ------------------Question 50:ALTER Trigger----------------------

ALTER TRIGGER tr_ProjectInsert
ON ProjectEmployeeRelationship
INSTEAD OF INSERT
AS
DECLARE @ProjectStartingDate datetime, @ProjectCode char(5),
@HourlyRate decimal(18,2), @EmployeeCode char(6),@DepartmentCode char(4),
@DepartmentName varchar(10),@ProjectEndingDate datetime,
@TestCount int

SELECT @TestCount=COUNT(*) FROM inserted
IF @TestCount=1
BEGIN
SELECT @ProjectCode=ProjectCode, @ProjectStartingDate=ProjectStartingDate,
@HourlyRate=HourlyRate FROM inserted
IF(@ProjectStartingDate IS NOT NULL AND @ProjectCode IS NOT NULL AND @HourlyRate IS NOT NULL)
BEGIN
SELECT @EmployeeCode=EmployeeCode, @DepartmentCode=DepartmentCode FROM Employee
WHERE EmployeeFName='Allen'
SELECT @DepartmentName=DepartmentName FROM Department
WHERE DepartmentCode=@DepartmentCode
SET @ProjectEndingDate=DATEADD(MONTH, 5, @ProjectStartingDate) 
INSERT ProjectEmployeeRelationship(ProjectCode,EmployeeCode,HourlyRate,ProjectStartingDate,ProjectEndingDate)
VALUES
(@ProjectCode,@EmployeeCode,@HourlyRate,@ProjectStartingDate,@ProjectEndingDate)
END
END
ELSE
THROW 50027, 'Limit INSERT to a single row. ',1;

GO


                           ---------------Question 51: DROP TRIGGER-------------

DROP TRIGGER tr_ProjectInsert



                      -------------Question 52: INSTEAD of trigger Using Two table--------------


CREATE TABLE ManagerArchive(
ManagerId int not null,
ManagerFName varchar(10) not null,
ManagerLName varchar(10) not null
)

GO
CREATE TABLE Logs(
ActivityId int not null IDENTITY(1,1) primary key,
Activity varchar(20) not null,
ActivityDate datetime
)

GO 
CREATE TRIGGER tr_ManagerInsert
ON ProjectManager
INSTEAD OF Insert
AS
BEGIN 
INSERT INTO ManagerArchive
SELECT * FROM inserted
INSERT INTO Logs
VALUES
('Manager Inserted',GETDATE())
END




          ---     ================ SECTION 13: CREATE LOGIN Statement(CREATE,ALTER & DROP) ======================



            -------------------------Question 53: CREATE LOGIN(Windows Authentication)--------------------------------

CREATE LOGIN [Accounting\Safrina] FROM WINDOWS


           -------------------------Question 54: ALTER LOGIN(Windows Authentication)--------------------------------

ALTER LOGIN [Accounting\Safrina] DISABLE;


           -------------------------Question 55: DROP LOGIN(Windows Authentication)--------------------------------

DROP LOGIN [Accounting\Safrina]



          -------------------------Question 56: CREATE LOGIN(SQL SERVER Authentication)--------------------------------

CREATE LOGIN ln_SafrinaNishi WITH PASSWORD= 'gsENJD7393#JD$F@',
DEFAULT_DATABASE = ProjectDB;




           -------------------------Question 57: ALTER LOGIN(SQL SERVER Authentication)--------------------------------

ALTER LOGIN ln_SafrinaNishi WITH PASSWORD = 'hju$et#vdh@djjf'



          -------------------------Question 58: DROP LOGIN(SQL SERVER Authentication)--------------------------------

DROP LOGIN ln_SafrinaNishi


                 --================ SECTION 14: CREATE USER Statement(CREATE,ALTER & DROP) ======================


          -------------------------Question 59: CREATE USER--------------------------------

CREATE USER Safrina FOR LOGIN [Accounting\Safrina]
WITH DEFAULT_SCHEMA = Accounting


               -------------------------Question 60: ALTER USER--------------------------------

ALTER USER Safrina WITH NAME = Nishi
ALTER USER Safrina WITH DEFAULT_SCHEMA=Marketing


                -------------------------Question 61: DROP USER--------------------------------
		   
		   
DROP USER Safrina


             --================ SECTION 15: CREATE SCHEMA Statement(CREATE,ALTER & DROP) ======================


                  -------------------------Question 62: CREATE SCHEMA--------------------------------

 GO

CREATE SCHEMA Accounting
GO

                   --------------------Question 63: CREATING Table for SCHEMA-------------------------

GO

CREATE SCHEMA Marketing
GO
CREATE TABLE Contacts(
ContactId int not null IDENTITY(1,1) primary key,
ContactName varchar(50) not null,
ContactPhone varchar(50) null,
ContactEmail varchar(50) null
)


           -------------------------Question 64: ALTER SCHEMA--------------------------------

ALTER SCHEMA Accounting TRANSFER Marketing.Contacts



           -------------------------Question 65: DROP SCHEMA--------------------------------

DROP SCHEMA Marketing


              --================ SECTION 16: CREATE ROLE Statement(CREATE,ALTER & DROP) ======================



           -------------------------Question 66: CREATE ROLE--------------------------------


CREATE ROLE ProjectEntry


           -------------------------Question 67: ALTER SCHEMA(To Assign Users)--------------------------------

ALTER ROLE ProjectEntry ADD MEMBER Safrina;
ALTER ROLE ProjectEntry ADD MEMBER Nishi;


       -------------------------Question 68: ALTER SCHEMA(To Change the Name of ROLE)--------------------------------



ALTER ROLE ProjectEntry WITH NAME= PrjctEntry


           -------------------------Question 69: DROP ROLE--------------------------------


DROP ROLE PrjctEntry