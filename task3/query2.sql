select * from subjects 
where end_semester - start_semester >= 2
and reporting_type in ('exam', 'both');