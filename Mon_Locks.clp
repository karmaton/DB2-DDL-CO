select 
 application_handle, 
 varchar(lock_object_type,10) as object_type,
 lock_mode,
 lock_status,
 count(*) as lock_count
  
 from table(MON_GET_LOCKS( NULL, -1)) AS monlocks 
 where lock_object_type in ('TABLE','ROW') 
 group by application_handle,lock_object_type,lock_mode,lock_status
 order by application_handle,lock_object_type,lock_mode,lock_status  ;
