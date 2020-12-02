
set current explain mode explain;
SELECT HISTORY.TELLER_ID, sum(HISTORY.BALANCE) as total_balance, TELLER.TELLER_NAME , count(*) as transactions  
  FROM COLORG.HISTORY AS HISTORY, COLORG.TELLER AS TELLER
   WHERE HISTORY.TELLER_ID = TELLER.TELLER_ID
    and HISTORY.teller_id between 10 and 100
   GROUP BY HISTORY.TELLER_ID, TELLER.TELLER_NAME 
    
   order by 4 desc ;
set current explain mode no;


