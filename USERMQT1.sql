-- <ScriptOptions statementTerminator=";" />
CREATE TABLE COLORG.HIST_MQT1 ( ACCT_ID, BRANCH_ID, TELLER_ID, BALANCE ) 
 AS ( SELECT ACCT_ID , BRANCH_ID, TELLER_ID , BALANCE 
 FROM COLORG.HISTORY ) DATA INITIALLY DEFERRED REFRESH DEFERRED
 MAINTAINED BY USER ORGANIZE BY COLUMN IN TSCOLD;

SET INTEGRITY FOR COLORG.HIST_MQT1 ALL IMMEDIATE UNCHECKED;
