use 50_days_sql_challenge;

update cleaned_employees
set emp_name = trim(emp_name);

--Data type Conversion
-- 1. Employees
alter table cleaned_employees
modify emp_id int, 
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;

DESCRIBE cleaned_employees;  -- to get the data types 

-- 2. Department
alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(100);

DESCRIBE cleaned_departments;

-- 3. Attenddance
alter table cleaned_attendance
modify attendance_id int,
modify emp_id int, 
modify attendance_date date,
modify status varchar(100);

DESCRIBE cleaned_attendance;

-- 4. Performance
alter table cleaned_performance
modify emp_id int, 
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int;

DESCRIBE cleaned_performance;

-- 5. Salaries
alter table cleaned_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify is_outlier int;

DESCRIBE cleaned_salaries;