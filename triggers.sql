select * from dbo.student

create table dbo.studentlog
(log_id int identity(1,1) not null,
student_id int not null,
operation varchar(50),
update_date datetime not null
)

select * from dbo.studentlog

alter trigger dbo.tr_student_insert
on dbo.student
instead of delete
as
 insert into dbo.studentlog(student_id,operation,update_date)
 select id,'delete',getdate() from deleted

select * from Student
--insert into student select 35,'sai','nine',56,'C'
--update student set name='sai' where id=35
--delete from student where id=34
--------
create trigger production.tr_product_delete
on production.products
instead of delete
as
 insert into dbo.studentlog(student_id,operation,update_date)
 select product_id,'delete',getdate() from deleted

 select * from production.products
 -------
--Create a new Trigger on Student Table to log new entries only when the mark < 
--80 or Grade is neither ‘A’ or ‘B’
 select * from studentlog

 insert into student select 
 (select max(id) from student)+1,'Hari','six',56,'D'

alter trigger dbo.tr_student_insert 
on dbo.student
for insert
as
INSERT INTO dbo.studentlog(student_id,operation,update_date)
        SELECT id, 'Mark lessthan 80', GETDATE()
        FROM inserted
        WHERE mark < 80 or grade not in('A','B')
--Create a trigger on Insert & Update on Employees Table. 
--   If the salary entered in within the range as per designation, nothing to do.
--   If the salary is less than min. salary, set it to min salary.
--   If the salary is higher than max salary, set it to max salary.
Create trigger dbo.tr_empsalcheck_insert 
on dbo.Employees 
for insert
as
    update e Set Salary=
    Case when e.salary < J.min_salary then j.min_salary
         when e.salary > J.max_salary then j.max_salary
   End
from employees E 
inner join inserted I on E.employee_id=I.employee_id
inner join jobs j on J.job_id= i.job_id
Go
--------
select * from YourTable
alter TRIGGER dbo.trigger_update_example
ON dbo.YourTable
for update
AS
INSERT INTO dbo.studentlog(student_id,operation,update_date)
SELECT ID AS old_column1,name,getdate() FROM inserted 
select * from dbo.studentlog
update YourTable set Name ='sai' where id = 1


create trigger production.tr_product_delete
on production.products
instead of delete
as
 insert into dbo.studentlog(student_id,operation,update_date)
 select product_id,'delete',getdate() from deleted
