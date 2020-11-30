select 
 start_time as backup_taken_at , substr(location,1,40) as backup_location , 
 substr(tbspnames,1,80) as table_spaces_in_backup
 from sysibmadm.db_history 
 where operation = 'B'  
 order by start_time desc 
 fetch first 1 row only ;
