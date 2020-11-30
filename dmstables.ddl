-- Create New DMS tablespace FOR DMS MANAGEMENT

CREATE REGULAR TABLESPACE DMSMTSPD
    MANAGED BY DATABASE USING (FILE 'DMSCONT1' 4000, FILE 'DMSCONT2' 4000)
    EXTENTSIZE 8 PREFETCHSIZE AUTOMATIC NO FILE SYSTEM CACHING ;


CREATE TABLE DMSM.HIST1
 (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL )
       IN DMSMTSPD ;

CREATE INDEX DMSM.HIST1IX1 ON DMSM.HIST1 (ACCT_ID) ;
CREATE INDEX DMSM.HIST1IX2 ON DMSM.HIST1 (BRANCH_ID,TELLER_ID) ;


CREATE TABLE DMSM.HIST2
 (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL )
       IN DMSMTSPD ;
CREATE INDEX DMSM.HIST2IX1 ON DMSM.HIST2 (ACCT_ID) CLUSTER ;

