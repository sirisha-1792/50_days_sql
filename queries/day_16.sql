use 50_days_sql_challenge;

--1. Total salary per employee
select ce.emp_id, ce.emp_name, sum(cs.salary) as total_salary
from cleaned_salaries cs
join cleaned_employees ce 
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;

--2. Average saalry per employee (id, name)
select ce.emp_id, ce.emp_name, avg(cs.salary) as avg_salary
from cleaned_salaries cs
join cleaned_employees ce 
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;

--3. count saalry records
select ce.emp_id, ce.emp_name, count(cs.salary_id) as salary_count
from cleaned_salaries cs
join cleaned_employees ce 
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;

--4. Max salary per employee
select ce.emp_id, ce.emp_name, max(cs.salary) as max_salary
from cleaned_salaries cs
join cleaned_employees ce 
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;