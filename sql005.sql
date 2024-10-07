-- email : charlie.brown@example.com
-- schedule : OFF OFF OFF OFF OFF	10am-6pm 10am-6pm	
-- date : 2024-10-11

use employees_db;
set @email = 'charlie.brown@example.com';
set @schedule_date = '2024-10-17';

INSERT INTO emp_schedule (`monday`,`tuesday`,`wednesday`,`thursday`,`friday`,`saturday`,`sunday`,`date`,`emp_id`)
select 'OFF', 'OFF', 'OFF', 'OFF', 'OFF', '10am-6pm', '10am-6p', @schedule_date, ei.emp_id
from emp_info ei
where ei.email = @email
  and not exists (select 1 
                  from emp_schedule es
                  where es.emp_id = ei.emp_id
                  and es.date = @schedule_date);