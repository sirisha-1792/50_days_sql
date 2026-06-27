use 50_days_sql_challenge;

--finding outliers

alter table cleaned_salaries
modify salary int;

-- Basic understanding(finding min and mav vales which are the outliers)

select min(salary) as min_salary,
       max(salary) as max_salary,
       avg(salary) as avg_salary
from cleaned_salaries where salary > 0;

-- client rules max_salary 2,00,000 and min_salary 20,000

alter table cleaned_salaries
add column is_outlier int;

update cleaned_salaries
set is_outlier = case
when salary < 20000 or salary > 200000 then 1
else 0
END;

select * from cleaned_salaries
where is_outlier = 1;

update cleaned_salaries
set salary = case
when salary_id = 17 then 65000
when salary_id = 37 then 97000
else salary
END;

update cleaned_salaries
set is_outlier = 0 
where salary_id = 17 or salary_id = 37;