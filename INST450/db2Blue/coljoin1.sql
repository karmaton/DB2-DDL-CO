-------------
--#SET ROWS_OUT 5
--#SET PERF_DETAIL 1
--
--#COMMENT QUERY 4
--
set current explain mode yes;
SELECT HISTORY.TELLER_ID, sum(HISTORY.BALANCE) as total_balance, TELLER.TELLER_NAME , count(*) as transactions  
  FROM COLORG.HISTORY AS HISTORY, COLORG.TELLER AS TELLER
   WHERE HISTORY.TELLER_ID = TELLER.TELLER_ID
    and history.teller_id between 10 and 120
   GROUP BY HISTORY.TELLER_ID, TELLER.TELLER_NAME     
   order by 4 desc ;

set current explain mode no;


