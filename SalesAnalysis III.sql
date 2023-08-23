-- https://leetcode.com/problems/sales-analysis-iii/description/

create table product (product_id int,product_name varchar(100),unit_price int);

create table sales (seller_id int,product_id int,buyer_id int,sale_sate date,quantity int,price int);

insert into product values 
(1,'S8',1000),
(2,'G4',800),
(3,'iphone',1400);

insert into sales values 
(1,1,1,'2019-01-21',2,2000),
(1,2,2,'2019-02-17',1,800),
(2,2,3,'2019-06-02',1,800),
(3,3,4,'2019-05-13',2,2800);

select product_name
from sales inner join product 
on sales.product_id=product.product_id
group by product_name 
having (min(sale_sate) >=to_date('2019-01-01','YYYY-MM-DD') and max(sale_sate <=to_date('2019-03-31','YYYY-MM-DD')));
