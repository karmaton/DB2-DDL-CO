with dbcfg1 as 
( select int(value)  as pckcachesz from sysibmadm.dbcfg where name = 'pckcachesz' ) 
 
select pckcachesz as "Package Cache Size" ,
    pkg_cache_lookups as "Lookups", 
    pkg_cache_inserts as "Inserts" ,
    pkg_cache_num_overflows as "Overflows"  
      
from dbcfg1, TABLE (MON_GET_DATABASE(-1)) AS MONDB ;
