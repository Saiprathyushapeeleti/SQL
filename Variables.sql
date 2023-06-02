declare @intv INT
declare @varv varchar(100)
declare @datev datetime

SELECT @intv = 10, @varv = 'SAI', @datev = GETDATE()
SELECT @intv,@varv,@datev

declare @var varchar(20)
set @var = '05'
select @var+'05',@var+05

select concat('@intv'+'@varv','@var','@datev')

declare @name varchar(200);
set @name = 'Jai Sai RAM'
select @name;
select LEFT(@name,2),RIGHT(@name,2),LEN(@name),REPLACE(@name,'RAM','Ram')

declare @name varchar(200);
set @name = 'Jai Sai RAM'
select @name;





