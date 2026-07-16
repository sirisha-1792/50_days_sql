use 50_days_sql_challenge;

--1. create temp table for emp salary summary
create temporary table temp_sal_summary
(emp_id int, total_salary int);

--2. insert data into temp table 
insert into temp_sal_summary(emp_id, total_salary)
select emp_id, sum(salary)
from cleaned_salaries
group by emp_id;

select * from temp_sal_summary;

--3. join temp table with emp table
select ce.emp_id, ce.emp_name, tt.total_salary
from cleaned_employees ce
join temp_sal_summary tt
on ce.emp_id = tt.emp_id;

--4. drop temp table
drop temporary table temp_sal_summary;