select 
substr(tbsp_name,1,12) as tbsp_name, tbsp_id,  
tablespace_min_recovery_time , tbsp_used_pages 
from table (mon_get_tablespace ('TSDROP', -1)) AS TSQ ;
