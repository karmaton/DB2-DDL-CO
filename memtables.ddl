-- Create New Auto Storage tablespace and tables 

CREATE TABLESPACE MEMTSPD USING STOGROUP TP1SG1
    INITIALSIZE 20M INCREASESIZE 10 PERCENT 
    EXTENTSIZE 8  ;


CREATE TABLE MEM.ROWHIST
 (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL ) ORGANIZE BY ROW
       IN MEMTSPD ;

CREATE INDEX MEM.ROWHISTIX1 ON MEM.ROWHIST (ACCT_ID) ;
CREATE INDEX MEM.ROWHISTIX2 ON MEM.ROWHIST (BRANCH_ID,TELLER_ID) ;


CREATE TABLE MEM.COLHIST
 (ACCT_ID          INTEGER         NOT NULL,
       TELLER_ID        SMALLINT        NOT NULL,
       BRANCH_ID        SMALLINT        NOT NULL,
       BALANCE          DECIMAL(15,2)   NOT NULL,
       DELTA            DECIMAL(9,2)    NOT NULL,
       PID              INTEGER         NOT NULL,
       TSTMP            TIMESTAMP       NOT NULL WITH DEFAULT,
       ACCTNAME         CHAR(20)        NOT NULL,
       TEMP             CHAR(6)         NOT NULL ) ORGANIZE BY COLUMN
       IN MEMTSPD ;


