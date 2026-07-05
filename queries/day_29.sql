use 50_days_sql_challenge;

--1. Latest salary per employee along with total salary till that point
select * from
(select emp_id, salary, salary_date, 
row_number() over (Partition by emp_id order by salary_date desc)
    as rnk, 
sum(salary) over (partition by emp_id order by salary_date)
    as running_total
from cleaned_salaries ) t
where rnk = 1;

--2. rank employees based on salary and compare with dept avg
select ce.emp_id, ce.dept_id, cs.salary, 
avg(cs.salary) over (PARTITION BY ce.dept_id )
as dept_avg,
rank() over (partition by ce.dept_id order by cs.salary)
as dept_rank
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--3. check if salary is increased or decreased compared to prev 
select emp_id, salary, salary_date,
lag(salary) over (PARTITION BY emp_id order by salary_date)
as prev_sal, 
case
    when salary > lag(salary) over (PARTITION BY emp_id order by salary_date) then 'Increased'
    when salary < lag(salary) over (PARTITION BY emp_id order by salary_date) then 'Decreased'
    else 'Same'
end compare
from cleaned_salaries;