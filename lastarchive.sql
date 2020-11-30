select 
 substr(firstlog,1,14) as log_archived, substr(lastlog,1,12)  as log_chain ,
 start_time as archive_time , substr(location,1,80) as log_location  
 from sysibmadm.db_history 
 where operation = 'X' and operationtype='1' 
 order by start_time desc 
 fetch first 1 row only ;
