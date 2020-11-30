select 
 db_status, db_conn_time , 
 connections_top, 
 agents_top, 
 pool_temp_data_l_reads as db_tempdata_lreads,
 pool_temp_data_p_reads as db_tempdata_preads,
 total_sorts,
 total_section_sort_time,
 sort_overflows
 from table (MON_GET_DATABASE(-1)) AS mdb ; 
 
