with bp_snap as (
  select substr(bp_name,1,30) as bp_name , 
  unread_prefetch_pages , 
  pool_async_data_reads + pool_async_index_reads   as Async_Reads ,
  pool_data_p_reads + pool_index_p_reads + 
   pool_temp_data_p_reads + pool_temp_index_p_reads as Total_Reads 
 from  table (MON_GET_BUFFERPOOL(NULL,-1)) as bpdata
   where bp_name not like 'IBMSYSTEM%'
 )
select bp_name, unread_prefetch_pages,  
   dec ( 100 * ( Total_reads - Async_reads ) / Total_reads ,5,2) as "% Synch Reads", 
    dec ( 100 * unread_prefetch_pages  / Total_reads ,5,2) as "% Unread Pages"  
from bp_snap ; 

