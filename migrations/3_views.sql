-- 
-- depends: 2_inserting_in_table
create or replace view client_info as
select
    (select client_id from clients where client_id=workouts.client_id) as client_id,
    (select first_name from clients where client_id=workouts.client_id) as client_fName,
    (select last_name from clients where client_id=workouts.client_id) as client_sName,
    (select subscription_type from subscriptions where client_id=workouts.client_id) as typesub,
    (select name from instructors where instructor_id = workouts.instructor_id) as instructor_name,
    (select speciality from instructors where instructor_id = workouts.instructor_id) as instructor_speciality

from workouts;

create or replace view clients_without_traine as
select clients.first_name as Name,clients.last_name as sName
from clients
left join workouts on clients.client_id = workouts.client_id where workouts.client_id is null;

create or replace view today_workouts as
       select * from workouts where date = current_date;

create or replace view yesterday_workouts as
       select * from workouts where date < current_date;

create or replace view current_sub as
       select * from subscriptions where current_date <= end_date;

create or replace view uncurrent_sub as
       select * from subscriptions where end_date <= current_date;

create or replace view free_halls as
       select * from halls where capacity_now < halls.capacity_max;

create or replace view full_halls as
       select * from halls where capacity_now >= halls.capacity_max;

create or replace view yoga_workouts as
       select * from workouts where hall_id = 1;

create or replace view cardio_workouts as
       select * from workouts where hall_id = 2;






