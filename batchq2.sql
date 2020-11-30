-------------
--#SET ROWS_OUT 2
--#SET PERF_DETAIL 0
--#BGBLK 20
--#COMMENT queries using clpm.hist2
SELECT * from clpm.hist2 order by balance desc ;
                                                                                                                             
SELECT * from clpm.hist2 where
 acct_id between 10000 and 25000 ;
                                                                                                                             
SELECT hist2.ACCT_ID, hist2.TELLER_ID, hist2.BRANCH_ID, hist2.BALANCE, TELLER.TELLER_NAME, TELLER.BRANCH_ID, TELLER.BALANCE  FROM CLPM.hist2 AS hist2, CLPM.TELLER AS TELLER   WHERE hist2.TELLER_ID = TELLER.TELLER_ID AND hist2.BRANCH_ID < 30   ORDER BY TELLER.TELLER_NAME ASC ;

--#EOBLK

