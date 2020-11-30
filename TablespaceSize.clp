select substr(tbsp_name,1,30) as "Tablespace Name", tbsp_type as "Type",
       substr(tbsp_state,1,20) as "Status",
       (tbsp_total_size_kb / 1024 ) as "Size (Meg)",
        ( 100 - tbsp_utilization_percent )
                as "% Free Space",
        ((( 100 - tbsp_utilization_percent ) * tbsp_usable_size_kb) / 100000 )
                as "Meg Free Space"
from sysibmadm.mon_tbsp_utilization 
;

