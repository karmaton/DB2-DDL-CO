
set current degree 'ANY';

set current explain mode YES;
set current maintained table types for optimization USER ;
set current refresh age ANY ;



SELECT HISTORY.BRANCH_ID, sum(HISTORY.balance) as br_balance, count(*) as br_trans 
   FROM COLORG.HISTORYC AS HISTORY
   WHERE HISTORY.BRANCH_ID between 10 and 20
   GROUP BY HISTORY.BRANCH_ID
   ORDER BY HISTORY.BRANCH_ID ASC ;
set current explain mode no;
