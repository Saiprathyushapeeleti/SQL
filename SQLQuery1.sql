CREATE TABLE Employee(ID INT, 
    name varchar(20),
	age int,
	sal decimal(9,2));
alter table employee add job varchar(20);

Insert into Employee(job) values ('hr'),('hr');

Insert into Employee (id,name,age,sal,dept)values
								(102,'Sajan',26,2000,30),
                                (103,'Kamal',28,7000,20),
								(104,'Raju',24,2000,40),
                                (105,'Komal',22,8500,20);

select * from Employee where (age between 20 AND 25) or (age<20)
delete employee where job = 'analyst'
update employee set sal = sal+(sal*0.20)
where dept = 20 AND age = 25

update employee set job = 'hr' where id = 100

CREATE TABLE dual(job varchar(20));
Insert into employee (job)values('hr'),
                                ('mng'),
                                ('developer'),
                                ('analyst'),
                                ('mng');
----------
select top 3 * from employees order by salary desc;

SELECT DISTINCT TOP 3  Salary
FROM employees 
ORDER BY Salary DESC;

select substring(name,1,3),substring(class,1,3) from student
SELECT name,SUBSTRING(name, 1, charindex(' ', name, 1))FROM student

create table emp as select * from employee
Select * from db.dbo.emp1 From db.dbo.employee where 1=2

select * from emp where sal between 2000 and 5000

select name from emp where name like '%l'

select concat(id,' ',name) from emp

select UPPER(name) as fname from emp

select * from emp where dept = 20

use db
drop table email
CREATE TABLE mail(ID INT, 
    fname varchar(20),
	lname varchar(20),
	age int,
	sal decimal(9,2),
	dept varchar(20));
Insert into mail values(5838,'sai','prathyusha',28,7000,'analyst'),
(5838,'hari','krishna',28,7000,'analyst'),
(5838,'ajay','prasad',28,7000,'analyst'),
(5838,'akash','sankar',28,7000,'analyst');
alter table mail add email varchar(max);
ALTER TABLE mail
DROP COLUMN email;

select * from mail;
update mail set email = concat(fname,'.',lname,'@gmail.com')
where id = 5838;

create table number(id int);
insert into number(id) values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
select min(id) as min_value,max(id) as max_value,avg(id) as avg_value,sum(id) as sum_value,count(id) as count_value
from number
where id%2=0;
select min(id) as min_value,max(id) as max_value,avg(id) as avg_value,sum(id) as sum_value,count(id) as count_value
from number
where id%2!=0;

select SUBSTRING(email,1,) from mail
select * from mail

SELECT 
    LEFT(email, CHARINDEX('.', email) - 1) AS First_Name,
	 SUBSTRING(email, CHARINDEX('.', email) + 1, CHARINDEX('@', email) - CHARINDEX('.', email) - 1) AS Last_Name
FROM 
   mail

