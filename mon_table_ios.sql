select 
varchar(tabname,12) as table,
rows_read,
table_scans,
object_data_l_reads as data_l_reads, 
object_data_p_reads as data_p_reads 

from table(mon_get_table('INST464',NULL,-1)) as t1 ;

