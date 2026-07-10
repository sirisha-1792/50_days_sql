use 50_days_sql_challenge;
-- indexes concept: helps find data faster
--1. create index on employee id
create index idx_emp_id
on cleaned_employees(emp_id);

select * from cleaned_employees
where emp_id = 101;

--2. create index on dept_id
create index idx_dept_id
on cleaned_departments(dept_id);

select * from cleaned_departments
where dept_id = 1;

--3. composite index(emp_id, salary_dates)
create index idx_emp_sal_date
on cleaned_salaries(emp_id, salary_date);
select * from cleaned_salaries
where emp_id = 101
ansd salary_date = '2024-01-01';