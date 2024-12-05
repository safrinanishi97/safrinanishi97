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

Table of Contents: DML

			 ‣SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			 ‣SECTION 02: SELECT Statement(FROM Table)
			 ‣SECTION 03: Different way of Calling method(For index,view,sequence,procedure,trigger,functions)
			 ‣SECTION 04	: Example of queries using logical operators(AND, OR, NOT)
			 ‣SECTION 05: (BETWEEN and NOT BETWEEN) Operators
			 ‣SECTION 06: LIKE, NOT LIKE,IN & NOT IN Operators & IS NULL,IS NOT NULL Clause
			 ‣SECTION 07: ORDER BY, DISTINCT, TOP Clause
			 ‣SECTION 08: OFFSET & FETCH
			 ‣SECTION 09: A SELECT Statement with fully,partially qualified & correlation name
			 ‣SECTION 10: JOIN (Self,Explicit,Implicit,Inner,Outer,Full,Cross)
			 ‣SECTION 11: UNION,INTERSECT,EXCEPT Operation
			 ‣SECTION 12: Aggregate Functions(COUNT,SUM,MIN,MAX,AVG)
			 ‣SECTION 13: GROUP BY & HAVING CLAUSE
			 ‣SECTION 14: Subquery(In SELECT statement)
			 ‣SECTION 15: Subquery(In FROM clause)
			 ‣SECTION 16: Correlated Subquery in WHERE clause(Use of IN,ANY,ALL,SOME,EXISTS & NOT EXISTS Keyword.)
			 ‣SEcTION 17: Different types Of Name ALIAS 
			 ‣SECTION 18: CTE
			 ‣SECTION 19: SELECT INTO
			 ‣SECTION 20: Example Of MARGE
			 ‣SECTION 21: Convert data using (CONVERT,CAST,TRY_CONVERT,CHAR)function
			 ‣SECTION 22: Working With Different types of FUNCTION
			 ‣SECTION 23: SIMPLE & SEARCH CASE
			 ‣SECTION 24: Use Of (IFF & CHOOSE) Function
			 ‣SECTION 25: COALESCE & ISNULL function
			 ‣SECTION 26: GROUPING SETS OPERATOR
			 ‣SECTION 27: GROUPING FUNCTION, ROLLUP, CUBE Operators and OVER Clause
			 ‣SECTION 28:Ranking Function(ROW_NUMBER,RANK,DENSE_RANK,NTILE)
			 ‣SECTION 29: ANALYTIC FUNCTIONS(FIRST_VALUE,LAST_VALUE,LAG,LEAD,PERCENT_RANK,CUME_DIST,PERCENTILE_CONT,PERCENTILE_DISC)
			 ‣SECTION 30: UPDATABLE VIEW
			 ‣SECTION 31: Different Types Of Variable(Scalar, table)
			 ‣SECTION 32: TEMPORARY TABLE(INSERT INTO Statement)
			 ‣SECTION 33: Using of @@IDENTITY, @@ROWCOUNT With Variable Declaration
			 ‣SECTION 34: Conditional Processing(IF...ELSE,WHILE)
			 ‣SECTION 35: CURSOR(Creating,opening & closing A CURSOR)
			 ‣SECTION 36: Transactions(BEGIN,COMMIT,ROLLBACK,TRY-CATCH,SAVE POINT & NESTED TRAN)
			 ‣SECTION 37: WAIT FOR Clause
			 ‣SECTION 38: Error Handling With TRY & CATCH BLOCK 
 


*/

             --==================SECTION 01: INSERT DATA USING INSERT INTO KEYWORD======================


                -----------------Question-70: Insert Records into tables using Script.-------------------


USE ProjectDB
GO
INSERT INTO ProjectManager(ManagerFName,ManagerLName)
VALUES
('Morgan','Philips'),
('Hubert','Martin'),
('Kennedy','Lewis')

INSERT INTO Department(DepartmentCode,DepartmentName)
VALUES
('L004','IT'),
('L023','HR'),
('L008','Pay Roll'),
('L009','Sales')


INSERT INTO Employee(EmployeeCode,EmployeeFName,EmployeeLName,DepartmentCode)
VALUES
('S10001','Allen','Smith','L004'),
('S10030','Lewis','Jones','L023'),
('S21010','Prince','Lewis','L004'),
('S10010','Barbara','Jones','L004'),
('S31002','Toney','Gilbert','L023'),
('S13210','Frank','Richards','L008'),
('S10034','Robert','James','L009')



INSERT INTO Project(ProjectCode,ProjectTitle,ProjectBudget,ManagerId)
VALUES
('PC010','Pensions System',1000000,1),
('PC045','Salaries System',1500000,2),
('PC064','HR System',1200000,3)

INSERT INTO ProjectEmployeeRelationship(ProjectCode,EmployeeCode,HourlyRate,ProjectStartingDate,ProjectEndingDate)
VALUES
('PC010','S10001',220,'2018-01-13','2020-05-09'),
('PC010','S10030',180,'2018-01-13','2020-05-09'),
('PC010','S21010',210,'2018-01-13','2020-05-09'),

('PC045','S10010',210,'2020-03-20','2022-01-05'),
('PC045','S10001',180,'2020-03-20','2022-01-05'),
('PC045','S31002',250,'2020-03-20','2022-01-05'),
('PC045','S13210',170,'2020-03-20','2022-01-05'),

('PC064','S31002',230,'2022-05-01',NULL),
('PC064','S21010',170,'2022-05-01',NULL),
('PC064','S10034',160,'2022-05-01',NULL)

INSERT INTO ProjectFeedBack(FeedBackId,FeedBack)
VALUES
(1,'This is a great project')




                    --==================SECTION 02: SELECT Statement(For table)======================



                         -------------------Question 71: A SELECT STATEMENT-----------------



SELECT * FROM ProjectEmployeeRelationship 
WHERE HourlyRate > 210



  --==================SECTION 03: Different way of Calling method(For index,view,sequence,procedure,trigger,functions)==================

		                     -------------------Question 72: Calling method-----------------



--For INDEX

--Justify
--EXEC sp_helpindex ProjectManager

--For Sequence

----Justify
--SELECT * FROM MySequenceTable


--For VIEW

--Justify
--SELECT * FROM vu_ProjectInfoWithSchemaBindingandEncryption
--EXEC sp_helptext vu_ProjectInfoWithSchemaBindingandEncryption
--DROP TABLE ProjectEmployeeRelationship


