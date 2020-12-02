-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--#COMMENT QUERY 2
--
set current explain mode yes;
SELECT HISTORY.BRANCH_ID, sum(HISTORY.balance) as br_balance, count(*) as br_trans 
   FROM ROWORG.HISTORY AS HISTORY
   where branch_id between 10 and 30 and teller_id > 800
   GROUP BY HISTORY.BRANCH_ID
   ORDER BY HISTORY.BRANCH_ID ASC ;
set current explain mode no;

--#COMMENT CHECK STATS
SELECT pool_col_l_reads, pool_data_l_reads, pool_index_l_reads , 
  ( pool_col_l_reads + pool_data_l_reads + pool_index_l_reads ) as total_l_reads
   from table(mon_get_connection(null,-1)) as con 
  where application_name = 'db2batch'
 ;

SELECT total_col_time, total_compile_time , pool_read_time, total_cpu_time, total_wait_time
 from table(mon_get_connection(null,-1)) as con 
  where application_name = 'db2batch'
 ;

