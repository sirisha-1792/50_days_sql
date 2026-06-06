use 50_days_sql_challenge;
create table departments
(
    dept_id varchar(40), 
    dept_name varchar(40)
);

create table employees
(
    emp_id varchar(40) ,
    emp_name varchar(40), 
    age int, 
    city varchar(40), 
    dept_id varchar(40) , 
    hire_date DATE
);

create table salaries
(
    salary_id varchar(40) ,
    emp_id varchar(40),
    salary int,
    salary_date DATE
);

create table attendance
(
    attendance_id varchar(40) ,
    emp_id varchar(40),
    attendance_date DATE,
    status varchar(40)
);

create table performance
(
    emp_id varchar(40),
    rating_2022 DECIMAL,
    rating_2023 DECIMAL,
    rating_2024 DECIMAL
);