use 50_days_sql_challenge;

--1. Find the employees who have valid departments
select ce.emp_id, ce.emp_name, cd.dept_name 
from cleaned_employees ce
inner join cleaned_departments cd
on ce.dept_id = cd.dept_id;

--2. Find all employees even without department
select ce.emp_id, ce.emp_name, cd.dept_name 
from cleaned_employees ce
left join cleaned_departments cd
on ce.dept_id = cd.dept_id;

--3. List employees without dept
select ce.emp_id, ce.emp_name, cd.dept_name 
from cleaned_employees ce
left join cleaned_departments cd
on ce.dept_id = cd.dept_id
where dept_name is null;

--4. who earns how much 
select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
inner join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--5. Employees with salary null
select ce.emp_id, ce.emp_name, cs.salary
from cleaned_employees ce
inner join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where salary is null;