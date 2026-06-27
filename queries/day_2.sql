-- 1. departments
select * from cleaned_departments
where dept_name is null or dept_name = ''
    or dept_id is null or dept_id = '';

-- 2. employees
select * from cleaned_employees
where emp_name ='' or emp_name is NULL
    or city ='' or city is NULL
    or age ='' or age is NULL
    or dept_id ='' or dept_id is NULL
    or emp_id ='' or emp_id is NULL
    or hire_date = '' or hire_date is NULL;

--3. attendance
select * from cleaned_attendance
where attendance_id = '' or attendance_id is NULL
    or emp_id = '' or emp_id is NULL
    or status = '' or status is NULL
    or attendance_date = '' or attendance_date is null;

--4. salaries
select * from cleaned_salaries
where salary_id = '' or salary_id is NULL
    or emp_id = '' or emp_id is NULL
    or salary = '' or salary is NULL
    or salary_date = '' or salary_date is NULL;

--5. performance
select * from cleaned_performance
where emp_id = '' or emp_id is NULL
    or rating_2022 = '' or rating_2022 is null
    or rating_2023 = '' or rating_2023 is null
    or rating_2024 = '' or rating_2024 is null;

