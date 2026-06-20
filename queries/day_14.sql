use 50_days_sql_challenge;

--1. Employees earning more than dept avg salary

select ce1.emp_id,ce1.emp_name, ce1.dept_id, cs1.salary
from cleaned_employees ce1
join cleaned_salaries cs1
on cs1.emp_id = ce1.emp_id
where cs1.salary >
(select avg(cs.salary) 
from cleaned_salaries cs
join cleaned_employees ce
on cs.emp_id = ce.emp_id
where ce.dept_id = ce1.dept_id);

--2. Employees whose salary is equal to highest salary per dept

select ce1.emp_id,ce1.emp_name, ce1.dept_id, cs1.salary
from cleaned_employees ce1
join cleaned_salaries cs1
on cs1.emp_id = ce1.emp_id
where cs1.salary =
(select max(cs.salary) 
from cleaned_salaries cs
join cleaned_employees ce
on cs.emp_id = ce.emp_id
where ce.dept_id = ce1.dept_id);

--3. Employees whose salary is equal to lowest salary per dept

select ce1.emp_id,ce1.emp_name, ce1.dept_id, cs1.salary
from cleaned_employees ce1
join cleaned_salaries cs1
on cs1.emp_id = ce1.emp_id
where cs1.salary =
(select min(cs.salary) 
from cleaned_salaries cs
join cleaned_employees ce
on cs.emp_id = ce.emp_id
where ce.dept_id = ce1.dept_id);