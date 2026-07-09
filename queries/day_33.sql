use 50_days_sql_challenge;

--1.  update or employee data using our view
create view emp_details as
select emp_id, emp_name, city 
from cleaned_employees;

-- b. emp_id = 110..... city updated to mumbai
select * from emp_details
where emp_id = 110;

update emp_details
set city = 'Mumbai'
where emp_id = 110;

--2. Create view for high salary employees(salary > 50000)
--b. use this view to fetch all data of employees

create view high_sal_emp as
select emp_id, salary
from cleaned_salaries
where salary > 50000;

select * from high_sal_emp;

--3. multi table view (combine emp + dept + salary data)
create view details AS
select ce.emp_id, ce.emp_name, cd.dept_id, cd.dept_name, cs.salary
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

select * from details;

--4. hr wants high salary employees with dept name
create view HR_DASHBOARD AS
select ce.emp_id, ce.emp_name, cd.dept_id, cd.dept_name, cs.salary
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

select * from HR_DASHBOARD
where salary > 50000;