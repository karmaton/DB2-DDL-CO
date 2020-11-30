-- Create New tablespaces, tables and indexes
                                                                                                                             
CREATE BUFFERPOOL CLPBUFFL SIZE 5000 ;
                                                                                                                             
CREATE BUFFERPOOL CLPBUFFS SIZE 100 ;
                                                                                                                             
CREATE  USER TEMPORARY  TABLESPACE USERTEMP ;
                                                                                                                             
CREATE REGULAR TABLESPACE clpmTSP1
    MANAGED BY DATABASE USING (file 'DMSclpm1' 8000, FILE 'DMSCLPM2' 8000 )
    EXTENTSIZE 8 bufferpool clpbuffl PREFETCHSIZE AUTOMATIC NO FILE SYSTEM CACHING ;
                                                                                                                             
CREATE REGULAR TABLESPACE clpmTSP2
    MANAGED BY DATABASE USING (FILE 'DMSclpm3' 8000, FILE 'DMSclpm4' 8000)
    EXTENTSIZE 8 bufferpool clpbuffs PREFETCHSIZE AUTOMATIC  NO FILE SYSTEM CACHING ;
                                                                                                                             
CREATE TABLE clpm.HIST1
 (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL )
 IN clpmTSP1 ;
                                                                                                                             
CREATE TABLE clpm.TELLER
      (TELLER_ID        SMALLINT        NOT NULL,
       TELLER_NAME      CHAR(20)        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       TELLER_CODE      CHAR(2)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN clpmtsp2;

CREATE INDEX clpm.HIST1IX1 ON clpm.HIST1 (ACCT_ID) cluster      ;
                                                                                                                             
CREATE INDEX clpm.HIST1IX2 ON clpm.HIST1 (BRANCH_ID,TELLER_ID) ;
                                                                                                                             
                                                                                                                             
CREATE TABLE clpm.HIST2 LIKE clpm.HIST1 IN clpmTSP2 ;
                                                                                                                             
CREATE INDEX clpm.HIST2IX1 ON clpm.HIST2 (ACCT_ID) ;
CREATE INDEX clpm.HIST2IX2 ON clpm.HIST2 (BRANCH_ID,TELLER_ID) ;

