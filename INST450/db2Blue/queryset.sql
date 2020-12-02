-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--
SELECT HISTORY.BRANCH_ID, sum(HISTORY.balance) as br_balance, count(*) as br_trans 
   FROM ROWORG.HISTORY AS HISTORY
   WHERE HISTORY.BRANCH_ID between 10 and 20
   GROUP BY HISTORY.BRANCH_ID
   ORDER BY HISTORY.BRANCH_ID ASC ;

SELECT HISTORY.BRANCH_ID, sum(HISTORY.balance) as br_balance, count(*) as br_trans 
   FROM ROWORG.HISTORY AS HISTORY
   WHERE HISTORY.acct_ID between 5000 and 80000
   GROUP BY HISTORY.BRANCH_ID
   ORDER BY HISTORY.BRANCH_ID ASC ;

SELECT HISTORY.BRANCH_ID, sum(HISTORY.balance) as br_balance, count(*) as br_trans 
   FROM ROWORG.HISTORY AS HISTORY
   where branch_id between 10 and 20 and teller_id > 800
   GROUP BY HISTORY.BRANCH_ID
   ORDER BY HISTORY.BRANCH_ID ASC ;

SELECT Teller.TELLER_ID, sum(HISTORY.BALANCE) as total_balance, TELLER.TELLER_NAME , count(*) as transactions  
  FROM ROWORG.HISTORY AS HISTORY, ROWORG.TELLER AS TELLER
   WHERE HISTORY.TELLER_ID = TELLER.TELLER_ID
    and teller.teller_id between 10 and 30
   GROUP BY TELLER.TELLER_ID, TELLER.TELLER_NAME ;

SELECT ACCT.ACCT_ID, ACCT.NAME, TELLER.TELLER_ID, TELLER.TELLER_NAME,
  TELLER.TELLER_CODE, ACCT.ADDRESS ,
  HISTORY.BRANCH_ID, HISTORY.BALANCE, HISTORY.PID, HISTORY.TEMP
   FROM roworg.ACCT AS ACCT, roworg.TELLER AS TELLER, roworg.HISTORY AS HISTORY
   WHERE ACCT.ACCT_ID = HISTORY.ACCT_ID
   AND ACCT.ACCT_GRP BETWEEN 100 AND 200
   AND HISTORY.TELLER_ID = TELLER.TELLER_ID 
   AND HISTORY.BRANCH_ID BETWEEN 40 AND 50
   ORDER BY HISTORY.PID ASC ;

select varchar(tabname,12) as table, 
rows_read, table_scans, num_columns_referenced, section_exec_with_col_references ,
( num_columns_referenced / section_exec_with_col_references ) as avg_col_references
from table(mon_get_table('ROWORG',NULL,-1)) AS TABS ;
 



