select 
substr(tbsp_name,1,24) as tbsp_name, tbsp_id,  
tbsp_min_recovery_time 
from sysibmadm.snaptbsp_part 
where tbsp_name = 'USERSPACE1' ;
