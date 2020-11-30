select  substr(tabname,1,12) as table_name,
available , data_object_p_size  
from sysibmadm.admintabinfo 
where 
tabname in ('ACCTNREC','ACCTCYES','ACCTCNO') 
and tabschema = USER ;
 
