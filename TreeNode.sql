-- https://leetcode.com/problems/tree-node/description/

create table tree (id int,p_id int);

insert into tree values 
(1,null),
(2,1),
(3,1),
(4,2),
(5,2),
(6,3);

select id,
case when p_id is null then 'Root'
when id not in (select p_id from tree where p_id is not null) then 'Leaf'
else 'Inner'
end as type from tree;
