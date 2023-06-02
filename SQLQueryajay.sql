select * from production.brands;
select * from production.products;

select b.*,p.* from production.brands b
inner join production.products p
on b.brand_id=p.brand_id;

select b.*,p.* from production.brands b
inner join production.products p
on b.brand_id=p.brand_id
where p.category_id = 6 and p.model_year = (select max(model_year) from production.products) ;

CREATE TABLE source (Num INT PRIMARY KEY, 
Type_code VARCHAR(10), 
Comp_code int, 
Transaction_Date DATETIME, 
flag int)

INSERT INTO source VALUES 
    (123,'ABC','001','1-03-2023',1),
    (124,'RST','002','3-01-2022',0),
    (125,'DEF','003','4-01-2022',0),
    (126,'PQR','004','5-01-2022',0),
    (127,'LMN','005','10-01-2022',1);

select * from source;



CREATE TABLE look_up(Num INT, 
Type_code VARCHAR(10), 
Comp_code int, 
inception_Date DATETIME,
expire_Date DATETIME,
ICG VARCHAR(20));

INSERT INTO look_up VALUES 
    (123,'ABC','001','1-02-2022','1-01-2023','ABC_001_1'),
    (124,'ABC','001','1-02-2022','1-02-2024','ABC_001_2'),
    (124,'RST','002','3-01-2022','3-01-2023','RST_002_1'),
    (125,'DEF','003','4-01-2022','4-01-2025','DEF_003_3'),
    (126,'PQR','004','3-01-2022','5-01-2027','PQR_004_3'),
    (126,'PQR','004','5-01-2022','5-01-2027','PQR_004_4'),
    (127,'LMN','005','6-01-2022','6-01-2022','LMN_005_2'),
    (127,'LMN','005','1-01-2022','7-01-2023','LMN_005_1');

Select * from look_up;

select s.*,l.* from source s
inner join look_up l
on s.Type_code=l.type_code and s.Comp_code=l.comp_code;


select s.*,l.icg from source s
inner join look_up l on s.Type_code=l.Type_code
where FLAG = 0 and transaction_date in
(select distinct(transaction_date) from source s
inner join look_up l
on s.Comp_code=l.comp_code);



SELECT l.icg, MAX(l.inception_date) 
FROM source s JOIN look_up l 
ON s.type_code = l.type_code AND s.comp_code = l.comp_code 
WHERE s.flag = 0 GROUP BY l.icg, s.transaction_date;

has context menu
Compose


(select s.*,l.* from source s
inner join look_up l
on s.Type_code=l.type_code
WHERE flag = 1 and s.Transaction_Date between l.inception_date and l.expire_date );

