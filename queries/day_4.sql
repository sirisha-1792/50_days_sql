use 50_days_sql_challenge;

-- Employees table
with cte as (
    select * , row_number() over (PARTITION BY emp_id, emp_name, city
    order by emp_id) as rn
    from cleaned_employees
)
delete from cleaned_employees 
where emp_id in
(select emp_id from cte where rn > 1);

-- Dept table
with cte as (
    select * , row_number() over (PARTITION BY dept_id, dept_name
    order by dept_id) as rn
    from cleaned_departments
)
delete from cleaned_departments
where dept_id in
(select dept_id from cte where rn > 1);

-- Salaries table
with cte as(
    select * , row_number() over (PARTITION BY salary_id, emp_id
    order by salary_id) as rn 
    from cleaned_salaries
)
delete from cleaned_salaries
where salary_id in 
(select salary_id from cte where rn > 1);

--performance table
with cte as(
    select *, row_number() over 
    (partition by emp_id 
    ORDER BY  emp_id) as rn
    from cleaned_performance
)
delete from cleaned_performance
where emp_id in
(select emp_id from cte where rn > 1);

-- Task 2: Text Inconsistency
-- city
select distinct city 
from cleaned_employees;

select distinct dept_name
from cleaned_departments; -- no text inconsistency

update cleaned_employees
set city = concat(upper(left(trim(city),1)),  lower(substring(trim(city),2)));
--remove spaces and then from left ie the first letter, is capital
--remove the spaces from the city and get the value that will start with index 2

update cleaned_employees
set city = case 

when city in('Dlhi', 'Delhi ncr', 'New delhi') then 'Delhi'
when city in('Hydbd') then 'Hyderabad'
when city in('Bangalore') then 'Benguluru'

else city
end;