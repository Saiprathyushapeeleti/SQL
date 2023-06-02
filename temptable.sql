select * from dbo.departments
select * from dbo.employees where employee_id = 103

select * from employees e
inner join departments d
on e.department_id=d.department_id
where d.department_name='it';

select * into #depit from employees where 1=2

select * into #dep from
(select e.*,d.department_name,d.location_id from employees e
inner join departments d
on e.department_id=d.department_id
where d.department_name='it') as sub;

select * from #dep
------ max sal
select e.*,d.department_name,d.location_id from employees e
inner join departments d
on e.department_id=d.department_id
where salary in (select max(salary) from employees)
------avg sal
select e.*,d.department_name,d.location_id from employees e
inner join departments d
on e.department_id=d.department_id
where salary > (select avg(salary) from employees)
---- common table expression
with cte 
as
(select avg(salary) as s from employees )
select * from employees e join  cte 
on e.salary>cte.s
---substring
SELECT SUBSTRING_INDEX (email, '@', 1) AS first_name from employees

SELECT LEFT(email, CHARINDEX('.', email) - 1) AS first_name from employees
---







