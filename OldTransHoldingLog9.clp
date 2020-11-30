select substr(ai.appl_status,1,20) as "Status",
        substr(ai.primary_auth_id,1,10) as "Authid",
        substr(ai.appl_name,1,15) as "Appl Name",
        int(ap.UOW_LOG_SPACE_USED/1024/1024) as "Log Used (M)",
        int(ap.appl_idle_time/60) as "Idle for (min)",
        ap.appl_con_time as "Connected Since"
from  sysibmadm.snapdb   db, 
    sysibmadm.snapappl ap, 
    sysibmadm.snapappl_info ai
where ai.agent_id = db.APPL_ID_OLDEST_XACT
and ap.agent_id = ai.agent_id ;