--For PROCEDURE

----justify
--EXEC spProject 'PC046'

----Justify
--EXEC spProject1 '','','',''


--EXEC spWithInputOutputTransactionSQLReturnType 'Select','','',''
--EXEC spWithInputOutputTransactionSQLReturnType 'Insert','L027','Accounts',''
--EXEC spWithInputOutputTransactionSQLReturnType 'Update','L027','Finance',''
--EXEC spWithInputOutputTransactionSQLReturnType 'Delete','L027','',''


--Justify
--DECLARE @DeptTitle varchar(30)

--EXEC spWithInputOutputTransactionSQLReturnType 'Output','L027','',@DeptTitle OUTPUT
--PRINT 'Name of the Department is ' +@DeptTitle

--GO
--DECLARE @DeptCountReturn int
--EXEC @DeptCountReturn=spWithInputOutputTransactionSQLReturnType 'Return','','',''
--PRINT @DeptCountReturn


--For FUNCTIONS

--Justify(scalar)
--PRINT dbo.fn_GetSumOfHourlyRate('PC010')
--SELECT * FROM ProjectEmployeeRelationship WHERE ProjectCode='PC010'


--Justify(table valued)
--SELECT * FROM dbo.fn_projectEmployeeInfo('PC010')


--Justify(Multiple_table valued)
--SELECT * FROM fn_MultiTableValuedFunction('PC010',500)


--For Trigger

--Justify
INSERT INTO ProjectManager(ManagerId,ManagerFName,ManagerLName)
VALUES(4,'Safrina','Nishi')

--Justify
UPDATE ProjectEmployeeRelationship SET HourlyRate=80 WHERE ProjectCode= 'PC010' AND EmployeeCode='S10030'


--Justify
INSERT INTO ProjectManager(ManagerFName,ManagerLName)
VALUES
('Alauddin','Arif')
SELECT * FROM ManagerArchive
SELECT * FROM Logs





           
		   --===============SECTION 03: Example of queries using logical operators(AND, OR, NOT)================    


              ----------------------Question 72: A search condition that uses the AND operator----------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE EmployeeCode = 'S10001' AND ProjectStartingDate = '2020-03-20'




                   -----------------Question 73: A search condition that uses the OR operator-----------------------



SELECT * FROM Employee
WHERE EmployeeCode = 'S21010' OR DepartmentCode = 'L023'




                     ---------------Question 74: A search condition that uses the NOT operator---------------------


SELECT * FROM ProjectEmployeeRelationship 
WHERE NOT HourlyRate <= 180



                       ---------------Question 75: Compound condition without parentheses-----------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE NOT ProjectCode='PC010'
OR EmployeeCode <>'S10001'
AND HourlyRate > 210



      --=========================SECTION 04: (BETWEEN and NOT BETWEEN) Operators===========================



                   -------------------------Question 76: BETWEEN--------------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE ProjectStartingDate BETWEEN '2018-01-13' AND '2020-03-20'



                    --------------------------Question 77: NOT BETWEEN------------------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE HourlyRate NOT BETWEEN 180 AND 210




  --=====================SECTION 05: LIKE, NOT LIKE,IN & NOT IN Operators & IS NULL,IS NOT NULL Clause=====================



                     ---------------------Question 78: WHERE clause with LIKE--------------------------


SELECT * FROM Project
WHERE ProjectTitle LIKE 'PEN%'

SELECT * FROM Employee
WHERE EmployeeFName LIKE '[AEIOU]%'

SELECT * FROM Department
WHERE DepartmentName LIKE 'H[A-R]'

SELECT * FROM Department
WHERE DepartmentName LIKE 'H[^S-T]'



                        -------------------Question 79: WHERE clause with NOT LIKE---------------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE EmployeeCode NOT LIKE 'S[2-9]%'




                         --------------------------Question 80: IN----------------------------------



SELECT * FROM ProjectEmployeeRelationship
WHERE EmployeeCode IN ('S10001','S21010')



                          ------------------------Question 81: NOT IN----------------------------------


SELECT * FROM Employee
WHERE DepartmentCode NOT IN ('L023','L008')




                          ----------------------Question 82:IS NULL------------------------



SELECT * FROM ProjectEmployeeRelationship
WHERE ProjectEndingDate IS NULL


                         ---------------------Question 82:IS NOT NULL------------------------


SELECT * FROM ProjectEmployeeRelationship
WHERE ProjectEndingDate IS NOT NULL




           --=========================SECTION 06: ORDER BY, DISTINCT, TOP Clause===========================




                         ---------------------Question 83- ORDER BY CLAUSE--------------------------



SELECT EmployeeCode,(EmployeeFName+' '+EmployeeLName) AS EmployeeName FROM Employee
ORDER BY EmployeeName ASC



                ------------------------Question 84- DISTINCT CLAUSE------------------------


SELECT DISTINCT(ProjectCode) FROM ProjectEmployeeRelationship




               ----------------------------Question 85- TOP CLAUSE------------------------


SELECT TOP 3 EmployeeCode FROM Employee
WHERE DepartmentCode NOT IN ('L004')


                ------------------------Question 86- TOP DISTINCT CLAUSE----------------------



SELECT DISTINCT TOP 5 EmployeeCode FROM ProjectEmployeeRelationship


               
			   ------------------------Question 87: TOP PERCENT WITH--------------------------



SELECT TOP 5 PERCENT WITH TIES EmployeeCode FROM ProjectEmployeeRelationship
ORDER BY ProjectCode



              ----------------------Question 88- TOP CLAUSE WITH TIES-------------------------



SELECT TOP 5 WITH TIES EmployeeCode FROM Employee
ORDER BY DepartmentCode DESC



                --=========================SECTION 07: OFFSET & FETCH===========================



                 ---------------------------Question 89: OFFSET FETCH --------------------------



SELECT * FROM ProjectEmployeeRelationship
ORDER BY ProjectCode ASC
OFFSET 1 ROWS
FETCH FIRST 5 ROWS ONLY




          --==============SECTION 08: A SELECT Statement with fully,partially qualified & correlation name==================


                --------------------Question 90- A join with fully qualified table name-------------------


