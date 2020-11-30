-- Create Application tablespaces
CONNECT TO TP1;
-- Create Objects
CREATE  STOGROUP TP1SG1 ON '/dbauto/path2' ;
CREATE TABLESPACE TP1SMALL
    USING STOGROUP TP1SG1 INITIALSIZE 4M
    EXTENTSIZE 4 ;
    
CREATE Bufferpool TP1H16K IMMEDIATE  SIZE 1000 PAGESIZE 16 K; 
CREATE TABLESPACE TP1HIST pagesize 16k 
    MANAGED BY DATABASE USING (file 'tp1hist'  5000)
 	EXTENTSIZE 8 AUTORESIZE YES INCREASESIZE 4 M  
        PREFETCHSIZE AUTOMATIC bufferpool tp1h16k  ;
CREATE TABLESPACE TP1acctd
    MANAGED BY DATABASE USING (FILE 'tp1acctd' 20000)
    EXTENTSIZE 64 PREFETCHSIZE 64  autoresize yes ;
CREATE TABLESPACE TP1accti
    USING STOGROUP TP1SG1 INITIALSIZE 20M INCREASESIZE 5M
    EXTENTSIZE 8 PREFETCHSIZE 8  ;
CONNECT RESET;
TERMINATE;
