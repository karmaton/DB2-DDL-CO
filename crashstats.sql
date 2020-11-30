select 
 sum(pool_data_l_reads) as data_Logical_reads,
 sum(pool_data_P_reads) as data_phy_reads, 
 sum(pool_index_l_reads) as index_logical_reads,
 sum(pool_index_p_reads) as index_phy_reads 
 from table(mon_get_bufferpool('',-1)) as monbp ;

select
 sum(pool_data_writes) as data_writes,
 sum(pool_index_writes) as index_writes ,
 sum(pool_read_time) as bp_read_time,
 sum(pool_write_time) as bp_write_time
 from table(mon_get_bufferpool('',-1)) as monbp ;
 
