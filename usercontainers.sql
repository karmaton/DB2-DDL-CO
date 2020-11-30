 select 
  container_id ,  substr(tbsp_name,1,20) as TS_name , 
  container_type , substr(container_name,1,60) as container_name ,
  total_pages
  from table(mon_get_container('USERSPACE1',-2)) as cont  
  order by container_id ;
 
