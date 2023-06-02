select * from teams
insert into teams values ('india'),('srilanka'),('australia'),('england'),('ireland');

select * from teams t1 
inner join teams t2 
on t1.name < t2.name

SELECT DISTINCT marks
FROM emp
ORDER BY marks DESC
OFFSET 3-1 ROWS FETCH next 1 ROW only ;

create table emp (marks int)
select * from emp
insert into emp values (62), (85), (97),(45)

SELECT name
FROM (
  SELECT name, ROW_NUMBER() OVER (partition by name ORDER BY name) AS RowNum
  FROM teams
) as s
WHERE RowNum % 2 = 1;
--------product name input,customer name output
create procedure getcustomername (@invar varchar(100))
As
begin
select concat(c.first_name,c.last_name) from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.order_items oi on o.order_id=oi.order_id
inner join production.products p on p.product_id=oi.product_id
where p.product_name = @invar
end

declare @var1 varchar(100)
set @var1='Surly Wednesday Frameset - 2016'
exec getcustomername @VAR1

select * from production.products

alter procedure nameexistornot (@invar varchar(100),@out int)
As
begin
	if exists (select * from teams where name=@invar )
	begin
	return 0
	end
ELSE
	begin 
	insert into teams values(@invar)
	return 1
	end

end
declare @var1 varchar(100),@var2 int, @var3 int
set @var1='india'
exec @var3=nameexistornot @var1, @var2 out
select @var1,@var2,@var3
-------------try & catch
alter procedure trycatch 
as
begin
	
	begin try 
	declare @var decimal(9,2)
	set @var = 'SAI'
	select @var;
	end try
	
	begin catch
	select error_number(),
	ERROR_MESSAGE(),
	ERROR_LINE(),
	ERROR_PROCEDURE(),
	ERROR_SEVERITY(),
	ERROR_STATE()
	end catch
end

exec trycatch
-------------%a%----
alter procedure name_like (@in varchar(10))
As
begin
select * from teams
where name like @in +'%'
end

exec name_like 'a'

-------------number divide by 3,4,5
create procedure number_details (@num int)
as
begin
	
	begin try 
	if @num%5=0  print('number is divisible by 5')
	else if  @num%4=0  print('number is divisible by 4')
	else if  @num%3=0  print('number is divisible by 3')
	else print('number is not divisible by 3,4,5')
	end try
	
	begin catch
	Print ('getting error')
	end catch
end

exec number_details 45
----- create temp table
create table #emp1 (id int);
-----
select * from #emp
insert into #emp values(1),(2)

select * into #emp_new from #emp



