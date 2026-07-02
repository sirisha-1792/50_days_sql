use 50_days_sql_challenge;

--1. find rank of employees each dept based on salary
select ce.emp_id, ce.dept_id, cs.salary, 
dense_rank() over (partition by ce.dept_id order by cs.salary desc)
as dept_rank
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--2. compare each employee's salary with thier dept avg salary
-- salary > avg = above avg  ...... saalry < avg = below avg

select ce.emp_id, ce.dept_id, cs.salary, 
avg(cs.salary) over (partition by ce.dept_id)
as dept_avg_salary, 
case
   when cs.salary > avg(cs.salary) over (partition by ce.dept_id) then 'Above Avg'
   when cs.salary < avg(cs.salary) over (partition by ce.dept_id) then 'below Avg'
   else 'Equal'
   end as comparision
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--3. find top 3 highest paid employees in each dept
WITH ranked_employees AS (
    SELECT ce.emp_id, ce.dept_id, cs.salary,
        DENSE_RANK() OVER (PARTITION BY ce.dept_id ORDER BY cs.salary DESC) AS salary_rank
    FROM cleaned_employees ce
    JOIN cleaned_salaries cs
    ON ce.emp_id = cs.emp_id
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 3;

--4. Find the lowest salary employee in each dept
WITH ranked_employees AS (
    SELECT ce.emp_id, ce.dept_id, cs.salary,
        DENSE_RANK() OVER (PARTITION BY ce.dept_id ORDER BY cs.salary)
        AS salary_rank
    FROM cleaned_employees ce
    JOIN cleaned_salaries cs
    ON ce.emp_id = cs.emp_id
)

SELECT *
FROM ranked_employees
WHERE salary_rank = 1;