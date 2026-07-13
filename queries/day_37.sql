use 50_days_sql_challenge;

--1. procedure with if condition ( find return msg based on salary)
create procedure salary_check(in emp int)
begin 
    declare sal int;
    select salary into sal
    from cleaned_salaries
    where emp_id = emp
    limit 1;

    if sal > 50000 then
        select "High Salary" as result;
    else
        select "Low Salary" as result;
    end if;
end;

call salary_check(101);

--2. create the procedure with case
--categorise the employee (salary>70000 then high , 40000-70000 then medium , <40000 then low)
create procedure emp_cat(in emp_id_input int)
begin 
    select emp_id, salary,
    case 
        when salary > 70000 then 'High'
        when salary between 40000 and 70000 then 'Medium'
        else 'Low'
    end as category_emp
    from cleaned_salaries
    where emp_id = emp_id_input
    limit 1;
end;

call emp_cat(463);

--3. store the procedure using aggregation
--find total sal per emp
create procedure total_sal_report()
begin 
    select emp_id, sum(salary)
    from cleaned_salaries
    group by emp_id;
end;

call total_sal_report;