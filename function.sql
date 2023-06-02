alter function dbo.max_sal()
returns int
as
begin
declare @return int
select @return = min(salary) from employees 
return @return
end;

select dbo.max_sal() as min_sal
----
create function east_west(@in decimal(9,2))
returns varchar(50)
as
begin
declare @return varchar(50)
set @return = 'same'
if (@in > 0.00) set @return = 'east'
if (@in < 0.00) set @return = 'west'
return @return
end;

select dbo.east_west (1.02) as positive

select dbo.sal (101) as salary
-------find entire table
alter FUNCTION GetEmployees()
RETURNS TABLE
AS
RETURN (
    SELECT * FROM employees
	);
SELECT *
FROM dbo.GetEmployees();
---
select * from sales.order_items
----student
create function student_name(@in int)
returns varchar(50)
as
begin
declare @return varchar(50)
select @return = name from Student where id=@in 
return @return
end;

select dbo.student_name(5) as name
--brandname_product id
create function id_name(@in int)
returns varchar(50)
as
begin
declare @return varchar(50)
select @return = b.brand_name from production.products p 
inner join production.brands b
on p.brand_id=b.brand_id
where p.product_id =@in

return @return
end;

select dbo.id_name(5) as name
select b.brand_name from production.products p 
inner join production.brands b
on p.brand_id=b.brand_id
where p.product_id =5

---------product details_customerid
create function getprodet(@customerid int)
returns table
as
return 
select p.* from production.products p
inner join sales.order_items oi on p.product_id=oi.product_id
inner join sales.orders o on o.order_id=oi.order_id
inner join sales.customers c on c.customer_id=c.customer_id
where c.customer_id=@customerid 

select * from dbo.getprodet(1)
-----
select count(c.customer_id) from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.stores s on s.store_id=o.store_id
where s.store_name = 'Baldwin Bikes'

select * from sales.stores
--
