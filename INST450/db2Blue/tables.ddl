set current schema = 'COLORG' ;
CREATE TABLE ACCT
      (ACCT_ID          INT             NOT NULL,
       NAME             CHAR(20)        NOT NULL,
       ACCT_GRP         SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TSCOLD INDEX IN TSCOLI;

CREATE TABLE BRANCH
      (BRANCH_ID        SMALLINT        NOT NULL,
       BRANCH_NAME      CHAR(20)        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       AREA_CODE        CHAR(4)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TSCOLD INDEX IN TSCOLI;

CREATE TABLE TELLER
      (TELLER_ID        SMALLINT        NOT NULL,
       TELLER_NAME      CHAR(20)        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       TELLER_CODE      CHAR(2)         NOT NULL,
       ADDRESS          CHAR(30)        NOT NULL,
       TEMP             CHAR(40)        NOT NULL)
       IN TSCOLD INDEX IN TSCOLI;



