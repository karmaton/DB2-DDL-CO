select 
 cmd_text
 from sysibmadm.db_history 
 where operation = 'D' and 
 tabname = 'HISTDROP' ;
