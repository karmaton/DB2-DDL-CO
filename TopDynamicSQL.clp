-- Top five sorted by Number of Total Time
select num_executions as "Num Execs",
                total_act_time  as total_time, 
                (total_act_time / num_executions ) as "Avg Time (msec)",
                total_sorts as "Num Sorts",
                (total_sorts / num_executions ) as "Sorts Per Stmt", 
                total_section_sort_time, 
                substr(stmt_text,1,35) as "SQL Stmt"
from  table ( MON_GET_PKG_CACHE_STMT('d',NULL,NULL,-1)) as dyn_cache
where num_executions > 0 and total_routine_time = 0 
order by 2 desc
fetch first 5 rows only;
-- Top five sorted by Average Time
select num_executions as "Num Execs",
                total_act_time  as total_time, 
                (total_act_time / num_executions ) as "Avg Time (msec)",
                total_sorts as "Num Sorts",
                (total_sorts / num_executions ) as "Sorts Per Stmt",
                total_section_sort_time,
                substr(stmt_text,1,35) as "SQL Stmt"
from  table ( MON_GET_PKG_CACHE_STMT('d',NULL,NULL,-1)) as dyn_cache
where num_executions > 0 and total_routine_time = 0 

order by 3 desc
fetch first 5 rows only;

                                                                                

