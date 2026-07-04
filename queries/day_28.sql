use 50_days_sql_challenge;

--1.  TOp 2 highest paid employees in each dept
select * from
(select ce.emp_id, ce.dept_id, cs.salary,
dense_rank() over (partition by ce.dept_id order by cs.salary desc)
    as rnk
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id) t
where rnk <= 2;

--2. salary gap (difference between current salary and prev salary)
select emp_id, salary, salary_date, 
lag(salary) over (partition by emp_id order by salary_date)
    as prev_salary, 
salary - lag(salary) over (partition by emp_id order by salary_date)
    as salary_gap
from cleaned_salaries ;

--3. Performance gap(change in performance between years)
select emp_id, rating_2022, rating_2023, rating_2024, 
rating_2022 - rating_2023 as first_gap,
rating_2023 - rating_2024 as second_gap
from cleaned_performance;

--4. Rank filtering (top performers)
select * from
(select ce.emp_id, ce.dept_id, cs.salary,
dense_rank() over (partition by ce.dept_id order by cs.salary desc)
    as rnk
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id) t
where rnk = 1;