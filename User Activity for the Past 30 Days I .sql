-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/

select activity_date as day,count(distinct user_id) as active_users
from activity
where activity_date >= DATEADD(DAY, -29, '2019-07-27') and activity_date <= '2019-07-27'
group by activity_date;