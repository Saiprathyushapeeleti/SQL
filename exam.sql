--1. Create a function to validate input date:
	--a. Input parameter date
	--b. If it is a weekday, return ‘WEEKDAY’, else ‘WEEKEND
CREATE FUNCTION ValidateInputDate (@inputDate DATE)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @result VARCHAR(10);

    IF DATEPART(WEEKDAY, @inputDate) IN (1, 7)
        SET @result = 'WEEKEND';
    ELSE
        SET @result = 'WEEKDAY';

    RETURN @result;
END;


select dbo.ValidateInputDate (CONVERT(date, GETDATE()))
---------
--2. WAQ to fetch first name and last name separately from email column in dbo.Employees Table
select * from employees

SELECT 
    LEFT(email, CHARINDEX('.', email) - 1) AS first_name,
    SUBSTRING(email, CHARINDEX('.', email) + 1, CHARINDEX('@', email) - CHARINDEX('.', email) - 1) AS last_name
FROM dbo.Employees;

select reverse(email) from employees

--4. Create a SP to insert new student details
--• Pass 4 input parameters – name, class, mark, grade
--• Insert to ID column using the current maximum ID value in the table
--• Add exception handling
--• Add an output variable to indicate whether student details successfully inserted 
--or not
--• Create a new Trigger on Student Table to log new entries only when the mark < 
--80 or Grade is neither ‘A’ or ‘B’alter procedure insert_details (@in1 int,@in2 varchar(100),@in3 varchar(100),@in4 int,@in5 varchar(2),@out varchar(50) out)
as
begin

	begin try	insert into dbo.student values(@in1,@in2,@in3,@in4,@in5)	set @out = 'sucessfully updated'	end try	begin catch	set @out = 'error'	end catch	return 0enddeclare @vin1 int,@vin2 varchar(100),@vin3 varchar(100),@vin4 int,@vin5 varchar(2),@vout varchar(50),@var3 intset @vin1 = (select max(id) from Student)+1set @vin2 ='ram'
set @vin3 ='nine'
set @vin4=89
set @vin5 ='A'
exec @var3=insert_details @vin1,@vin2,@vin3,@vin4,@vin5, @vout out
select @var3,@vout

select * from student
-------
--5. Create a function to return the Job details (Job Title, Minimum salary, Maximum salary) based 
--on the job title keyword. E.g., if the input is ‘Manag’, then it should return all job titles which 
--contain this keyword.
alter function job_details(@mng varchar(20))
returns table
as
RETURN (
    SELECT j.job_title,j.max_salary,j.min_salary FROM jobs j
	where j.job_title like @mng
	);

SELECT * from job_details ('%manag%')
--Write a Stored Procedure to distinguish Minor, major & Pensioner.
--Minor : less than 18
--Major : gr. than 18
--Pensioner : > 50
--If I pass a value to SP it should display the age category

alter procedure mnp(@in int,@var varchar(10) out)
as
begin
if @in < 18 set @var='minor';
else if @in >= 18 and @in<=50 set @var='Major';
else set @var='Pensioner';
end

DECLARE @var1 INT, @var2 VARCHAR(10), @var3 INT;
SET @var1 = 64;
EXEC @var3=mnp @var1,@var2 out
SELECT @var2, @var3;
--
--Write a query to add a column (Commission) to employees table. 
--And the value of commission should be 5% of their salaries for departments 1-6 and 10% for 7-12. 
--WAQ to calculate the annual salary of each employee which includes salary & commission
select * from employees
ALTER TABLE employees ADD comission int;
UPDATE Employees 
SET comission = 
case
when department_id between 1 and 6 then salary*0.05
else salary*0.1
end

select (salary+comission) as annual_salary from employees
--Create a view to fetch Employee details including:
--a. Employee full name
--b. Email
--c. Employee minimum & maximum salary
--d. Department name
--e. Location details which include country name & region name
create view get_details
as
select concat(e.first_name,e.last_name) as full_name,e.email,j.min_salary,j.max_salary,d.department_name, c.country_name,r.region_name
from employees e
inner join jobs j on e.job_id=j.job_id
inner join departments d on d.department_id=e.department_id
inner join locations l on l.location_id=d.location_id
inner join countries c on c.country_id=l.country_id
inner join regions r on r.region_id=c.region_id

select * from get_details
--Create a view to fetch Customer details including:
--a. Customer full name
--b. Order date & Order status
--c. Store name
--d. Number of products purchased
create view customer_details
as
select concat(c.first_name,c.last_name) as full_name,o.order_date,o.order_status,s.store_name,st.quantity from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.stores s on o.store_id=s.store_id
inner join production.stocks st on st.store_id=s.store_id
select * from customer_details


