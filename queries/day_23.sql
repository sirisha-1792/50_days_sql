use 50_days_sql_challenge;

--1. current salary and prev salary 
select emp_id, salary, salary_date, 
lag(salary) over (partition by emp_id order by salary_date)
    as prev_salary 
from cleaned_salaries;

--2. Difference between current salary and prev salary
select emp_id, salary, salary_date, 
lag(salary) over (partition by emp_id order by salary_date)
    as prev_salary ,
salary - lag(salary) over (partition by emp_id order by salary_date)
    as salary_diff 
from cleaned_salaries;

--3. Attendance trend(Check if attendance improved or declined)
select emp_id, attendance_date, status as current_status,
lag(status) over (partition by emp_id order by attendance_date) 
    as prev_status
from cleaned_attendance;
   