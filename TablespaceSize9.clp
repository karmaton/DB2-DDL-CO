select substr(tbsp_name,1,30) as "Tablespace Name", tbsp_type as "Type",
       substr(tbsp_state,1,20) as "Status",
       (tbsp_total_size_kb / 1024 ) as "Size (Meg)",
        smallint((float(tbsp_free_size_kb) / float(tbsp_total_size_kb))*100)
                as "% Free Space",
        int((tbsp_free_size_kb) / 1024 )
                as "Meg Free Space"
from sysibmadm.tbsp_utilization 
;

