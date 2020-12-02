select 
varchar(tabname,30) as table,
varchar(tabschema,12) as schema,
rows_read,
object_data_l_reads as data_l_reads, 
object_col_l_reads as column_l_reads,
object_col_p_reads,
object_col_lbp_pages_found
from table(mon_get_table(NULL,NULL,-2)) as t1 
where tabschema = 'COLORG' 
 or (tabschema = 'SYSIBM' and tabname like 'SYN%') 
order by tabschema,tabname ;

select 
varchar(mon.tabname,12) as table,
member,
varchar(cat.indname,30) as IX_Name, 
mon.IID as Index_id,
mon.nleaf,
mon.object_index_l_reads,
mon.object_index_p_reads,
mon.object_index_lbp_pages_found
from table(mon_get_index('COLORG',NULL,-2)) as mon  , 
     SYSCAT.INDEXES as cat 
   where  mon.tabname = cat.tabname 
      and mon.tabschema = cat.tabschema 
      and mon.iid = cat.iid 
   and mon.tabname in ('ACCT','HISTORY','BRANCH','TELLER') 
 order by mon.tabname ;

