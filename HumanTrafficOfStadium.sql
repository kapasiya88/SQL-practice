-- https://leetcode.com/problems/human-traffic-of-stadium/description/

create table stadium (id int,visit_date date,people int);

insert into stadium values 
(1,'2017-01-01',10),
(2,'2017-01-02',109),
(3,'2017-01-03',150),
(4,'2017-01-04',990),
(5,'2017-01-05',14),
(6,'2017-01-06',1455),
(7,'2017-01-07',199),
(8,'2017-01-08',188),
(9,'2017-01-09',188),
(10,'2017-01-10',10),
(11,'2017-01-11',101),
(12,'2017-01-12',101),
(13,'2017-01-13',90);

with q1 as (
select *, 
     count(*) over( order by id range between current row and 2 following ) following_cnt,
     count(*) over( order by id range between 2 preceding and current row ) preceding_cnt,
     count(*) over( order by id range between 1 preceding and 1 following ) current_cnt
from stadium
where people > 99
)
select id, visit_date, people
from q1
where following_cnt = 3 or preceding_cnt = 3 or current_cnt = 3
order by visit_date;
