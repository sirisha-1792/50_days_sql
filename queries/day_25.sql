use 50_days_sql_challenge;

--1. salary running total(cumulative salary for each employee over time)

salary    cumulative
1000        1000
1500        2500
2000        5400
1000        5500

select emp_id, salary, salary_date, 
sum(salary) over (partition by emp_id order by salary_date)
as running_salary
from cleaned_salaries;

--2. attendance running count(find total attendance count over time)
select emp_id, attendance_date, 
count(attendance_date) over (partition by emp_id order by attendance_date)
as running_attendance
from cleaned_attendance;

--3. dept cumulative salary
total salary accumutaled in each dept over time

select ce.dept_id, cs.salary, cs.salary_date,
sum(cs.salary) over (partition by ce.dept_id order by cs.salary_date)
as dept_cum_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

