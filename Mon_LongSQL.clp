 select varchar(application_name,15) as Appl_name ,
 elapsed_time_sec as "Elapsed Seconds" , 
 varchar(activity_state,20)  as "Status ", 
 varchar(session_auth_id,10) as auth_id ,
 total_cpu_time, 
 rows_returned, 
 substr(stmt_text,1,30) as "SQL Statement" 
 from sysibmadm.mon_current_sql 
 order by 2 desc ; 
