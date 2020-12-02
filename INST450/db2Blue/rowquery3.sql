-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--#COMMENT QUERY 3
--
set current explain mode yes;
SELECT HISTORY.TELLER_ID, sum(HISTORY.BALANCE) as total_balance, TELLER.TELLER_NAME , count(*) as transactions  
  FROM ROWORG.HISTORY AS HISTORY, ROWORG.TELLER AS TELLER
   WHERE HISTORY.TELLER_ID = TELLER.TELLER_ID
    and HISTORY.teller_id between 10 and 100
   GROUP BY HISTORY.TELLER_ID, TELLER.TELLER_NAME 
    
   order by 4 desc ;
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

