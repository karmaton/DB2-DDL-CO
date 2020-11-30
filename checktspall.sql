select 
substr(tbsp_name,1,24) as tbsp_name, tbsp_id,  
substr(tbsp_state,1,40) as tbsp_state 
from table( MON_GET_TABLESPACE(NULL,-2)) as montbsp  
order by tbsp_id  ;