SELECT ProjectTitle,
(EmployeeFName+' '+EmployeeLName) AS EmployeeName,HourlyRate
FROM DBServer.ProjectDB.dbo.ProjectEmployeeRelationship
JOIN DBServer.ProjectDB.dbo.Project ON ProjectEmployeeRelationship.ProjectCode=Project.ProjectCode
JOIN DBServer.ProjectDB.dbo.Employee ON ProjectEmployeeRelationship.EmployeeCode=Employee.EmployeeCode
ORDER BY DepartmentCode



                 ---------------Question 91:A join with partially-qualified table name----------------



SELECT ProjectTitle,(EmployeeFName+' '+EmployeeLName) AS EmployeeName,HourlyRate
FROM ProjectEmployeeRelationship
JOIN Project ON ProjectEmployeeRelationship.ProjectCode=Project.ProjectCode
JOIN Employee ON ProjectEmployeeRelationship.EmployeeCode=Employee.EmployeeCode
ORDER BY DepartmentCode


            ---------------------------Question 92:A join with a correlation name -------------------


SELECT p.ProjectTitle, (pm.ManagerFName+' '+pm.ManagerLName) AS ManagerName,
(e.EmployeeFName+' '+e.EmployeeLName) AS EmployeeName,
d.DepartmentName,pr.HourlyRate
FROM ProjectEmployeeRelationship pr 
JOIN Project p ON pr.ProjectCode=p.ProjectCode
JOIN ProjectManager pm ON p.ManagerId=pm.ManagerId
JOIN Employee e ON pr.EmployeeCode=e.EmployeeCode
JOIN Department d ON e.DepartmentCode = d.DepartmentCode
WHERE DepartmentName IN ('IT','HR')



  --=========================SECTION 09: JOIN (Self,Explicit,Implicit,Inner,Outer,Full,Cross)====================



                   -------------------Question 93: Self-JOIN query----------------------------

SELECT (p1.ProjectCode), p1.EmployeeCode,p1.HourlyRate,p1.ProjectStartingDate
FROM ProjectEmployeeRelationship AS p1 
JOIN ProjectEmployeeRelationship AS p2 
ON p1.EmployeeCode=p2.EmployeeCode AND p1.ProjectCode <> p2.ProjectCode
ORDER BY p1.ProjectCode



                ---------------------Question 94: EXPLICIT JOIN-----------------------------



SELECT ProjectTitle,(EmployeeFName+' '+EmployeeLName) AS EmployeeName,(ManagerFName+' '+ManagerLName) AS ManagerName
FROM Project,Employee,ProjectManager 
WHERE Project.ManagerId=ProjectManager.ManagerId



         ------------------------Question 95: IMPLICIT JOIN WITH WHERE CLAUSE ------------------------



SELECT e.EmployeeCode,(e.EmployeeFName+' '+e.EmployeeLName) AS EmployeeName, d.DepartmentName
FROM Employee e JOIN Department d ON e.DepartmentCode = d.DepartmentCode
WHERE DepartmentName IN ('IT','HR')




            ----------------------------Question 96- INNER JOIN ------------------------------


SELECT P.ProjectTitle,pm.ManagerId FROM Project p
INNER JOIN ProjectManager pm ON p.ManagerId=pm.ManagerId



         ------------------------------Question 97- OUTER JOIN query  ------------------------



SELECT * FROM Employee e 
LEFT OUTER JOIN Department d 
ON e.DepartmentCode=d.DepartmentCode



         ----------------------------Question 98- INNER and OUTER JOIN ------------------------


SELECT  p.ProjectTitle,(e.EmployeeFName+' '+e.EmployeeLName) AS EmployeeName, pr.HourlyRate, pr.ProjectStartingDate
FROM ProjectEmployeeRelationship pr 
JOIN Project p ON pr.ProjectCode=p.ProjectCode
RIGHT OUTER JOIN Employee e ON pr.EmployeeCode=e.EmployeeCode



              --------------------------Question 99: FULL JOIN ------------------------


SELECT p.ProjectTitle,e.EmployeeFName,p.ProjectBudget
FROM ProjectEmployeeRelationship pr
FULL JOIN Employee e ON pr.EmployeeCode=e.EmployeeCode
FULL JOIN Project p ON pr.ProjectCode=p.ProjectCode




              ------------------------Question 100: CROSS JOIN query------------------------



SELECT EmployeeCode,(EmployeeFName+' '+EmployeeLName) AS EmployeeName, DepartmentName 
FROM Employee
CROSS JOIN Department 



   --======================SECTION 10: UNION,INTERSECT,EXCEPT Operation.=============================



              ----------------------Question 101:UNION Operation------------------------


	SELECT 'Active' AS Source, ProjectCode, EmployeeCode, HourlyRate,ProjectStartingDate 
	FROM ProjectEmployeeRelationship
	WHERE ProjectStartingDate>= '2020/01/01'
UNION
	SELECT 'Paid' AS Source, ProjectCode, EmployeeCode, HourlyRate,ProjectStartingDate
	FROM ProjectEmployeeRelationship
	WHERE ProjectStartingDate<= '2020/01/01'



              ----------------------Question 102-EXCEPT Operation------------------------


	SELECT ProjectTitle, ProjectBudget FROM Project
EXCEPT
	SELECT ProjectCode,HourlyRate FROM ProjectEmployeeRelationship
	ORDER BY ProjectTitle




              --------------------Question 103: INTERSECT Operation------------------------



	SELECT ProjectCode, EmployeeCode FROM ProjectEmployeeRelationship
INTERSECT
	SELECT EmployeeCode,EmployeeFName FROM Employee



	       --======================SECTION 11: Aggregate Functions(COUNT,SUM,MIN,MAX,AVG).=============================


                     --------------------Question 104: Aggregate Functions------------------------



SELECT COUNT (*) AS TotalCount,
COUNT(DISTINCT ProjectCode) AS ProjectCount,
SUM(ProjectBudget) AS TotalBudget,
MIN(ProjectBudget) AS MinBudget,
MAX(ProjectBudget) AS MaxBudget,
AVG(ProjectBudget) AS AvgBudget
FROM Project 



           --======================SECTION 12: GROUP BY & HAVING CLAUSE.=============================


                   ----------------------Question 105: GROUP BY caluse---------------------------



SELECT P.ProjectTitle,pm.ManagerId, COUNT(*) AS TotalQty 
FROM Project p
JOIN ProjectManager pm ON p.ManagerId=pm.ManagerId
GROUP BY P.ProjectTitle, pm.ManagerId



                      ---------------------Question 106: HAVING clause----------------------------



