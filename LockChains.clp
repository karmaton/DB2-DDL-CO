select substr(ai_h.appl_name,1,10) as "Hold App",
        substr(ai_h.primary_auth_id,1,10) as "Holder",
        substr(lw.appl_name,1,10) as "Wait App",
        substr(lw.authid,1,10) as "Waiter",
        lw.lock_mode , 
        lw.lock_object_type , 
        substr(lw.tabname,1,10) as "TabName",
        substr(lw.tabschema,1,10) as "Schema",
        timestampdiff(2,char(lw.snapshot_timestamp - lw.lock_wait_start_time))
                as "waiting (s)"
from 
  sysibmadm.lockwaits lw ,
  sysibmadm.snapappl_info ai_h
where 
 lw.agent_id_holding_lk = ai_h.agent_id ;

