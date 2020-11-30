 select 
  tbsp_id as TS_ID,  substr(tbsp_name,1,20) as TS_name , 
  container_type , substr(container_name,1,60) as container_name ,
  total_pages
  from table(mon_get_container('',-2)) as cont  
  order by tbsp_id, container_id ;
 