SELECT ProjectCode, HourlyRate,
SUM (HourlyRate) AS TotalRate, 
AVG(HourlyRate) AS AvgRate
FROM ProjectEmployeeRelationship
GROUP BY ProjectCode,HourlyRate
HAVING SUM (HourlyRate)>210



                 ---------------------Question 107: COMPOUND condition in HAVING clause--------------------



SELECT ProjectCode, HourlyRate,
COUNT (*)  AS TotalCount,
SUM (HourlyRate) AS TotalRate, 
AVG(HourlyRate) AS AvgRate
FROM ProjectEmployeeRelationship
GROUP BY ProjectCode,HourlyRate
HAVING COUNT (*)>=1 
AND SUM (HourlyRate)>210
ORDER BY ProjectCode DESC


               --======================SECTION 13: Subquery(In SELECT statement) ====================================



          -----------------------------Question 108: Subquery in SELECT statement---------------------------------



 SELECT ProjectCode, ProjectStartingDate,
  (SELECT ProjectTitle FROM Project WHERE ProjectCode = ProjectEmployeeRelationship.ProjectCode) AS 'Projct Name',
  (SELECT EmployeeFName FROM Employee WHERE EmployeeCode = ProjectEmployeeRelationship.EmployeeCode) AS 'Employee Name'
FROM ProjectEmployeeRelationship
WHERE EmployeeCode= 'S10010'




               --======================SECTION 14: Subquery(In FROM clause)===========================================


          -----------------------------Question 109: Subquery in FROM clause---------------------------------

SELECT pm.ProjectCode, MAX(pm.ProjectStartingDate) AS FirstProject FROM ProjectEmployeeRelationship pm JOIN
(SELECT TOP 5 EmployeeCode,ProjectCode, AVG(HourlyRate) AS AvgTotal, ProjectStartingDate FROM ProjectEmployeeRelationship
GROUP BY EmployeeCode, ProjectStartingDate,ProjectCode
ORDER BY AVG(HourlyRate) DESC) AS MaxRatedEmployee ON pm.ProjectCode=MaxRatedEmployee.ProjectCode
GROUP BY pm.ProjectCode
ORDER BY FirstProject






    --===========SECTION 15: Correlated Subquery in WHERE clause(Use of IN,ANY,ALL,SOME,EXISTS & NOT EXISTS Keyword.)============


	                   -------------------Question 110: Correlated Subquery--------------------------


SELECT ProjectCode, HourlyRate, ProjectStartingDate FROM ProjectEmployeeRelationship AS MainProject
WHERE HourlyRate>=
(SELECT AVG(HourlyRate) AS AvgTotal FROM ProjectEmployeeRelationship AS SubProject WHERE MainProject.ProjectCode=SubProject.ProjectCode)
ORDER BY ProjectCode DESC




            -------------------------Question 111: Use of IN keyword in subquery----------------------------


SELECT * FROM ProjectEmployeeRelationship WHERE ProjectCode IN
(SELECT DISTINCT ProjectCode FROM Project WHERE ProjectBudget>1200000)


           --------------------Question 112: Use of ANY keyword in subquery------------------------------


 SELECT ProjectCode, HourlyRate, ProjectStartingDate FROM ProjectEmployeeRelationship
 WHERE HourlyRate>ANY
 (SELECT HourlyRate FROM ProjectEmployeeRelationship WHERE ProjectCode='PC010')


           ---------------------Question 113: Use of ALL keyword in subquery----------------------------


 SELECT ProjectCode, HourlyRate, ProjectStartingDate FROM ProjectEmployeeRelationship
 WHERE HourlyRate>ALL
 (SELECT HourlyRate FROM ProjectEmployeeRelationship WHERE ProjectCode='PC010')



       ----------------------Question 114: Use of SOME keyword in subquery-----------------------


  SELECT ProjectCode, HourlyRate, ProjectStartingDate FROM ProjectEmployeeRelationship
 WHERE HourlyRate>SOME
 (SELECT HourlyRate FROM ProjectEmployeeRelationship WHERE ProjectCode='PC010')



           ---------------Question 115: Use of EXISTS and NOT EXISTS keyword in subquery----------------


 SELECT * FROM ProjectEmployeeRelationship p
 WHERE EXISTS
(SELECT * FROM Employee e WHERE e.EmployeeCode=p.EmployeeCode )

 SELECT * FROM ProjectEmployeeRelationship p
 WHERE NOT EXISTS
(SELECT * FROM Employee e WHERE e.EmployeeCode=p.EmployeeCode )



        --==============================SETION 16: Different types Of Name ALIAS =======================================



                ------------------------Question 116:Different types Of name aliases----------------------

SELECT ProjectCode AS [Project Code], 
EmployeeCode AS "Employee Code",
HourlyRate AS H_Rate,
[Project Starting Date]=ProjectStartingDate,
ProjectStartingDate AS 'Start of Project'
FROM ProjectEmployeeRelationship

GO

         --===================================SECTION 17: CTE================================================



                -------------------Question 117: Common Table Expression(CTE)-----------------------------




WITH Table1 AS

(SELECT pr.ProjectCode,e.EmployeeFName, SUM(HourlyRate) AS TotalRate FROM ProjectEmployeeRelationship pr 
JOIN Employee e ON pr.EmployeeCode=e.EmployeeCode
GROUP BY pr.ProjectCode,e.EmployeeFName),

Table2 AS

(SELECT Table1.EmployeeFName, MAX(Table1.TotalRate) AS MaxRate FROM Table1 
GROUP BY Table1.EmployeeFName)
(SELECT Table1.EmployeeFName,Table1.TotalRate, Table2.MaxRate FROM Table2 JOIN Table1 ON Table2.EmployeeFName=Table1.EmployeeFName)




     --=======================================SECTION 18: SELECT INTO ================================================



               ----------------------------Question118: SELECT INTO statement-----------------------



SELECT * INTO ProjectCopy 
FROM ProjectEmployeeRelationship
WHERE ProjectStartingDate>'2020-03-20'
ORDER BY ProjectCode DESC

SELECT * INTO ProjectArchive
FROM ProjectEmployeeRelationship
WHERE ProjectStartingDate<='2020-03-20'
ORDER BY ProjectCode ASC




            --=============================SECTION 19: Example Of MARGE==============================================



                  --------------------------Question 119: Marge table-----------------------------



