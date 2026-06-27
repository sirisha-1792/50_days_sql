use 50_days_sql_challenge;

--1. Rank of employees by salary
''' 
rank(): skips the numbers
dense_rank(): do not skip any rank
                dense_rank    rank
101    10000        3           4
102    35000        2           2
103    35000        2           2
104    40000        1           1

we cant apply any window function(eg: rank) for common table. 
We need to first create a particular view
'''

select emp_id, salary, 
rank() over (order by salary desc) as salary_rank
from cleaned_salaries;

--2. Dept wise ranking (rank employee inside each employee)
select ce.emp_id, ce.dept_id, cs.salary, 
dense_rank() over (partition by ce.dept_id 
                order by cs.salary desc) as dept_rank
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id;

--3. Top performer (calculate avg rating -rank)

select emp_id, (rating_2022+rating_2023+rating_2024)/3 avg_rating,
dense_rank() over (order by (rating_2022+rating_2023+rating_2024)/3 desc) as performqance_rank
from cleaned_performance;

--4. salary ranking (top 3 employees)
with ranked_salaries as(
select emp_id, salary, 
row_number() over (order by salary desc) as salary_rank
from cleaned_salaries
)
select emp_id, salary, salary_rank
from ranked_salaries
where salary_rank <= 3;