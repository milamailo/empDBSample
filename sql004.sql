-- email : charlie.brown@example.com
-- date : 2024-10-11
-- (10am to 6pm) to (11am to 4pm) ON Monday
use employees_db;
-- select * from emp_schedule;
set @email = 'charlie.brown@example.com';
set @schedule_date = '2024-10-11';

select @emp_id := emp_id from emp_info
where email = @email;
update emp_schedule
set monday = '11am-4pm'
where (emp_id = @emp_id) and (date = @schedule_date)
