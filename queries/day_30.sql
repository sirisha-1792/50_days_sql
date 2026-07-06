use 50_days_sql_challenge;

--common table expression - CTE
-- just like functions. once defined can be use inside the same query again and again

--1.  create a temp table of salaries and use it
with salary_cte as 
(select emp_id, salary from cleaned_salaries)

select * from salary_cte;
-- where emp_id = 62;
-- can also apply filters like above

--2. combining employees and salaries table using cte
with emp_salary AS
(select ce.emp_id, ce.dept_id, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id)

select * from emp_salary;

--3. calculate avg salary (cte using aggregate functions)
with dept_avg AS
(select ce.dept_id, avg(cs.salary)
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.dept_id)

select * from dept_avg;

--4. Find employees earning more than dept avg
with dept_avg AS
(select ce.dept_id, avg(cs.salary) as avg_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.dept_id)

select ce.emp_id, ce.dept_id, cs.salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
join  dept_avg da
on ce.dept_id = da.dept_id
where ce.emp_id > da.avg_salary;