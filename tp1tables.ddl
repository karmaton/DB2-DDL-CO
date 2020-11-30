--  Create TP1 Tables
CONNECT TO TP1;

CREATE TABLE ACCT
      (ACCT_ID          INT             NOT NULL,
       NAME             CHAR(20)        NOT NULL,
       ACCT_GRP         SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TP1acctd INDEX IN TP1ACCTI COMPRESS YES;
ALTER TABLE ACCT PCTFREE 10;

CREATE TABLE BRANCH
      (BRANCH_ID        SMALLINT        NOT NULL,
       BRANCH_NAME      CHAR(20)        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       AREA_CODE        CHAR(4)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TP1SMALL;

CREATE TABLE TELLER
      (TELLER_ID        SMALLINT        NOT NULL,
       TELLER_NAME      CHAR(20)        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       TELLER_CODE      CHAR(2)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TP1SMALL;

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
       IN TP1HIST;

