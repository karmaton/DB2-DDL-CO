select 
varchar(tabname,50) as table,
varchar(tabschema,12) as schema,
rows_read, rows_updated, rows_inserted, rows_deleted,
table_scans,
object_data_l_reads as data_l_reads, 
object_col_l_reads as column_l_reads

from table(mon_get_table(NULL,NULL,-2)) as t1 
where tabschema IN ('COLORG','ROWORG') 
 or (tabschema = 'SYSIBM' and tabname like 'SYN%') 
order by tabname ;

