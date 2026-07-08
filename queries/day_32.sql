-- views 
use 50_days_sql_challenge;

--1. cerate employee view
create view emp_view AS
select emp_id, emp_name, dept_id, city
from cleaned_employees;

select * from emp_view where city = "Mumbai";

--2. create salary view
create view sal_view AS
select emp_id, salary,salary_date
from cleaned_salaries;

select * from sal_view where emp_id = 444;

--3. create joined view. emp_sal_view
create view emp_sal_view AS
select ce.emp_id, ce.emp_name, ce.dept_id, cs.salary, cs.salary_date
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--4. use above view for finding data where sal > 50000
select * from emp_sal_view where salary > 50000;