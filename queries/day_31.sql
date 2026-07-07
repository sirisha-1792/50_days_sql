use 50_days_sql_challenge;

--1. employees whose total salary is 1 lakh
with total_sal AS
(select emp_id, sum(salary) as total_sal
from cleaned_salaries cs
group by emp_id),

high_earners AS
(select * from total_sal where total_sal > 100000)

select * from high_earners;

--2. show employyes salary along with dept avg salary
with dept_avg AS
(select ce.dept_id, avg(cs.salary) as avg_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.dept_id)

select ce.emp_id, ce.dept_id, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
join  dept_avg da
on ce.dept_id = da.dept_id;

--3. dept with highest salary per dept
with dept_total AS
(select ce.dept_id, sum(cs.salary) as dept_total
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.dept_id)

select * from dept_total
where dept_total = (select max(dept_total) from dept_total);