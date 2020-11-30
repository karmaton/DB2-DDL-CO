select varchar(ts.tbsp_name,20) as tbsp_name , ts.tbsp_id, ts.tbsp_content_type, 
 varchar(ts.tbsp_state,20) as state, 
 cont.container_type,
 substr(cont.container_name,1,30) as container, cont.accessible

 from table(mon_get_tablespace('',-1)) AS ts , 
      table(mon_get_container('',-1)) AS cont  
 where ts.tbsp_id = cont.tbsp_id 
 and ts.tbsp_state = 'OFFLINE';
 
