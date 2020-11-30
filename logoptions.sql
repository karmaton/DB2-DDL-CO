connect to tp1; 

select name, substr(value,1,40) as value 
 from sysibmadm.dbcfg where name like 'log%' ;


