--  Create TP1 Tables
CONNECT TO TP1;

CREATE TABLE TEST.BRANCH
      (BRANCH_ID        SMALLINT        NOT NULL primary key,
       BRANCH_NAME      CHAR(20)        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       AREA_CODE        CHAR(4)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TESTSMALL;

CREATE TABLE TEST.TELLER
      (TELLER_ID        SMALLINT        NOT NULL primary key,
       TELLER_NAME      CHAR(20)        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       TELLER_CODE      CHAR(2)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TESTSMALL;

CREATE TABLE TEST.HISTORY1
      (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL)
       IN TESTHIST1;
CREATE INDEX TEST.H1INDEX ON TEST.HISTORY1 (ACCT_ID) ;

CREATE TABLE TEST.HISTORY2
      (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL)
       IN TESTHIST2;
CREATE INDEX TEST.H2INDEX ON TEST.HISTORY2 (ACCT_ID) ;
