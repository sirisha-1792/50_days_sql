use 50_days_sql_challenge;

--1. current and next salary
select emp_id, salary, salary_date, 
lead(salary) over (partition by emp_id order by salary_date)
as next_salary
from cleaned_salaries;

--2. Growth salary compare our current salary with next salary
select emp_id, salary, salary_date, 
lead(salary) over (partition by emp_id order by salary_date)
    as next_salary ,
salary - lead(salary) over (partition by emp_id order by salary_date)
    as salary_diff 
from cleaned_salaries;

--3. attendance trend prediction(today vs next day)
select emp_id,attendance_id, attendance_date, status,
lead(status) over (partition by emp_id order by attendance_date)
as next_status
from cleaned_attendance;