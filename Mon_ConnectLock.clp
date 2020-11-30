Select substr(conn.application_name,1,10) as Application,
        substr(conn.system_auth_id,1,10) as AuthID,
        conn.num_locks_held as "# Locks",
        conn.lock_escals as "Escalations",
        conn.lock_timeouts as "Lock Timeouts",
        conn.deadlocks as "Deadlocks",
        (conn.lock_wait_time / 1000) as "Lock Wait Time"
from    table(MON_GET_CONNECTION(NULL,-1)) as conn ;