select * from student
-- WAQ to identify and delete duplicate records from a Table without using window functions
-- Create a temporary table to store duplicate records
SELECT s.name,COUNT(*) AS duplicate_count 
INTO #Duplicates
FROM student s
GROUP BY s.name
HAVING COUNT(*) > 1;

-- Delete duplicate records from the original table
DELETE FROM student 
WHERE EXISTS (
    SELECT 1
    FROM #Duplicates
    WHERE name=student.name
);
-- Drop the temporary table
DROP TABLE #Duplicates;

select * from student
-----------
--Write a function which accepts employee Id and return a table which contains:
--a. Employee name
--b. Employee email
--c. Reverse of email (use while loop)
alter function reverse_email(@in int)
returns table
as
return
(select concat(e.first_name,e.last_name) as full_name, e.email,reverse(email) as reverse_email 
from employees e 
where e.employee_id=@in );

select * from dbo.reverse_email(101)
--------

--Create a stored procedure which accepts employeeId as input and return minimum salary if the 
--ID is an odd number or else return max salary along with Employee full name in UPPERCASE and 
--job title.
alter procedure min_max(@in int, @out int out)
as
begin
declare @var int
if @in % 2= 0 
begin
select @out = max(salary) from employees
set @var = @out
end
else
begin
select @out = min(salary) from employees
set @var=@out;
end
select upper (Concat(first_name,' ',last_name)) as full_name,j.job_title from employees e
inner join jobs j on j.job_id=e.job_id
where salary = @var;
end

declare @var1 int, @var2 int, @var3 int
set @var1 = 100
exec @var3= min_max @var1, @var2 out
select @var2 out_put, @var3 result

 select * from employees

-- Generate these errors:
--a. Divide by zero error encountered.
 DECLARE @result INT;

SET @result = 10 / 0;

SELECT @result;
--correct
once cant divisible by zero

--b. Conversion failed when converting the ..........................DECLARE @value VARCHAR(10);
SET @value = 'ABC';

DECLARE @convertedValue INT;
SET @convertedValue = CAST(@value AS INT);

SELECT @convertedValue;
--correct
varchar cant convert to int
--c. Invalid object name '......................'
select * from inserts
--correct(table name not exists)
--d. Column '' is invalid in the select list because it is not contained in either an 
--aggregate function or the GROUP BY clause
select id, name,count(*) from Student
--correct
(with aggregate we cant select any columns, if we need to select then give group by)
--An aggregate may not appear in the WHERE clause unless it is in a subquery 
--contained in a HAVING clause or a select list, and the column being aggregated is 
--an outer reference
SELECT id, name,count(*) as total from Student
WHERE count(*)> 100;
--correct
(where cant filter agregate operations)
--String or binary data would be truncated in table
CREATE TABLE YourTable (
    ID INT identity(1,1) not null,
    Name VARCHAR(10)
);
INSERT INTO YourTable (ID, Name) VALUES ( 'ThisValueIsTooLong');
--correct
(if we give d=storage space 2 but insert more values then )
--Cannot insert explicit value for identity column in table
INSERT INTO YourTable (ID, Name) VALUES (1,'ThisValueIsTooLong');
--correct
(already while create table i add identity for id)
--There is already an object named------------------ in the database
CREATE TABLE YourTable (
    ID INT identity(1,1) not null,
    Name VARCHAR(10)
);
--correct
(same table name given second time)
--Subquery returned more than 1 value. This is not permitted when the subquery 
--follows =, !=, <, <= , >, >= or when the subquery is used as an expression.

SELECT *
FROM YourTable
WHERE name = (SELECT name FROM YourTable WHERE Name LIKE 'S%');

--correct
SELECT *
FROM YourTable
WHERE name in (SELECT name FROM YourTable WHERE Name LIKE 'S%');
--j. Cannot insert the value NULL into column 'l...', table '...'; column does not allow 
--nulls. INSERT fails.
CREATE TABLE test (
    ID INT primary key,
    Name VARCHAR(10), 
	salary int not null
);
insert into test(id,name,salary) select 1,'sai',5000

--k. Violation of PRIMARY KEY constraint 'PK__employee__C52E0BA863A548EC'. 
--Cannot insert duplicate key in object '....'. The duplicate key value is ()
insert into test(id,name,salary) select 1,'sai',5000
--correct 
(already id 1 is present so i create id as primary key if i insert 1 again)

--l. The INSERT statement conflicted with the FOREIGN KEY constraint "....". The 
--conflict occurred in database "....", table "....", column '....

CREATE TABLE Dep (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employe (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Dep(DepartmentID)
);

-- Inserting a row with a non-existing DepartmentID
INSERT INTO Employe (EmployeeID, EmployeeName, DepartmentID)
VALUES (1, 'John Doe', 100);






