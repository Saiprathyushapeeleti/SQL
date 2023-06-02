select ASCII(5) AS ASCIIValue;

SELECT CHAR(53) AS NumberCodeToCharacter;

SELECT CHARINDEX('t', 'Customer') AS MatchPosition;

SELECT CONCAT('W3Schools', '.com');

SELECT CONCAT ('W3Schools' + '.com');
select 'W3schools'+'@gmail'
SELECT CONCAT_WS('.', 'www', 'W3Schools', 'com');
SELECT DATALENGTH('W3Schools.com');
SELECT DIFFERENCE('Juice', 'Jucy');
SELECT LEFT('SQL Tutorial', 3) AS ExtractString;
SELECT LEN('W3Schools.com');
SELECT LOWER('SQL Tutorial is FUN!');
SELECT LTRIM('     SQL Tutorial') AS LeftTrimmedString;
SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLICATE('SQL Tutorial', 5);
SELECT REVERSE('SQL Tutorial');
SELECT RIGHT('SQL Tutorial', 3) AS ExtractString;
SELECT RTRIM('SQL Tutorial     ') AS RightTrimmedString;
SELECT STR(185);
SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');
SELECT SUBSTRING('SQL Tutorial', 10, 5) AS ExtractString;
SELECT TRIM('     SQL Tutorial!     ') AS TrimmedString;
SELECT UPPER('SQL Tutorial is FUN!');

SELECT Abs(-243.5) AS AbsNum; --243.5
SELECT AVG(id) AS AverageId FROM emp;
SELECT CEILING(25.25) AS CeilValue; --26
SELECT COUNT(ID) AS NumberOfIds FROM emp;
SELECT FLOOR(25.75) AS FloorValue; --25
SELECT MIN(id) AS MinId FROM emp;
SELECT MAX(id) AS MaxId FROM emp;
SELECT POWER(4, 2); --16
SELECT ROUND(235.41565782, 4) AS RoundValue; --235.4157000
SELECT SQUARE(64);--8

select GETDATE();
SELECT CONVERT(date, GETDATE()) AS CurrentDate;

select	DATEPART(year,GETDATE()),DATEPART(MONTH,GETDATE()),DATEPART(DAY,GETDATE()),
DATEPART(DAYOFYEAR,GETDATE()),DATEPART(WEEKDAY,GETDATE()),DATEPART(WEEK,GETDATE()),DATEPART(MINUTE,GETDATE())

declare @var decimal(9,2)

select*,
case when name like '%komal%' or  name like '%kamal%'
then age * .05
else min_salary .1
end as min_bonus,
case when job_title like '%manager%' or job_title like '%admin%'
then max_salary .05
else max_salary * .1
end as max_bonus
from jobs
select * from emp

