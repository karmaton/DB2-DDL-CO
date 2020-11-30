with dbcfg as ( select int(value) as logfilsiz
 from sysibmadm.dbcfg where name = 'logfilsiz' )

select 
 logfilsiz * 4 as log_size_kb,
 log_writes, 
 (log_writes - num_log_part_page_io ) * 4 as logged_data_kb,
 ((log_writes - num_log_part_page_io ) / logfilsiz ) + 1 as logs_produced
 
 from dbcfg, table ( mon_get_transaction_log (-1) ) as ldata 
; 

select 
 (total_log_available + total_log_used) / 1024 as active_log_kb , 
 (tot_log_used_top / 1024 ) as maxused_log_kb ,
 (100 * tot_log_used_top / (total_log_available + total_log_used) ) as max_log_full_pct,
 num_log_buffer_full  

from table ( mon_get_transaction_log (-1) ) as ldata 
;
