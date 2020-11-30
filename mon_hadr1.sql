select 

 hadr_role, standby_id, hadr_state, primary_log_file, standby_log_file 

from table(mon_get_hadr(-2) ) as mhadr ;

