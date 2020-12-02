select 
  varchar(tabschema,12) as schema,
  varchar(tabname,12) as table, 
  card,
  tableorg,
  npages,
  fpages,
  mpages,
  pctpagessaved
  from syscat.tables where tabschema in ('COLORG','ROWORG') 
  order by tabname ;
  
