use 50_days_sql_challenge;

--1. compare each employee salary with overall avg salary
--(> avg    above avg,   <avg    below )
select emp_id, salary,
avg(salary) over () as overall_avg_salary,
case
    when salary > avg(salary) over () then 'Above avg'
    when salary < avg(salary) over () then 'Below avg'
    else 'equal'
end as comparison
from cleaned_salaries;
--over() : applies window's function on whole column. 

--2. compare Employee salary with total salary of all employees
--(sum(salary)*10% of total salary then high contributor else low)
select emp_id, salary,
sum(salary) over() as total_salary,
case
    when salary> sum(salary) over()*0.1 then 'High Contributor'
    else 'low Contributor'
end as Contribution
from cleaned_salaries;

--3. compare dept total salary with overall total
--(dept total_salary > 30% of total salary ---- high dept)
--else low
select ce.emp_id, ce.dept_id, cs.salary,
sum(cs.salary) over(partition by ce.dept_id) as dept_total_salary,
case
    when cs.salary > sum(cs.salary) over(partition by dept_id)*0.3 then 'High dept'
    else 'Low dept'
end as dept_contribution
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;