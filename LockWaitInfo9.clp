select  
 substr(ai.appl_name,1,20) as appl_name ,
 substr(ai.primary_auth_id,1,10) as auth_id ,
 ap.lock_waits as lock_waits, 
 ap.lock_wait_time / 1000 as "Total Wait (s)", 
 (ap.lock_wait_time / ap.lock_waits ) as "Avg Wait (ms)"

 from sysibmadm.snapappl_info ai, sysibmadm.snapappl ap
 where ai.agent_id = ap.agent_id 
 and ap.lock_waits > 0 ; 

