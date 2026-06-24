use 50_days_sql_challenge;

--1. Employees whose average performance rating > 4
--(2022+2023+2024)/3    > 4
select ce.emp_id, ce.emp_name, cd.dept_name, (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 as avg_rating
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_performance cp
on ce.emp_id = cp.emp_id
where (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 > 4;

--2. Employees with more than 2 present days
select ce.emp_id, ce.emp_name, count(ca.attendance_id) as present_days
from cleaned_employees ce
join cleaned_attendance ca
on ce.emp_id = ca.emp_id
where ca.status = 'Present'
group by ce.emp_id, ce.emp_name
having count(ca.attendance_id) > 2;

--3. Dept where total salary paid > 200000
select ce.emp_id, ce.emp_name, cd.dept_name, sum(cs.salary) as total_salary
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id = cd.dept_id
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name, cd.dept_name
having sum(cs.salary) > 200000;

--4. Employees whose total salary is > dept avg salary
select ce.emp_id, ce.emp_name, ce.dept_id, sum(cs.salary) as total_salary
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id = cs.emp_id
group by ce.emp_id, ce.emp_name, ce.dept_id
having sum(cs.salary) > (select avg(cs.salary) 
                        from cleaned_employees e2
                        join cleaned_performance s2
                        on e2.emp_id = s2.emp_id 
                        where e2.dept_id = ce.dept_id);