select * from production.brands;
select * from production.products;


select p.product_name,b.brand_name from production.products p
inner join production.brands b
on p.brand_id=b.brand_id;

select b.brand_name, count(p.product_id) from production.products p
inner join production.brands b
on p.brand_id=b.brand_id
group by b.brand_name;

--Display staff details from the store 'Santa Cruz Bikes'
select ss.* from sales.stores ss
inner join sales.staffs sss on 
ss.store_id=sss.store_id
where ss.store_name='Santa Cruz Bikes';
--Display all products from  the store 'Baldwin Bikes'
select p.* from production.products p
inner join production.stocks ps
on p.product_id=ps.product_id
inner join sales.stores ss
on  ss.store_id=ps.store_id
where ss.store_name='Baldwin Bikes';
--Fetch customer details who does not have any order in the year 2018
select so.* from sales.orders so
inner join sales.customers sc on
so.customer_id=sc.customer_id
where year (so.order_date) != '2018';
--store details include staff details
select * from sales.stores s1
inner join sales.staffs s2
on s1.store_id=s2.store_id
where staff_id in (select distinct(manager_id) from sales.staffs)
order by store_name;
----Customer first_name,last_name,product_name,list_price,model_year,category_name,brand_name
SELECT C.first_name,C.last_name,P.product_name,P.list_price,P.model_year,Ct.category_name,B.brand_name
from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.order_items ot on ot.order_id=o.order_id
inner join production.products p on p.product_id=ot.product_id
inner join production.categories ct on ct.category_id=p.category_id
inner join production.brands b on b.brand_id=p.brand_id;
--Customer first_name,last_name,productcount
SELECT C.first_name,C.last_name,count(P.product_id)
from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.order_items ot on ot.order_id=o.order_id
inner join production.products p on p.product_id=ot.product_id
inner join production.categories ca on p.category_id=ca.category_id
where category_name like '%bikes%'
group by C.first_name,C.last_name
having count(P.product_id)>2
order by 3
----customername+manifacture date between >=2017
SELECT C.first_name,C.last_name,p.model_year
from sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.order_items ot on ot.order_id=o.order_id
inner join production.products p on p.product_id=ot.product_id
inner join production.categories ca on p.category_id=ca.category_id
where CA.category_name  like '%cycle%'and model_year >= 2017

SELECT DISTINCT C.first_name,C.last_name
FROM SALES.customers C
INNER JOIN SALES.orders O ON C.customer_id = O.customer_id
INNER JOIN SALES.order_items OI ON O.order_id = OI.order_id
INNER JOIN production.products P ON OI.product_id = P.product_id
INNER JOIN production.categories CA ON P.category_id = CA.category_id
WHERE CA.category_name LIKE '%cycle%' and model_year >=2017
ORDER BY 1

--WAQ to display count of customers for every product in brand 'electra'
select distinct p.product_name,count(c.customer_id) 
FROM SALES.customers c
INNER JOIN SALES.orders O ON c.customer_id = O.customer_id
INNER JOIN SALES.order_items OI ON O.order_id = OI.order_id
INNER JOIN production.products P ON OI.product_id = P.product_id
INNER JOIN production.brands B ON P.brand_id = B.brand_id
where B.brand_name='Electra'
group by P.product_name
order by 2 desc

--WAQ to display storename,productname,quantity
select distinct s.store_name, p.product_name, st.quantity 
FROM SALES.stores s
INNER JOIN production.stocks st ON s.store_id=st.store_id
INNER JOIN production.products P ON st.product_id = P.product_id


