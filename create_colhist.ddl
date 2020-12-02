set current schema = 'COLORG' ;

CREATE TABLE HISTORY
      (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL)
              organize by row
       IN TSROWD INDEX IN TSROWI;

CREATE INDEX HISTIX1 ON HISTORY (BRANCH_ID ASC)
 ALLOW REVERSE SCANS ;

CREATE INDEX HISTIX2 ON HISTORY (TELLER_ID ASC)
 ALLOW REVERSE SCANS ;
