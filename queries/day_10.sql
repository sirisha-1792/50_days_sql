use 50_days_sql_challenge;

--1.Performance rating of each employee
select ce.emp_id, ce.emp_name, cp.rating_2022, cp.rating_2023, cp.rating_2024
from cleaned_employees ce
join cleaned_performance cp
on ce.emp_id = cp.emp_id;

--2. Which do not have any salary records
select ce.emp_name, ce.emp_id, cs.salary
from cleaned_employees ce
left join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where cs.emp_id is null;

--3. Which employee not have any attendance record
select ce.emp_name, ce.emp_id, ca.status
from cleaned_employees ce
left join cleaned_attendance ca
on ce.emp_id = ca.emp_id
where ca.emp_id is null;

--4. obtain employee name, dept_name, salary
select ce.emp_name, cd.dept_name, cs.salary
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;
