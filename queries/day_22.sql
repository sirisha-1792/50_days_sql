use 50_days_sql_challenge;

--1. dept avg salary
select ce.emp_id, ce.dept_id, cs.salary, 
avg(cs.salary) over (partition by ce.dept_id)
    as dept_avg_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--2. total salary of each dept(emp_id, dept_id, salary)
select ce.emp_id, ce.dept_id, cs.salary, 
sum(cs.salary) over (partition by ce.dept_id)
    as dept_total_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--3. avg performance of each dept(emp_id, dept_id, avg_rating)
select ce.emp_id, ce.dept_id, 
avg((cp.rating_2022+cp.rating_2023+cp.rating_2024)/3) over (partition by ce.dept_id)
    as dept_avg_rating
from cleaned_employees ce
join cleaned_performance cp
on ce.emp_id = cp.emp_id;