select 
  varchar(t1.indname,30) as index_name,
  varchar(t1.tabname,20) as table_name, 
  t1.indextype,
  varchar(t2.colname,30) as index_column,
  t2.colseq
  from syscat.indexes t1, syscat.indexcoluse t2  
              
  where t1.tabschema = 'TEST' and  
  t1.indname = t2.indname and t1.indschema = t2.indschema
  order by t1.tabname,  t2.colseq 
;


