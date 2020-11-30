select num_executions, 
 average_execution_time_s , 
 prep_time_ms , 
 prep_time_percent , 
 substr(stmt_text,1,40) as "SQL_Text" 
 from sysibmadm.query_prep_cost
 where average_execution_time_s > 0
 order by prep_time_percent  desc  ;

