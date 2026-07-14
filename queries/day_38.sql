use 50_days_sql_challenge;
--Trigers
--1. before update trigger(prevent negative salary)
create trigger prevent_negative_salary
before update 
on cleaned_salaries
for each row

begin 
if new.salary < 0 then 
    set new.salary = old.salary;
end if;
end;

select * from cleaned_salaries where emp_id = 164;

update cleaned_salaries
set salary = -4000
where emp_id = 164;

--2. after insert trigger (attendance login)
create table attendance_logs(emp_id int, attendance_date date, message varchar(100));

create trigger attendance_insert_log
after insert
on cleaned_attendance
for each row

begin
insert into attendance_logs(emp_id, attendance_date, message)
values (new.emp_id, new.attendance_date, 'Attendance added');
end;

select * from attendance_logs;
insert into cleaned_attendance
values (202601, 101, '2026-08-06', 'present');