MERGE ProjectArchive AS Target
USING ProjectCopy AS Source
ON (Target.ProjectCode=Source.ProjectCode)

WHEN MATCHED
AND Target.EmployeeCode<>Source.EmployeeCode 
OR Target.HourlyRate<>Source.HourlyRate 

THEN UPDATE SET 
Target.EmployeeCode=Source.EmployeeCode,
Target.HourlyRate=Source.HourlyRate

WHEN NOT MATCHED BY Target 
THEN INSERT (ProjectCode,EmployeeCode,HourlyRate)
VALUES(Source.ProjectCode,Source.EmployeeCode,Source.HourlyRate)

WHEN NOT MATCHED BY SOURCE
THEN DELETE;




  --===========================SECTION 20: Convert data using (CONVERT,CAST,TRY_CONVERT,CHAR)function=============================




                -----------------------Question 120: Use of CAST function----------------


SELECT ProjectCode,ProjectStartingDate, HourlyRate,
CAST(ProjectStartingDate AS varchar) AS VarcharDate,
CAST(HourlyRate AS int) AS IntegerTotal,
CAST(HourlyRate AS varchar) AS VarcharTotal
FROM ProjectEmployeeRelationship



                  ----------------------Question 121: Use of CONVERT function---------------------



SELECT CONVERT(varchar, ProjectStartingDate) AS VarcharDate,
CONVERT(varchar, ProjectStartingDate,1) AS VarcharDate_1,
CONVERT(varchar,ProjectStartingDate,107) AS VarcharDate_107,
CONVERT(varchar,HourlyRate) AS VarcharTotal,
CONVERT(varchar,HourlyRate,1) AS VarcharTotal_1,
CONVERT(varchar,HourlyRate,107) AS VarcharTotal_107
FROM ProjectEmployeeRelationship



                    ----------------Question 122- Use of TRY_CONVERT Function-----------------


SELECT 
TRY_CONVERT(varchar,ProjectStartingDate) AS ProjectDate,
TRY_CONVERT(varchar,ProjectStartingDate,107) AS ProjectDate_107,
TRY_CONVERT(varchar,ProjectStartingDate,1) AS ProjectDate_1,
TRY_CONVERT(varchar,ProjectStartingDate,10) AS ProjectDate_10,
TRY_CONVERT(varchar,ProjectStartingDate,7) AS ProjectDate_7,
TRY_CONVERT(varchar,ProjectStartingDate,12) AS ProjectDate_12
FROM ProjectEmployeeRelationship



                         --------------Question 123: Use of CHAR FUNCTION--------------------



SELECT ProjectCode + CHAR(13) + CHAR(10) 
+ ProjectTitle +  CHAR(13) + CHAR(10) AS Project_P
FROM Project




  --===========================SECTION 21: Working With Different types of FUNCTION==================================



            --------------------------Question 124: Use Of String FUNCTION-----------------------



SELECT ManagerFName,ManagerLName,
LEFT(ManagerFName,1)+LEFT(ManagerLName,1) AS ShortName FROM ProjectManager

SELECT ProjectTitle,
LEFT(ProjectTitle,CHARINDEX(' ',ProjectTitle)-1) AS FirstName,
RIGHT(ProjectTitle, LEN(ProjectTitle)-CHARINDEX(' ',ProjectTitle)) AS LastName
FROM Project

SELECT EmployeeCode, EmployeeFName+', '+LEFT(EmployeeLname,1) AS EmployeeName, LTRIM('  DepartmentCode') AS LeftTrim,
SUBSTRING(EmployeeCode,4,2) AS CodeNumber
FROM  Employee

SELECT ProjectCode,ProjectTitle,LTRIM(RTRIM(ProjectTitle,' '),' ') AS Trim  FROM Project

SELECT LOWER(DepartmentName) AS DeptName FROM Department

SELECT UPPER(EmployeeFName+' '+EmployeeLName) AS EmployeeName FROM Employee

SELECT *, REPLACE(RIGHT(ProjectCode,5), 'C','N') AS NewProjectCode FROM ProjectEmployeeRelationship

SELECT *, TRANSLATE(DepartmentCode, 'L 0','M 1') AS NewDeptCode FROM Employee

SELECT *, PATINDEX('%es%',EmployeeLName)  FROM Employee

SELECT CONCAT(ManagerId,': ', ManagerFName,' ',ManagerLName) FROM ProjectManager

SELECT CONCAT_WS(',',EmployeeCode,EmployeeFName,EmployeeLName,DepartmentCode) FROM Employee





          --------------------------Question 125: Working with NUMERIC FUNCTION--------------------------



SELECT *,ROUND(SQRT(HourlyRate),1) AS Rate FROM ProjectEmployeeRelationship

SELECT ProjectCode,HourlyRate,ROUND(SQRT(HourlyRate),-1) AS Rate FROM ProjectEmployeeRelationship

SELECT *,ROUND(SQRT(HourlyRate),0) AS Rate FROM ProjectEmployeeRelationship


SELECT EmployeeCode, HourlyRate,ISNUMERIC(EmployeeCode) AS Code FROM ProjectEmployeeRelationship

SELECT *,ISNUMERIC(HourlyRate) AS Code FROM ProjectEmployeeRelationship


SELECT ProjectCode,HourlyRate,CEILING(HourlyRate) AS Code FROM ProjectEmployeeRelationship

SELECT *,FLOOR(HourlyRate) AS Code FROM ProjectEmployeeRelationship

SELECT ProjectCode,HourlyRate,SQUARE(HourlyRate) AS Rate FROM ProjectEmployeeRelationship

SELECT EmployeeCode, HourlyRate,SQRT(HourlyRate) AS Rate FROM ProjectEmployeeRelationship

SELECT *,ABS(HourlyRate) AS Rate FROM ProjectEmployeeRelationship


SELECT *,RAND() AS RandomValue FROM ProjectEmployeeRelationship




        --------------------------Question 126:Use of CONVERTION FUNCTION------------------------



