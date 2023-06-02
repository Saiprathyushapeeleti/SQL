select * from sales.customers;
select * from sales.orders;

create view orders_customer 
as
select c.first_name,c.last_name,c.phone,c.email,o.order_status,o.order_date,o.required_date from sales.customers c
inner join sales.orders o
on c.customer_id=o.customer_id;

select * from orders_customer;
--------views

alter VIEW [dbo].[brandcategoryproducts]
AS
SELECT        p.product_name,b.brand_id,c.category_name
FROM            production.brands b INNER JOIN
                         production.products p ON b.brand_id = p.brand_id INNER JOIN
                         production.categories c ON p.category_id = c.category_id
WHERE c.category_name like '%cycle%'
GO

select * from brandcategoryproducts;
---view
create VIEW customers_products
AS
select concat (c.first_name,' ',c.last_name) as customer_name ,p.product_name  From sales.customers c
inner join sales.orders o on c.customer_id=o.customer_id
inner join sales.order_items oi on oi.order_id=o.order_id
inner join production.products p on p.product_id = oi.product_id

select * from customers_products
---------
