select   
substr(tbsp_name,1,14) as tbsp_name, tbsp_id,  
substr(tbsp_state,1,40) as tbsp_state  
from table( MON_GET_TABLESPACE('TSDROP',-2)) as montbsp  
   ;
