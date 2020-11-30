-- This CLP file was created using DB2LOOK Version "11.1" 
-- Timestamp: mar 10 nov 2020 21:07:50 CET
-- Database Name: MUSICDB        
-- Database Manager Version: DB2/LINUXX8664 Version 11.1.0 
-- Database Codepage: 1208
-- Database Collating Sequence is: IDENTITY
-- Alternate collating sequence(alt_collate): null
-- varchar2 compatibility(varchar2_compat): OFF


CONNECT TO MUSICDB;

------------------------------------------------
-- DDL Statements for Schemas
------------------------------------------------

-- Running the DDL below will explicitly create a schema in the
-- new database that corresponds to an implicitly created schema
-- in the original database.

CREATE SCHEMA "MUSIC   ";



------------------------------------------------
-- DDL Statements for Table "MUSIC   "."ALBUMS"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."ALBUMS"  (
		  "TITLE" VARCHAR(50 OCTETS) , 
		  "ARTNO" SMALLINT NOT NULL , 
		  "ITEMNO" SMALLINT NOT NULL )   
		 IN "TSP04" INDEX IN "TSP05"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "MUSIC   "."ALBUMS"

ALTER TABLE "MUSIC   "."ALBUMS" 
	ADD PRIMARY KEY
		("ITEMNO");


------------------------------------------------
-- DDL Statements for Table "MUSIC   "."CONCERTS"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."CONCERTS"  (
		  "ARTNO" SMALLINT NOT NULL , 
		  "DATE" DATE NOT NULL , 
		  "CITY" VARCHAR(25 OCTETS) NOT NULL WITH DEFAULT  )   
		 IN "TSP04"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "MUSIC   "."REORDER"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."REORDER"  (
		  "ITEMNO" SMALLINT NOT NULL , 
		  "TIMESTAMP" TIMESTAMP )   
		 IN "TSP02"  
		 ORGANIZE BY ROW; 





------------------------------------------------
-- DDL Statements for Table "MUSIC   "."ARTISTS"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."ARTISTS"  (
		  "ARTNO" SMALLINT NOT NULL , 
		  "NAME" VARCHAR(50 OCTETS) , 
		  "CLASSIFICATION" CHAR(1 OCTETS) NOT NULL , 
		  "BIO" CLOB(102400 OCTETS) LOGGED COMPACT , 
		  "PICTURE" BLOB(512000) NOT LOGGED COMPACT )   
		 IN "TSP01" INDEX IN "TSP02" LONG IN "TSP03"  
		 ORGANIZE BY ROW; 


-- DDL Statements for Primary Key on Table "MUSIC   "."ARTISTS"

ALTER TABLE "MUSIC   "."ARTISTS" 
	ADD PRIMARY KEY
		("ARTNO");


------------------------------------------------
-- DDL Statements for Table "MUSIC   "."STOCK"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."STOCK"  (
		  "ITEMNO" SMALLINT NOT NULL , 
		  "TYPE" CHAR(1 OCTETS) NOT NULL , 
		  "PRICE" DECIMAL(5,2) NOT NULL WITH DEFAULT  , 
		  "QTY" INTEGER NOT NULL WITH DEFAULT  , 
		  "SYS_START" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN GENERATED ALWAYS AS ROW BEGIN , 
		  "SYS_END" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN GENERATED ALWAYS AS ROW END , 
		  "TX_START" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN GENERATED ALWAYS AS TRANSACTION START ID , 
		 PERIOD SYSTEM_TIME ("SYS_START","SYS_END") )   
		 IN "TSP06"  
		 ORGANIZE BY ROW; 






-- DDL Statements for Indexes on Table "MUSIC   "."STOCK"

SET NLS_STRING_UNITS = 'SYSTEM';

CREATE INDEX "MUSIC   "."STOCKITEM_IX" ON "MUSIC   "."STOCK" 
		("ITEMNO" ASC)
		
		COMPRESS NO 
		INCLUDE NULL KEYS ALLOW REVERSE SCANS;
------------------------------------------------
-- DDL Statements for Table "MUSIC   "."STOCK_HISTORY"
------------------------------------------------
 

CREATE TABLE "MUSIC   "."STOCK_HISTORY"  (
		  "ITEMNO" SMALLINT NOT NULL , 
		  "TYPE" CHAR(1 OCTETS) NOT NULL , 
		  "PRICE" DECIMAL(5,2) NOT NULL WITH DEFAULT 0.0 , 
		  "QTY" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "SYS_START" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN , 
		  "SYS_END" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN , 
		  "TX_START" TIMESTAMP(12) NOT NULL IMPLICITLY HIDDEN )   
		 IN "TSP06"  
		 ORGANIZE BY ROW; 





--------------------------------------------------------------
-- DDL Statements for system-period temporal table "MUSIC   "."STOCK"
--------------------------------------------------------------

ALTER TABLE "MUSIC   "."STOCK" 
	ADD VERSIONING USE HISTORY TABLE "MUSIC   "."STOCK_HISTORY";

-- DDL Statements for Foreign Keys on Table "MUSIC   "."ALBUMS"

ALTER TABLE "MUSIC   "."ALBUMS" 
	ADD CONSTRAINT "ARTNO_FK" FOREIGN KEY
		("ARTNO")
	REFERENCES "MUSIC   "."ARTISTS"
		("ARTNO")
	ON DELETE CASCADE
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Foreign Keys on Table "MUSIC   "."STOCK"

ALTER TABLE "MUSIC   "."STOCK" 
	ADD CONSTRAINT "ITEMNO_FK" FOREIGN KEY
		("ITEMNO")
	REFERENCES "MUSIC   "."ALBUMS"
		("ITEMNO")
	ON DELETE RESTRICT
	ON UPDATE NO ACTION
	ENFORCED
	ENABLE QUERY OPTIMIZATION;

-- DDL Statements for Check Constraints on Table "MUSIC   "."STOCK"

SET NLS_STRING_UNITS = 'SYSTEM';

ALTER TABLE "MUSIC   "."STOCK" 
	ADD CONSTRAINT "CCTYPE" CHECK 
		(TYPE in ('D', 'C', 'R'))
	ENFORCED
	ENABLE QUERY OPTIMIZATION;






----------------------------

-- DDL Statements for Views

----------------------------
SET CURRENT SCHEMA = "INST23  ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","INST23";
create view music.music as select title, classification, name 
from music.albums alb, music.artists art 
where art.artno = alb.artno;

SET CURRENT SCHEMA = "INST23  ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","INST23";
create view music.inventory (type, itemno, totcost, totqty) 
as select type, itemno, sum (price * qty), sum (qty) 
from music.stock group by type, itemno;



-- DDL Statements for Aliases

CREATE ALIAS "MUSIC   "."EMPTYSTOCK" FOR TABLE "MUSIC   "."REORDER";

CREATE ALIAS "MUSIC   "."SINGERS" FOR TABLE "MUSIC   "."ARTISTS";


-------------------------------
-- DDL Statements for Triggers
-------------------------------


SET NLS_STRING_UNITS = 'SYSTEM';
SET CURRENT SCHEMA = "INST23  ";
SET CURRENT PATH = "SYSIBM","SYSFUN","SYSPROC","SYSIBMADM","INST23";
create trigger music.reorder 
after update of qty on music.stock 
referencing new as n 
for each row 
mode db2sql 
when (n.qty <= 5) 
insert into music.reorder values (n.itemno, current timestamp);


COMMIT WORK;

CONNECT RESET;

TERMINATE;

