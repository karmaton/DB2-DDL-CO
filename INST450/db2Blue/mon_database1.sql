select 
 rows_read,
 rows_returned,
 total_sorts,
 sort_overflows,
 total_hash_joins,
 hash_join_overflows,
 pool_col_l_reads,
 total_col_time, 
 total_hash_grpbys,
 hash_grpby_overflows,
 sort_shrheap_top
 from table(mon_get_database(-1))  ;

