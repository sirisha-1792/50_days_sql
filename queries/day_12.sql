use 50_days_sql_challenge;

--1. avg salary of each dept
select cd.dept_name,avg(cs.salary) as avg_salary
from cleaned_departments cd
join cleaned_employees ce
on ce.dept_id = cd.dept_id
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by cd.dept_name; 
-- since no common cloumn they are joined as dept+emp then result with salaries

--2. How many days was each employee present
select ce.emp_id,ce.emp_name, count(ca.attendance_id)
from cleaned_employees ce
join cleaned_attendance ca
on ce.emp_id = ca.emp_id
group by ce.emp_id, ce.emp_name;

--3. Which employee belong to same dept
select dept_id, group_concat(emp_name) as employees
from cleaned_employees
group by dept_id
having count(*)>1;

--4. Which employee has more than one salary record
select ce.emp_id, ce.emp_name, count(cs.salary_id) as count_salary_record
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name
having count(cs.salary_id) > 1;