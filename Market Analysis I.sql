-- https://leetcode.com/problems/market-analysis-i/description/

select user_id as buyer_id,join_date,COALESCE(count(order_id),0) as orders_in_2019
from 
users u left outer join orders o
on u.user_id=o.buyer_id and year(order_date)=2019
group by user_id,join_date;