select 
substr(tbsp_name,1,20) as tbsp_name, tbsp_id,  
tablespace_min_recovery_time ,
substr(tbsp_state,1,40) as tbsp_state
from table (mon_get_tablespace ('TP1HIST', -1)) AS TSQ ;

