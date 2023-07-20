-- create table
Create table employee
(id int,
salary int);

-- insert data
INSERT INTO EMPLOYEE VALUES 
(1,234),
(2,234),
(3,234),
(4,456),
(5,347),
(6,876),
(7,456),
(8,876),
(9,456),
(10,456),
(11,456),
(12,456),
(13,456);

-- select data
select * from employee;

-- Write an sql query to find numbers that appear at least three times consecutively.
select a.salary,conse_salary,total_occur from 
(select salary,count(*) as conse_salary from 
(select id,salary,lead(salary,1,0) over (order by id) as leading_val from employee)
where leading_val=salary group by salary HAVING count(*) >=2) a inner join 
(select salary,count(*) as total_occur from employee group by salary HAVING count(*) >=3) b  
on a.salary=b.salary;