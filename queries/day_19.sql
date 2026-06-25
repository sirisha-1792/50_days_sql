use 50_days_sql_challenge;

--1. Salary category(low<30000  30000<medium<60000   high>60000)

select emp_id, salary,
case
   when salary < 30000 then 'Low'
   when salary between 30000 and 60000 then 'Medium'
   else 'High'
end as category
FROM cleaned_salaries;

--2. performance category 
--(avg rating >=4  'good'...... =3  'Average'   'poor')
select emp_id, (rating_2022+rating_2023+rating_2024)/3 as avg_rating,
CASE 
   when ((rating_2022+rating_2023+rating_2024)/3) >= 4 then 'Good'
   when ((rating_2022+rating_2023+rating_2024)/3)= 3 then 'Average'
   else 'Poor'
end as 'Rating'
from cleaned_performance;

--3. Attendance status category(present - 'Active', else 'Inactive')
select emp_id, status,
case 
    when status = 'Present' then 'Active'
    else 'Inactive'
end as 'Status_Category'
from cleaned_attendance;

--4. Experience category(fresher<2, 2<mid level<5, experienced>5)
select emp_id,year(curdate())-year(hire_date) as experience_years,
CASE
    when year(curdate())-year(hire_date) < 2 then 'Fresher'
    when year(curdate())-year(hire_date) between 2 and 5 then 'Mid-level'
    else 'Experienced'
end as 'Experience_Category'
from cleaned_employees;