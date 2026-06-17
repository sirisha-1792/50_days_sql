use 50_days_sql_challenge;
--1. what is the employee name , department andd performance raring
select ce.emp_name, cd.dept_name, cp.rating_2022, cp.rating_2023, cp.rating_2024
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_performance cp
on ce.emp_id = cp.emp_id;

--2. What is the complete profile of the employee(dept, salary, performance)
select ce.emp_name, cd.dept_name,cs.salary, cp.rating_2022, cp.rating_2023, cp.rating_2024
from cleaned_employees ce
left join cleaned_departments cd
on ce.dept_id = cd.dept_id
left join cleaned_salaries cs
on ce.emp_id = cs.emp_id
left join cleaned_performance cp
on ce.emp_id = cp.emp_id;

--3. How much salary does each employee have
select ce.emp_name, ce.emp_id, count(cs.salary_id)
from cleaned_employees ce
left join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;

--4. total salary paid to each empl
select ce.emp_name, ce.emp_id, sum(cs.salary_id)
from cleaned_employees ce
left join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name;
