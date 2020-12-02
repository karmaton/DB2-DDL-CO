set current schema = 'ROWORG' ;
CREATE TABLE ACCT
      (ACCT_ID          INT             NOT NULL,
       NAME             CHAR(20)        NOT NULL,
       ACCT_GRP         SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       organize by row
       IN TSROWD INDEX IN TSROWI;

alter table acct add primary key (acct_id)  ;

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

CREATE TABLE BRANCH
      (BRANCH_ID        SMALLINT        NOT NULL,
       BRANCH_NAME      CHAR(20)        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       AREA_CODE        CHAR(4)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       organize by row
       IN TSROWD;
alter table branch add primary key (branch_id)  ;

CREATE TABLE TELLER
      (TELLER_ID        SMALLINT        NOT NULL,
       TELLER_NAME      CHAR(20)        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       TELLER_CODE      CHAR(2)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       organize by row
       IN TSROWD;
alter table teller add primary key (teller_id)  ;
