select substr(bp_name,1,30) as bp_name ,
pool_data_l_reads, pool_data_p_reads,
 (100 * (pool_data_l_reads -  pool_data_p_reads )) /( pool_data_l_reads  ) as data_hit_pct,
pool_index_l_reads,pool_index_p_reads , 
  (100 * (pool_index_l_reads -  pool_index_p_reads )) /( pool_index_l_reads  ) as index_hit_pct

from table (mon_get_bufferpool(NULL,-2) ) as tbuff   
 where bp_name not like 'IBMSYSTEM%'  
 and pool_data_l_reads > 0 and pool_index_l_reads > 0 ;