SELECT EmployeeCode,
CAST(SQRT(HourlyRate) AS money),
LEN(CAST(SQRT(HourlyRate) AS money)),
SPACE(8-LEN(CAST(SQRT(HourlyRate) AS money)))+CAST(SQRT(HourlyRate) AS money)
FROM ProjectEmployeeRelationship




            ---------------------Question 127: Working with DATE/TIME FUNCTION-------------------


 SELECT *,
 DAY(ProjectStartingDate) AS 'Days',
 MONTH(ProjectStartingDate) AS 'Month',
 YEAR(ProjectStartingDate) AS 'Year'
 FROM ProjectEmployeeRelationship


 SELECT * FROM ProjectEmployeeRelationship
 WHERE DATENAME(MONTH,ProjectStartingDate)='JANUARY'

  SELECT *,DATEPART(DAY,ProjectStartingDate) AS 'Day'
 FROM ProjectEmployeeRelationship

   SELECT *,DATENAME(WEEK,ProjectStartingDate) AS 'Weeks'
 FROM ProjectEmployeeRelationship

 SELECT *,ISDATE(ProjectStartingDate) AS 'Date'
 FROM ProjectEmployeeRelationship

 SELECT *,EOMONTH(ProjectStartingDate) AS 'Month'
 FROM ProjectEmployeeRelationship

  SELECT *,EOMONTH(ProjectStartingDate,2) AS 'Month'
 FROM ProjectEmployeeRelationship

  SELECT *,DATEFROMPARTS(2018,05,08) AS 'Date'
 FROM ProjectEmployeeRelationship

 SELECT *,DATEADD(MONTH, 2, ProjectStartingDate) AS 'Date'
 FROM ProjectEmployeeRelationship

  SELECT *,DATEADD(QUARTER, 3, ProjectStartingDate) AS 'Date'
 FROM ProjectEmployeeRelationship

SELECT ProjectCode,ProjectStartingDate, GETDATE() AS 'Today''s Date' , DATEDIFF(YEAR, ProjectStartingDate, GETDATE()) AS AgeByYear 
FROM ProjectEmployeeRelationship

SELECT ProjectCode,ProjectStartingDate, GETDATE() AS 'Today''s Date' , DATEDIFF(MONTH, ProjectStartingDate, GETDATE()) AS AgeByMonth 
FROM ProjectEmployeeRelationship

SELECT ProjectCode,ProjectStartingDate, GETDATE() AS 'Today''s Date' , DATEDIFF(DAY, ProjectStartingDate, GETDATE()) AS AgeByDay
FROM ProjectEmployeeRelationship




          --==========================SECTION 22: SIMPLE & SEARCH CASE=======================================



                  -----------------------Question 128:Simple CASE---------------------



 SELECT ManagerId,ManagerFName, ManagerLName, 
 CASE ManagerId 
 WHEN 1 THEN '1st Project Manager'
 WHEN 2 THEN '2nd Project Manager'
 WHEN 3 THEN '3rd Project Manager'
 END AS Description
 FROM ProjectManager



              --------------------------Question 129: Search CASE-----------------------------



 SELECT ProjectCode,ProjectStartingDate,GETDATE() AS CurrentDate, 
CASE 
WHEN DATEDIFF(YEAR,ProjectStartingDate,GETDATE())>4
THEN 'Over 4 years'
WHEN DATEDIFF(YEAR,ProjectStartingDate,GETDATE())>3
THEN 'Over 3 years'
WHEN DATEDIFF(YEAR,ProjectStartingDate,GETDATE())>1
THEN 'Over 1 years'
END AS OverDate
FROM ProjectEmployeeRelationship



                  --===================SECTION 23: Use Of (IFF & CHOOSE) Function==================



                            -----------------Question 130: IFF----------------------


SELECT EmployeeCode,SUM(HourlyRate) AS TotalAmount,
IIF(SUM(HourlyRate)>200, 'High', 'Average') AS EmployeeStatus
FROM ProjectEmployeeRelationship
GROUP BY EmployeeCode


                         -----------------Question 131: CHOOSE----------------------


SELECT ProjectCode, EmployeeCode,ProjectStartingDate,DATEDIFF(YEAR,ProjectStartingDate,GETDATE()) AS ProjectDate,
CHOOSE (DATEDIFF(YEAR,ProjectStartingDate,GETDATE()), '1 Years','2 Years', '3 Years','4 Years','5 Years','6 Years') AS ProjectYear
FROM ProjectEmployeeRelationship



   --========================= SECTION 24: COALESCE & ISSNULL function===============================




                   ---------------------Question 132: COALESCE----------------------



SELECT ProjectCode,ProjectEndingDate,
ISNULL(ProjectEndingDate,'1900-01-01') AS NewDate 
FROM ProjectEmployeeRelationship


                   --------------------Question 133: ISNULL---------------------


SELECT ProjectCode,ProjectEndingDate,
ISNULL(ProjectEndingDate,'1900-01-01') AS NewDate 
FROM ProjectEmployeeRelationship



          --=========================SECTION 25: GROUPING SETS OPERATOR ==========================



                     -----------------Question 134- Grouping SETS---------------


SELECT EmployeeCode,EmployeeFName, COUNT(*) AS EmployeeCount  FROM Employee
WHERE EmployeeFName NOT IN ('Frank', 'Prince')
GROUP BY GROUPING SETS(EmployeeCode, EmployeeFName)
ORDER BY EmployeeFName DESC, EmployeeCode DESC



             --==================SECTION 26: GROUPING FUNCTION, ROLLUP, CUBE Operators and OVER Clause===================



				          -------------Question 135: Use of GROUPING FUNCTION------------


SELECT
CASE WHEN GROUPING(ProjectStartingDate)=1 THEN 1
ELSE ProjectStartingDate
END AS ProjectStartingDate,
CASE WHEN GROUPING(ProjectEndingDate)=1
THEN 1
ELSE ProjectEndingDate
END AS ProjectEndingDate,
COUNT(*) AS CountQty
FROM ProjectEmployeeRelationship
WHERE ProjectStartingDate BETWEEN '2020-01-01' AND '2022-06-06'
GROUP BY ProjectStartingDate,ProjectEndingDate WITH ROLLUP
ORDER BY ProjectStartingDate DESC, ProjectEndingDate DESC



                            -------------Question 136-Use of ROLLUP operator------------



SELECT ProjectCode,ProjectTitle,ManagerId,COUNT(ProjectCode) AS 'Number of Project' FROM Project
GROUP BY ROLLUP(ProjectCode,ProjectTitle,ManagerId)
ORDER BY ProjectCode


                      --------------Question 137-Using of CUBE operator------------------



