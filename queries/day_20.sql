use 50_days_sql_challenge;

--1. latest salary
select * from
(select *, row_number() 
    over (partition by emp_id
    order by salary_date desc) 
    as rn 
from cleaned_salaries) new_table
where rn = 1;

--2. employees first salary
select * from
(select *, row_number() 
    over (partition by emp_id
    order by salary_date asc) 
    as rn 
from cleaned_salaries) new_table
where rn = 1;

--3. Rank salary entries (rank salaries for each employee)
select emp_id, salary, rank_number from
(select *, row_number()
    over (PARTITION BY emp_id
    order by salary_date asc)
    as rank_number
from cleaned_salaries) new_table
where rank_number = 1;

--4. get Top 2 salary records per employee
select emp_id, salary, rank_number from
(select *, row_number()
    over (PARTITION BY emp_id
    order by salary_date asc)
    as rank_number
from cleaned_salaries) new_table
where rank_number <= 2;

