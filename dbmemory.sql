select varchar(memory_pool_type,25) as memory_pool, memory_pool_id,  
 memory_pool_used ,
 memory_pool_used_hwm  
 from table (mon_get_memory_pool('DATABASE','DB2BLU',-1)) as m1 
order by memory_pool_id ;

