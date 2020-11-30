select  
 substr(conn.application_name,1,20) as appl_name ,
 substr(conn.session_auth_id,1,10) as auth_id ,
 conn.lock_waits as lock_waits, 
 conn.lock_wait_time / 1000 as "Total Wait (s)", 
 (conn.lock_wait_time / conn.lock_waits ) as "Avg Wait (ms)"

 from  table (MON_GET_CONNECTION (NULL,-1)) as conn
 where conn.lock_waits > 0 ; 