SELECT ProjectCode,ProjectTitle,ManagerId,COUNT(ProjectCode) AS 'Number of Project' FROM Project
GROUP BY CUBE(ProjectCode,ProjectTitle,ManagerId)
ORDER BY ProjectTitle


                                ------------Question 138- OVER Clause-----------------


 SELECT EmployeeCode,ProjectStartingDate, HourlyRate, 
 COUNT(*) OVER (PARTITION BY ProjectStartingDate) AS TotalCount, 
 SUM(HourlyRate) OVER (PARTITION BY ProjectStartingDate) AS TotalRate,
 AVG(HourlyRate) OVER (PARTITION BY ProjectStartingDate) AS TotalAvg
 FROM ProjectEmployeeRelationship


 
     --========================= SECTION 27:Ranking Function(ROW_NUMBER,RANK,DENSE_RANK,NTILE) ============================



                             -------------Question 139- ROW Number Function-------------



 SELECT ROW_NUMBER() OVER(ORDER BY ProjectTitle DESC) AS RowNumber,ProjectTitle 
 FROM Project

SELECT ROW_NUMBER() OVER(PARTITION BY ProjectCode ORDER BY ProjectTitle) AS RowNumber, ProjectCode, ProjectTitle
FROM Project


                            -----------------Question 140- RANK Function--------------



SELECT RANK() OVER (ORDER BY EmployeeCode) AS 'Rank',
DENSE_RANK() OVER (ORDER BY EmployeeFName) AS DenseRank,
EmployeeCode,EmployeeFName FROM Employee


                                --------------Question 141- NTILE Function--------------



SELECT ProjectCode,
NTILE(1) OVER (ORDER BY ProjectCode) AS Tile1,
NTILE(2) OVER (ORDER BY ProjectCode) AS Tile2,
NTILE(3) OVER (ORDER BY ProjectCode) AS Tile3
FROM Project




 --======SECTION 28: ANALYTIC FUNCTIONS(FIRST_VALUE,LAST_VALUE,LAG,LEAD,PERCENT_RANK,CUME_DIST,PERCENTILE_CONT,PERCENTILE_DISC)=========





                      --------------Question 142: FIRST_VALUE-----------------


SELECT EmployeeCode, EmployeeFName, EmployeeLName,
FIRST_VALUE(EmployeeFName) Over(Partition By EmployeeCode Order By EmployeeLName) As Name
FROM Employee


                         -----------Question 143: LAST_VALUE----------------


SELECT EmployeeCode, EmployeeFName, EmployeeLName,
LAST_VALUE(EmployeeFName) Over(Partition By EmployeeCode Order By EmployeeLName) As Name
FROM Employee


                         --------------Question 144: LAG-----------------------



SELECT ProjectCode, ProjectTitle, ProjectBudget,
LAG(ProjectBudget,2,-1) OVER(ORDER BY ProjectBudget) AS Lag_1
FROM Project


                       -------------Question 145:LEAD------------------------


SELECT ProjectCode, ProjectTitle, ProjectBudget,
LEAD(ProjectBudget,2,-1) OVER(ORDER BY ProjectBudget) AS Lead_2
FROM Project



                           --------------Question 146:PERCENT_RANK-----------


SELECT ProjectCode, ProjectStartingDate, HourlyRate,
PERCENT_RANK() OVER (PARTITION BY ProjectCode ORDER BY HourlyRate) AS PctRank
FROM ProjectEmployeeRelationship


                           --------------Question 147: CUME_DIST-------------------


SELECT ProjectCode, ProjectStartingDate, HourlyRate,
CUME_DIST() OVER (PARTITION BY ProjectCode ORDER BY HourlyRate) AS CumeDist
FROM ProjectEmployeeRelationship


                          ---------------Question 148: PERCENTILE_CONT---------------


SELECT ProjectCode, ProjectStartingDate, HourlyRate,
PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY HourlyRate)
OVER(PARTITION BY ProjectCode) AS PctTile
FROM ProjectEmployeeRelationship


                       -------------------Question 149: PERCENTILE_DISC---------------


SELECT ProjectCode, ProjectStartingDate, HourlyRate,
PERCENTILE_DISC(.5) WITHIN GROUP (ORDER BY HourlyRate)
OVER(PARTITION BY ProjectCode) AS PctDisc
FROM ProjectEmployeeRelationship



                  --================SECTION 29: UPDATABLE VIEW======================


                       ----------------Question 150:Updatable VIEW----------------


UPDATE vu_Project
SET HourlyRate=HourlyRate+500
WHERE EmployeeCode='S10001'
GO



              --=============SECTION 30: Different Types Of Variable(Scalar, table)==============



                   ----------------Question 151: Scalar variable---------------

DECLARE @TotalAmount money;
SET @TotalAmount=(SELECT SUM(ProjectBudget) FROM Project)
IF @TotalAmount>3000000
PRINT 'Total Amount $'+CONVERT(varchar,@TotalAmount,1);
ELSE
PRINT 'No Due Found'


                   ----------------Question 152: Table variable--------------------



DECLARE @projectInfo TABLE
(ProjectCode char(5),HourlyRate decimal(18,2))
SELECT ProjectCode,SUM(HourlyRate) AS TotalRate FROM ProjectEmployeeRelationship
GROUP BY ProjectCode
HAVING SUM(HourlyRate)>1000






GO

                   ------=============SECTION 31: TEMPORARY TABLE=======================



                      -----------------Question 153:Local Temporary Table---------------



SELECT TOP 3 ProjectCode, AVG(HourlyRate) AS AvgRate 
INTO #TopPriject
FROM ProjectEmployeeRelationship
GROUP BY ProjectCode
ORDER BY AvgRate DESC

--Justify
SELECT * FROM #TopPriject

             ------------------Question 154: INSERT INTO Global temporary table--------------



--INSERT INTO ##RandomTable VALUES (DEFAULT)

----Justify
--SELECT * FROM ##RandomTable




            ------=============SECTION 32: Using of @@IDENTITY, @@ROWCOUNT With Variable Declaration===================


                             ----------Question 155: Identity,ROWCOUNT toiry-----------------

DECLARE @MyIdentity int,@MyCount int
INSERT INTO ProjectManager(ManagerFName,ManagerLName)
VALUES('Safrina','Safrina')
SET @MyIdentity=@@IDENTITY
SET @MyCount=@@ROWCOUNT
IF @MyCount=1
INSERT INTO Project(ProjectCode,ProjectTitle,ProjectBudget,ManagerId)
VALUES
('PC065','IT System',1800000,@MyIdentity)

