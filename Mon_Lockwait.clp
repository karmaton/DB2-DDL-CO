select 
 req_application_handle as appl_waiting,
 hld_application_handle as appl_holding_lock, 
 varchar(lock_object_type,10) as object_type,
 lock_mode as held_lockmode,
 lock_mode_requested as request_lockmode,
 lock_status,
 lock_escalation
  
 from table(MON_GET_APPL_LOCKWAIT( NULL, -1)) AS monwaits ;

