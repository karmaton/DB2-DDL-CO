select substr(bp_name,1,15) as bp_name,
  total_physical_reads, data_physical_reads, index_physical_reads
    from sysibmadm.mon_bp_utilization where bp_name not like 'IBMSYSTEM%' ;

select substr(bp_name,1,15) as bp_name,
  total_writes,
  sync_writes_percent 
  from sysibmadm.mon_bp_utilization where bp_name not like 'IBMSYSTEM%';
