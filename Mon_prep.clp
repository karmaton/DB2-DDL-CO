select num_executions,
 stmt_exec_time as total_exec_time, 
 (stmt_exec_time / num_executions ) as Avg_exec_time, 
 prep_time , 
 ( ( 100 * prep_time ) / ( stmt_exec_time / num_executions) )  as pct_prep, 
 substr(stmt_text,1,40) as "SQL_Text" 
 from TABLE (MON_GET_PKG_CACHE_STMT('d',NULL,NULL,-1)) as dyn_cache
 where stmt_exec_time > 1000
 order by prep_time  desc  ;

