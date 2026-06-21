use 50_days_sql_challenge;

--1. Employees with salary records(atleast once)
select ce.emp_id, ce.emp_name
from cleaned_employees ce
where EXISTS
(select 1  FROM cleaned_salaries cs
where cs.emp_id = ce.emp_id);

--2. Employees without salary
select ce.emp_id, ce.emp_name
from cleaned_employees ce
where not exists 
(select 1 from cleaned_salaries cs
where cs.emp_id = ce.emp_id);

--3. Employees with attendance
select ce.emp_id, ce.emp_name
from cleaned_employees ce
where EXISTS
(select 1 from cleaned_attendance ca
where ca.emp_id = ce.emp_id);

-- 4.Employees without attendance
select ce.emp_id, ce.emp_name
from cleaned_employees ce
where not EXISTS
(select 1 from cleaned_attendance ca
where ca.emp_id = ce.emp_id);