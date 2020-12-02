-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--#COMMENT QUERY 4
--
set current explain mode yes;
SELECT ACCT.ACCT_ID, ACCT.NAME, TELLER.TELLER_ID, TELLER.TELLER_NAME,
  TELLER.TELLER_CODE, ACCT.ADDRESS ,
  HISTORY.BRANCH_ID, HISTORY.BALANCE, HISTORY.PID, HISTORY.TEMP
   FROM roworg.ACCT AS ACCT, roworg.TELLER AS TELLER, roworg.HISTORY AS HISTORY
   WHERE ACCT.ACCT_ID = HISTORY.ACCT_ID
   AND ACCT.ACCT_GRP BETWEEN 100 AND 200
   AND HISTORY.TELLER_ID = TELLER.TELLER_ID 
   AND HISTORY.BRANCH_ID BETWEEN 40 AND 50
   ORDER BY HISTORY.PID ASC ;
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

