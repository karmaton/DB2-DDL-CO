select 
varchar(tabname,12) as table,
rows_read,
table_scans,
rows_updated,
rows_inserted
from table(mon_get_table('INST464',NULL,-1)) as t1 ;

