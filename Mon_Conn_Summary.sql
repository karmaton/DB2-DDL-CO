select 
varchar(session_auth_id,10) as Auth_id, 
varchar(application_name,20) as Appl_name, 
io_wait_time_percent as Percent_IO_Wait,
rows_read_per_rows_returned as Rows_read_vs_Returned
from SYSIBMADM.MON_CONNECTION_SUMMARY ;
