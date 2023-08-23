-- https://leetcode.com/problems/exchange-seats/description/

create table seat (id int,student varchar(100));

insert into seat values 
(1,'A'),
(2,'B'),
(3,'C'),
(4,'D'),
(5,'E'),
(6,'F'),
(7,'G');

with s as 
(select id,student,
case when (lead(id,1) over (order by id)) is null then id 
when (mod(lead(id,1,0) over (order by id),2)) ==0 then lead(id,1,0) over (order by id)
else lag(id,1,0) over (order by id) end as swapped_seat
from seat)
select s1.id,s.student
from seat s1 inner join s 
on s1.id=s.swapped_seat order by s1.id;
