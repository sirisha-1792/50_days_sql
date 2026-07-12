use 50_days_sql_challenge;
--stored procedure: saved sql program which you can run anytime
--no need of delimiter in vs code. but do use delimiter in workbench

--1. Creating the procedure to get employee data
create procedure get_all_emp()
begin 
    select * from cleaned_employees;
end;

call get_all_emp();

--2. store a procedure with input parameter
-- find emp by emp_id
create procedure get_emp_by_id(in employee_id_input int)
begin   
    select * from cleaned_employees
    where emp_id = employee_id_input;
end;

call get_emp_by_id(110);

--3. procedure with join (emp and salary details)
create procedure emp_sal_details()
begin 
    select ce.emp_id, ce.emp_name, cs.salary, cs.salary_date
    from cleaned_employees ce
    join cleaned_salaries cs
    on ce.emp_id = cs.emp_id;
end;

call emp_sal_details();

--4. procedure for high salary employees(generate report for salary > 50000)
create procedure salary_report()
begin 
    select * from cleaned_salaries
    where salary > 50000;
end;

call salary_report();