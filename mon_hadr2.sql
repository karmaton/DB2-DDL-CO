select 

 hadr_role, standby_id, hadr_state, 
 standby_log_time  ,
 standby_replay_log_time  

from table(mon_get_hadr(-2) ) as mhadr ;

