select name, substr(value,1,40) as value 
 from sysibmadm.dbcfg  
 order by name;


