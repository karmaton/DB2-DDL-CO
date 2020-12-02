select 
 varchar(tabname,20) as tabname,
 card, npages,mpages,
 pctpagessaved 
 from syscat.tables 
 where tabschema='TEST' ;

