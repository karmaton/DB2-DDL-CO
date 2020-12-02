 select name as CFG_option, varchar(value,30)  as configured_value  from sysibmadm.dbcfg
 where name in ('sheapthres_shr','sortheap','util_heap_sz','dft_table_org','self_tuning_mem','num_ioservers')
order by name  
;  
