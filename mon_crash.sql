select 
 log_held_by_dirty_pages, 
 log_to_redo_for_recovery 
 from table(mon_get_transaction_log(-2)) as monlog ;

