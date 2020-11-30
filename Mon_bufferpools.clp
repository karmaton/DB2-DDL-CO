select substr(bp_name,1,30) as bp_name ,
data_hit_ratio_percent,    
index_hit_ratio_percent ,
    prefetch_ratio_percent 
from sysibmadm.mon_bp_utilization  
 where bp_name not like 'IBMSYSTEM%' ;

