select 
 application_handle, 
 lock_name, 
 varchar(lock_object_type,10) as object_type,
 lock_mode,
 lock_status 
 from table(MON_GET_LOCKS( NULL, -1)) AS monlocks 
 where lock_object_type in ('TABLE','ROW')
 order by application_handle  ;
