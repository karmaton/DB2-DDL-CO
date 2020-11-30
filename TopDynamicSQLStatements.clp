select num_executions as "Num Execs",
                average_execution_time_s  as "Avg Time (sec)",
                stmt_sorts as "Num Sorts",
                sorts_per_execution  as "Sorts Per Stmt",
                substr(stmt_text,1,35) as "SQL Stmt"
from  sysibmadm.top_dynamic_sql
where num_executions > 0
order by 1 desc
fetch first 5 rows only;
                                                                                
select num_executions as "Num Execs",
                average_execution_time_s  as "Avg Time (sec)",
                stmt_sorts as "Num Sorts",
                sorts_per_execution  as "Sorts Per Stmt",
                substr(stmt_text,1,35) as "SQL Stmt"
from  sysibmadm.top_dynamic_sql
where num_executions > 0
order by 2 desc
fetch first 5 rows only;

