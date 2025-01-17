select
        int(total_log_used/1024/1024) as "Log Used (Meg)",
        int(total_log_available/1024/1024)
                as "Log Space Free (Meg)",
        int((float(total_log_used) /
                float(total_log_used+total_log_available))*100)
                as "Pct Used",
        int(tot_log_used_top/1024/1024) as "Max Log Used (Meg)",
        int(sec_log_used_top/1024/1024) as "Max Sec. Used (Meg)",
        int(sec_logs_allocated) as "Secondaries"
from table (MON_GET_TRANSACTION_LOG(-2)) as tlogs  ;

