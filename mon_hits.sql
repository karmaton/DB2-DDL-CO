

SELECT data_hit_ratio_percent, 
 index_hit_ratio_percent , 
 sync_writes_percent, bp_name
  from sysibmadm.mon_bp_utilization where bp_name not like 'IBMSYSTEM%'  
  order by bp_name ;


