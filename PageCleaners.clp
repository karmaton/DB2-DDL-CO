 with db_snap as 
 ( select
  float(pool_drty_pg_steal_clns)  as pg_steal , 
  float(pool_drty_pg_thrsh_clns) as chg_pg_thrsh , 
  float(pool_lsn_gap_clns)  as softmax , 
  float(pool_drty_pg_steal_clns  +   pool_drty_pg_thrsh_clns +
  pool_lsn_gap_clns)   as total_clns 
  from sysibmadm.snapdb  )

 select 
   dec(( pg_steal / total_clns) * 100 ,4,1 ) as "% Steals ",  
   dec(( chg_pg_thrsh / total_clns) * 100 ,4,1 ) as "% Threshold ",  
   dec(( softmax  / total_clns) * 100 ,4,1 ) as "% Softmax  "
   from db_snap ;
 
