-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 2
--#COMMENT queries using clpm.hist1
SELECT * from clpm.hist1 order by balance desc ;
                                                                                                                             
SELECT * from clpm.hist1 where
  acct_id between 10000 AND 30000 order by branch_id desc ;
                                                                                                                             
SELECT hist1.ACCT_ID, hist1.TELLER_ID, hist1.BRANCH_ID, hist1.BALANCE, TELLER.TELLER_NAME, TELLER.BRANCH_ID, TELLER.BALANCE  FROM CLPM.hist1 AS hist1, CLPM.TELLER AS TELLER   WHERE hist1.TELLER_ID = TELLER.TELLER_ID AND HIST1.BRANCH_ID < 30   ORDER BY TELLER.TELLER_NAME ASC ;

--#SET PAUSE 
SELECT * from clpm.hist1 where
 acct_id between 10000 and 25000 order by branch_id desc ;
