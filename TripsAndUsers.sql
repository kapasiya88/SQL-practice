-- https://medium.com/jen-li-chen-in-data-science/leetcode-sql-dec67244ed80

-- customers who never order
create table Trips (id int,client_id int,driver_id int,city_id int,status varchar(50),request_at date);

----

insert into Trips values 
(1,1,10,1,'completed','2013-10-01'),
(2,2,11,1,'cancelled_by_driver','2013-10-01'),
(3,3,12,6,'completed','2013-10-01'),
(4,4,13,6,'cancelled_by_client','2013-10-01'),
(5,1,10,1,'completed','2013-10-02'),
(6,2,11,6,'completed','2013-10-02'),
(7,3,12,6,'completed','2013-10-02'),
(8,2,12,12,'completed','2013-10-03'),
(9,3,10,12,'completed','2013-10-03'),
(10,4,13,12,'cancelled_by_driver','2013-10-03');

----

create table users (id int,banned varchar(50),role varchar(50));

------
insert into users values 
(1,'No','client'),
(2,'Yes','client'),
(3,'No','client'),
(4,'No','client'),
(10,'No','Driver'),
(11,'No','Driver'),
(12,'No','Driver'),
(13,'No','Driver'); 

----

select sum(case when a.status!='completed' then 1 else 0 end)/count(*) as cancellation_rate, a.request_at
from 
(select t.id id,client_id,request_at ,status 
from trips t inner join users u  
on t.client_id=u.id where u.banned='No') a
inner join
(select t.id id,driver_id,request_at ,status 
from trips t inner join users u  
on t.driver_id=u.id where u.banned='No') b
on a.id=b.id
group by a.request_at;
