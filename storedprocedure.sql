CREATE PROCEDURE id @var int
As
BEGIN 
SELECT * from emp where ID=@var
END;

declare @ipvar int = 102
execute id @IPVAR
------------------------------------
declare @ipvar int = 102, @ipvar2 int
exec @ipvar2 = id @ipvar

select @ipvar2;

create procedure studentname 
(@ID int, @NAME varchar OUT)
As
BEGIN 
SELECT name from emp where ID = @id
END;


declare @var1 int,@var3 int
declare @var2 varchar(100)
set @var1 = 102
execute @var3= studentname @var1,@var2 out
select @var1 as id,@var2 as nam ,@var3 as zero
------------

alter procedure sai (@id int,@name varchar out)
As
begin
select @name = name from emp where ID=@id
end

select * from emp

declare @var1 int, @var3 int, @var2 varchar(100)
set @var1 = 101
execute @var3 = sai @var1, @var2 out
select @var2 as name ,@var3
--PRODUCTS
alter PROCEDURE empname (@INVAR INT,@OUTVAR VARCHAR(100) OUT)
AS
BEGIN
SELECT @OUTVAR = P.product_name FROM production.products P
WHERE P.product_id=@iNVAR
END

declare @var1 int,@var3 int, @var2 varchar(100)
set @var1= 5
exec @var3=empname @var1,@var2 out
select @var2,@var3

SELECT  P.product_name FROM production.products P where p.product_id=5
------brands
create PROCEDURE ebrand (@INVAR varchar(100),@OUTVAR int OUT)
AS
BEGIN
SELECT @OUTVAR = P.brand_id FROM production.brands P
WHERE P.brand_name=@iNVAR
END
select * from production.brands

declare @var3 int,@var2 int, @var1 varchar(100)
set @var1='electra'
exec @var3=ebrand @var1,@var2 out
select @var2 op,@var3 result
-- select * from sales.staffs
alter procedure staff_name (@invar varchar(100), @outvar varchar(100) OUT)
as
begin
select @outvar = last_name from sales.staffs
return 0
end

declare @var1 varchar(20), @var2 varchar(100),@var3 int
set @var1 = 'fabiolo'
exec @var3=staff_name @var1, @var2 out
select @var2,@var3
----insert new data 
alter procedure add_details (@in1 int,@in2 varchar(100),@in3 varchar(100),@in4 int,@in5 varchar(2))
as
begin
  insert into dbo.student values(@in1,@in2,@in3,@in4,@in5)
return 0
end

declare @vin1 int,@vin2 varchar(100),@vin3 varchar(100),@vin4 int,@vin5 varchar(2),@var3 int
set @vin1 =(select max(id) from student)+1
set @vin2 ='sai'
set @vin3 ='seven'
set @vin4=90
set @vin5 ='A'
exec @var3=add_details @vin1,@vin2,@vin3,@vin4,@vin5
select @var3
---------------------
select * from dbo.teams

create table dbo.teams(name varchar(20))

Create procedure teams_name (@invar varchar(100))
as
begin
insert into dbo.teams values(@invar)
return 0
end

declare @var1 varchar(100), @var2 int
set @var1 = 'India'
exec @var2 = teams_name @var1
select @var2















