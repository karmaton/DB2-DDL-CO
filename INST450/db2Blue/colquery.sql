-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--#COMMENT QUERY 1
--
SELECT acct_id,branch_id,balance from colorg.history where
 acct_id between 10000 and 25000 ;
--
--
--#COMMENT QUERY 2
SELECT acct_id,teller_id,balance from colorg.history where
 acct_id between 10000 and 12000 ;
--
--#COMMENT QUERY 3
SELECT acct_id,branch_id,balance from colorg.history where
 branch_id between 10 and 40 ;


 ;

