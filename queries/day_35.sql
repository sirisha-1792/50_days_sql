use 50_days_sql_challenge;
--index optimisation
--1. analyse query before index
-- tells what time it will take : explain analyze
explain analyze  
select ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--after index
create index ind_emp_emp on cleaned_employees(emp_id);
create index ind_emp_sal on cleaned_salaries(emp_id);

explain analyze
select ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--2. composite index

--a. analyse (where emp_id = 101, salary_date = 2024-01-01)
--b. create index
--c. check after index
explain analyze
select ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where ce.emp_id = 101 and cs.salary_date = "2024-01-01";

create index ind_emp_date on cleaned_salaries(emp_id,salary_date);
explain analyze
select ce.emp_name, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
where ce.emp_id = 101 and cs.salary_date = "2024-01-01";

--3. emp_id = 101    apply_index     analyse
explain analyze
select * from cleaned_salaries
where emp_id = 101;

create index idx_on_emp_id on cleaned_salaries(emp_id);
explain analyze
select * from cleaned_salaries
where emp_id = 101;