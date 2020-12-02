
INGEST SET COMMIT_COUNT 1000 ;

ingest from file transfile.del format delimited 
(  $key_acct integer external, 
   $data_bal decimal (15,2) external ) messages colingest2.txt restart off 
 update colorg.acct 
 set balance = $data_bal 
 where acct_id = $key_acct ;

select 
varchar(tabname,12) as table,
varchar(tabschema,12) as schema,
rows_read, rows_updated, rows_inserted, rows_deleted,
table_scans,
object_data_l_reads as data_l_reads, 
object_col_l_reads as column_l_reads

from table(mon_get_table(NULL,NULL,-2)) as t1 
where tabschema IN ('COLORG','ROWORG') 
 or (tabschema = 'SYSIBM' and tabname like 'SYN%') 
order by tabname ;


