use 50_days_sql_challenge;
---  EMPLOYEES TABLE
--1 remove invalid month  > 12

update cleaned_employees
set hire_date = null
where cast (SUBSTRING_INDEX(SUBSTRING_INDEX(hire_date, '-', 2), '-', -1) AS UNSIGNED) > 12;

-- 2 DD-MM-YYYY TO YYYY-MM-DD

update cleaned_employees
set hire_date = concat
    (RIGHT(hire_date,4) ,'-',substring(hire_date,4,2),'-', left(hire_date,2))
    where hire_date like '__-__-____' ;

--3 Remove invalid date

update cleaned_employees
set hire_date = null
where cast ( right(hire_date, 2) as unsigned) > 31;

alter table cleaned_employees
modify hire_date date;

select distinct hire_date from cleaned_employees;

select emp_id , hire_date
from cleaned_employees
where hire_date is null;

update cleaned_employees
set hire_date = '2024-02-25'
where hire_date is null;
-- where emp_id = 62 or emp_id = 88 or emp_id = 97 or emp_id = 132;

--- ATTENDANCE TABLE
update cleaned_attendance
set attendance_date = concat
    (RIGHT(attendance_date,4) ,'-',substring(attendance_date,4,2),'-', left(attendance_date,2))
    where attendance_date like '__-__-____' ;

alter table cleaned_attendance
modify attendance_date date;

---SALARY TABLE

update cleaned_salaries
set salary_date = null
where cast (SUBSTRING_INDEX(SUBSTRING_INDEX(salary_date, '-', 2), '-', -1) AS UNSIGNED) > 12;

update cleaned_salaries
set salary_date = concat
    (RIGHT(salary_date,4) ,'-',substring(salary_date,4,2),'-', left(salary_date,2))
    where salary_date like '__-__-____' ;

update cleaned_salaries
set salary_date = null
where cast ( right(salary_date, 2) as unsigned) > 31;

alter table cleaned_salaries
modify salary_date date;

select distinct salary_date from cleaned_salaries;

select emp_id , salary_date
from cleaned_salaries
where salary_date = null;

update cleaned_salaries
set salary_date = '2024-02-25'
where salary_id = 16;