--Justify
SELECT * FROM ProjectManager WHERE ManagerFName='Safrina'




         --======================SECTION 33:Conditional Processing(IF...ELSE,WHILE)=====================



                       ----------------Question 156: IF...ELSE Statement------------------------



DECLARE @TotalAmount money;
SET @TotalAmount=(SELECT SUM(ProjectBudget) FROM Project)
IF @TotalAmount>3000000
PRINT 'Total Amount $'+CONVERT(varchar,@TotalAmount,1);
ELSE
PRINT 'No Due Found'



                         -----------------Question 157: WHILE statement----------------------



SELECT * INTO #PrjctCopy 
FROM ProjectEmployeeRelationship
WHERE HourlyRate>210
WHILE
(SELECT SUM(HourlyRate) FROM #PrjctCopy)>10000
BEGIN 
UPDATE #PrjctCopy
SET HourlyRate=HourlyRate+500
IF 
(SELECT MAX(HourlyRate) FROM #PrjctCopy)>3000
BREAK;
ELSE
CONTINUE;
END;




         --================= SECTION 34: CURSOR(Creating,opening & closing A CURSOR) ========================= 



                   ---------------------Question 158: Creating CURSOR-----------------




DECLARE @ManegerId int,@ManegerFName varchar(10),  @ManegerLName varchar(10),@UpdateCount int;

SET @UpdateCount=0
DECLARE ManagerCursor CURSOR
FOR
SELECT * FROM ProjectManager


                ---------------------Opening A CUESOR-----------------------


OPEN ManagerCursor
FETCH NEXT FROM ManagerCursor INTO @ManegerId,@ManegerFName,@ManegerLName
WHILE @@FETCH_STATUS<>-1
BEGIN
IF @ManegerFName<>'Safrina'
BEGIN 
UPDATE ProjectManager
SET ManagerLName='Nishi' WHERE ManagerId=4
SET @UpdateCount=@UpdateCount+1
END
FETCH NEXT FROM ManagerCursor INTO @ManegerId,@ManegerFName,@ManegerLName

END


                     ------------------------CLOSING A CURSOR-----------------


CLOSE ManagerCursor
DEALLOCATE ManagerCursor

----Justify
--PRINT ''
--PRINT CONVERT(varchar,@UpdateCount)+ ' row(s) updated.'




      --================ SECTION 35: Transactions(BEGIN,COMMIT,ROLLBACK,TRY-CATCH,SAVE POINT & NESTED TRAN) ======================


	                     ---------------------Question 159:Transactions-----------------




GO
BEGIN TRAN
DECLARE @HourlyRate decimal(18,2)
SELECT @HourlyRate=HourlyRate
FROM ProjectEmployeeRelationship WHERE ProjectCode='PC045'
UPDATE ProjectEmployeeRelationship SET HourlyRate=@HourlyRate,ProjectStartingDate=GETDATE() 
WHERE ProjectCode='PC045'
COMMIT TRAN

----Justify
SELECT HourlyRate FROM ProjectEmployeeRelationship  WHERE ProjectCode='PC045'




                      --------Question 160: Transactions with TRY and CATCH-------------



DECLARE @departmentCode int;
BEGIN TRY
BEGIN TRAN
INSERT INTO Employee VALUES('S28472','Saidur','Rahman','L004');
SET @departmentCode=@@Identity
INSERT INTO Department VALUES(@departmentCode,'Account');
INSERT INTO Department VALUES(@departmentCode,'Finance');
COMMIT TRAN
END TRY
BEGIN CATCH 
ROLLBACK
END CATCH

                              --------Question 161: Nested Transactions------------



BEGIN TRAN
PRINT 'First Tran @@TRANCOUNT: '+ CONVERT(varchar,@@TRANCOUNT)
DELETE Department
BEGIN TRAN
PRINT 'Second Tran @@TRANCOUNT: '+ CONVERT(varchar,@@TRANCOUNT)
DELETE ProjectManager
COMMIT TRAN
PRINT 'COMMIT   @@TRANCOUNT: '+ CONVERT(varchar,@@TRANCOUNT)
ROLLBACK TRAN
PRINT 'ROLLBACK   @@TRANCOUNT: '+ CONVERT(varchar,@@TRANCOUNT)

PRINT ' ';
DECLARE @DepartmentCodeCount char(4), @ManagerIdCount char(6)
SELECT @DepartmentCodeCount= COUNT(*) FROM Department
SELECT @ManagerIdCount= COUNT(*) FROM ProjectManager
PRINT 'Project Count: ' + CONVERT(varchar,@DepartmentCodeCount)
PRINT 'Employee Count: ' + CONVERT(varchar,@ManagerIdCount)




                  ---------Question 162: A Transactions with two SAVE point---------------


IF OBJECT_ID('tempdb..#ManagerCopy') IS NOT NULL
DROP TABLE tempdb..#ManagerCopy
SELECT ManagerId,ManagerFName
INTO #ManagerCopy
FROM ProjectManager
WHERE ManagerId<=4
BEGIN TRAN
DELETE FROM #ManagerCopy WHERE ManagerId=1
SAVE TRAN Manager1
DELETE FROM #ManagerCopy WHERE ManagerId=2
SAVE TRAN Manager2
DELETE FROM #ManagerCopy WHERE ManagerId=3
SELECT * FROM #ManagerCopy
ROLLBACK TRAN Manager2
SELECT * FROM #ManagerCopy
ROLLBACK TRAN Manager1
SELECT * FROM #ManagerCopy
COMMIT TRAN
SELECT * FROM #ManagerCopy



                    --================ SECTION 36: WAIT FOR Clause ======================


					         ---------Question 163: Wait for---------------



PRINT 'HELLO WORLD'
WAITFOR DELAY '00:00:05'
PRINT 'BEST OF LUCK'
GO




                    --================ SECTION 37: Error Handling With TRY & CATCH BLOCK  ======================

					        ---------Question 164: Error Handling---------------




BEGIN TRY 

DECLARE @number1 int ,@number2 int, @result int
set @number1 = 50
set @number2 =0
set @result = @number1/@number2 

PRINT @result
END TRY 
BEGIN CATCH 
PRINT 'You can not divide any number by zero '
PRINT ERROR_MESSAGE()
PRINT ERROR_SEVERITY()
PRINT ERROR_STATE()
PRINT ERROR_LINE()
RAISERROR(16,6,1)
END CATCH 
GO