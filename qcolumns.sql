select 
 colno,
 varchar(colname,20) as colname,
 varchar(tabname,20) as tabname,
 colcard,
 pctencoded 
 from syscat.columns
 where tabschema = 'TEST' and TABNAME in ('ACCT','HISTORY') 
 order by tabname,colno ;

