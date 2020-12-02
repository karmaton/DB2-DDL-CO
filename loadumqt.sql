
declare colhist1 cursor for 
 SELECT BRANCH_ID, TELLER_ID , SUM(BALANCE) AS SBALANCE, COUNT(*) AS SCOUNT  
 FROM COLORG.HISTORY GROUP BY BRANCH_ID, TELLER_ID order by BRANCH_ID, TELLER_ID  ; 

load from colhist1 of cursor  replace into COLORG.HIST_UMQT nonrecoverable ;

runstats on table COLORG.HIST_UMQT and indexes all;

SET INTEGRITY FOR COLORG.HIST_UMQT ALL IMMEDIATE UNCHECKED;

