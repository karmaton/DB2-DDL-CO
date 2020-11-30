 select 
  tbsp_id as TS_ID,  substr(tbsp_name,1,20) as TS_name , 
  container_type , substr(container_name,1,80) as container_name ,
  total_pages
  from table(mon_get_container(null,-2)) as cont  
  where tbsp_name like 'TEST%' 
  order by tbsp_id, container_id ;
 
