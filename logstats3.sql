select 
 first_active_log,
 current_active_log,
 current_archive_log,
 last_active_log 
 from table ( mon_get_transaction_log (-1) ) as ldata 
; 
