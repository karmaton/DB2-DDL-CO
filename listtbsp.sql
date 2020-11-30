select   
substr(tbsp_name,1,24) as tbsp_name, tbsp_id,  
tbsp_type, 
 case (tbsp_using_auto_storage) when 1 then 'Yes' else 'No' end as Auto_Storage   
from table(MON_GET_TABLESPACE('',-2)) as TBSP  
order by tbsp_id ; 
