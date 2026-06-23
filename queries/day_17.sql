use 50_days_sql_challenge;

--1. Employees with more than 2 saalry records
select emp_id, count(*) as total_records
from cleaned_salaries
group by emp_id 
having count(*) > 2;


--2. Departments with more than 3 employees
select dept_id, count(emp_id) as total_employees
from cleaned_employees
group by dept_id
having count(emp_id) > 3
order by dept_id;

--3. Employees with total salary > 100000
select emp_id, sum(salary) as total_salary
from cleaned_salaries
group by emp_id
having sum(salary) > 100000;

--4. Dept with high avg salary (>50000)
select ce.dept_id, avg(cs.salary) as avg_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by dept_id
having avg(salary) > 50000;
