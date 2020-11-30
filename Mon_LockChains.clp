select substr(lw.hld_application_name,1,10) as "Hold App",
        substr(lw.hld_userid,1,10) as "Holder",
        substr(lw.req_application_name,1,10) as "Wait App",
        substr(lw.req_userid,1,10) as "Waiter",
        lw.lock_mode , 
        lw.lock_object_type , 
        substr(lw.tabname,1,10) as "TabName",
        substr(lw.tabschema,1,10) as "Schema",
        lw.lock_wait_elapsed_time 
                as "waiting (s)"
from 
  sysibmadm.mon_lockwaits lw ; 

