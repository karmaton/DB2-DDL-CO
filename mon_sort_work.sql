select  varchar(workload_name,25)  as workload , 
 total_section_sorts , sort_overflows, 
 post_shrthreshold_sorts, 
 total_section_sort_time, 
 total_section_sort_proc_time,
 pool_temp_data_l_reads 
 from table(mon_get_workload('SYSDEFAULTUSERWORKLOAD',-1) )  
  ;
