-- Write an sql query to find all numbers that appear at least three times consecutively.

create table consecutive_nums (id int,num int);

insert into consecutive_nums values 
(1,34),
(2,45),
(3,45),
(4,56),
(5,45),
(6,47),
(7,47),
(8,47),
(9,47),
(10,48),
(11,48),
(12,48);

select sub1.num,count(*) from (select sub.num num,sub.lead_val from (select id,num,lead(num,1,0) over (order by id) as lead_val 
from consecutive_nums) sub
where sub.num=sub.lead_val) sub1
group by sub1.num
having count(*) >=2;
