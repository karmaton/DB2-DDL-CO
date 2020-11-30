select 
 'ROLLFORWARD DATABASE TP1 TO END OF LOGS TABLESPACE ONLINE RECOVER DROPPED TABLE ',
 backup_id, 'TO /home/inst491/histdrop  #' 
 from sysibmadm.db_history 
 where operation = 'D' and 
 tabname = 'HISTDROP' ;
