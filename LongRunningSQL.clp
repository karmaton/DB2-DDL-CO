 select substr(appl_name,1,15) as Appl_name ,
 elapsed_time_min as "Elapsed Min." , 
 appl_status as "Status ", 
 substr(authid,1,10) as auth_id , 
 substr(inbound_comm_address,1,15) as "IP Address",  
 substr(stmt_text,1,30) as "SQL Statement" 
 from sysibmadm.long_running_sql 
 order by 2 desc ; 
