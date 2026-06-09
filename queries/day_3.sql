use 50_days_sql_challenge;
 -- EMPTY EMPLOYEE NAME
update cleaned_employees
set emp_name = 'Unknown'
where emp_name is null or emp_name = '';

-- emp_id 13 = Delhi
update cleaned_employees
set city = 'Delhi'
where emp_id = 13;

update cleaned_employees
set city = 'Delhi NCR'
where city is null or city = '';

--rating_2023 = 0
update cleaned_performance
set rating_2023 = 0
where rating_2023 = '';

--FINDING DUPLICATE VALUES

--EMPLOYEES TABLE
select emp_id, emp_name, city, count(*)
from cleaned_employees
group by emp_id, emp_name, city
having count(*) > 1 ;

--DEPARTMENTS TABLE
select dept_id, dept_name, count(*)
from cleaned_departments
group by dept_id, dept_name 
having count(*)>1;

--PERFORMANCE TABLE
select emp_id, count(*)
from cleaned_performance
group by emp_id 
having count(*) >1 ;

--ATTENDANCE TABLE
select attendance_id,emp_id, count(*)
from cleaned_attendance
group by attendance_id, emp_id
having count(*) > 1; 

--SALARIES TABLE
select salary_id, emp_id, count(*)
from cleaned_salaries
group by salary_id, emp_id
having count(*) > 1;