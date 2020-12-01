load from hist200k.del of del
messages rowload1.msg replace into MEM.COLHIST
nonrecoverable ;

select varchar(memory_pool_type,25) as memory_pool, memory_pool_id,  
 memory_pool_used ,
 memory_pool_used_hwm  
 from table (mon_get_memory_pool('DATABASE','TP1',-1)) as m1 
where memory_pool_type='UTILITY'  ;
