echo Class Setup
echo TP1 database Setup Time: several minutes.
echo Are you sure, you want to drop and recreate the TP1 database?
read

echo Create DB TP1
db2 -tvf tp1credb
db2 CONNECT TO TP1
db2 -tvf tp1tspace.ddl
echo Create Tables
db2 -tvf tp1tables.ddl
echo Create SYSTOOLSPACE and INGEST tables
db2 -tvf cr_toolspace.ddl

echo Create Indexes
db2 -tvf tp1index.ddl
db2 terminate
db2 connect to tp1
db2 bind ./tp1load.bnd qualifier inst464
echo Load Data into test tables
tp1load 10
echo Perform runstats on the tables
db2 -v RUNSTATS ON TABLE inst464.ACCT   AND INDEXES ALL
db2 -v RUNSTATS ON TABLE inst464.BRANCH AND INDEXES ALL
db2 -v RUNSTATS ON TABLE inst464.TELLER AND INDEXES ALL
db2 -v RUNSTATS ON TABLE inst464.HISTORY AND INDEXES ALL
echo Bind SQLTP1ST application 
db2 CONNECT TO TP1
db2 bind $HOME/bin/sqltp1st.bnd qualifier inst464
db2 TERMINATE
db2 backup db tp1 to /home/inst464/saved/startdb compress 
echo Clear Active logs 
rm -R /dblogs/inst464/* 
rmdir /dblogs/inst464
mkdir /dblogs/inst464
mkdir /dblogs/inst464/tp1

echo Clear Archive logs 
rm -R /home/inst464/archive/* 
rmdir /home/inst464/archive
mkdir /home/inst464/archive
db2 -tvf /home/inst464/saved/cfg_lab2.ddl 

echo Start archive logging
db2 -v update db cfg for tp1 using logarchmeth1 disk:/home/inst464/archive 

echo Create required backup
db2 backup db tp1 to /home/inst464/saved/bk_work compress
db2 connect to tp1 
db2 -v update db cfg for tp1 using logarchcompr1 ON
db2 -tf /home/inst464/bin/longtran.ddl 

ls -Rl /home/inst464/archive
echo show database configuration 
db2 -tvf /home/inst464/bin/dbcfgoptions.sql 

echo TP1 database is ready for Course Exercises




