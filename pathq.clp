 select 
 substr(type,1,20) as type  , 
 substr(path,1,50) as path 
 from sysibmadm.dbpaths order by type ;
