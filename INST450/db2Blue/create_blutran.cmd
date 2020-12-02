# Create BLUTRAN database DB2 10.5.4 version
#
db2 -v drop db BLUTRAN
echo "Creating the database... this will take a few minutes..."
db2 -v "create db BLUTRAN on /dbauto/path1  dbpath on /database"
db2 connect to BLUTRAN
db2 update db cfg for blutran using logprimary 5 dft_table_org row
db2 " call SYSINSTALLOBJECTS('INGEST','C',NULL,NULL)  "
echo "Create tablespaces and transaction tables"
db2 -tvf tspace.ddl 
db2 -tvf tablestran.ddl 
echo "Load transaction tables"
db2 -tvf loadrowtabs.ddl 
echo "configure database and create backup"
db2 update db cfg using logarchmeth1 disk:/home/inst450/archive
db2 terminate
db2 backup db blutran to /home/inst450/backups compress
db2 connect to blutran 
db2 list tables for schema roworg 
# 



