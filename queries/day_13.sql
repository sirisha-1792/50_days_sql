use 50_days_sql_challenge;

--1. Employee earning more than average salary
-- note: if there is calculation and comparing then in such cases sub queries are used

select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where salary > (select avg(salary) from cleaned_salaries);

--2. Employees salary = max(salary)
select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where salary = (select max(salary) from cleaned_salaries);

--3. Employees salary less than avg(salary)
select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where salary < (select avg(salary) from cleaned_salaries);

--4. Employees with minimum salary
select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where salary = (select min(salary) from cleaned_salaries);