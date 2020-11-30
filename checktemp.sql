select varchar(tbsp_name,10) as tbsp_name , tbsp_id, tbsp_content_type, 
 varchar(tbsp_state,20) as state 
 from table(mon_get_tablespace('TEMP2',-1)) AS monts ;

select varchar(tbsp_name,10) as tbsp_name , tbsp_id, container_type,
 substr(container_name,1,30) as container, accessible 
 from table(mon_get_container('TEMP2',-1)) AS moncont ; 
