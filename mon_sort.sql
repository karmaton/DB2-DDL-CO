select  varchar(application_name,20)  as appl_name , 
 total_sorts , sort_overflows, 
 total_section_sort_time, 
 total_section_sort_proc_time,
 pool_temp_data_l_reads 
 from table(mon_get_connection(NULL,-1) )  
  ;
