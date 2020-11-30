 select
  tbsp_id as TS_ID,  substr(tbsp_name,1,20) as TS_name , 
  container_type , substr(container_name,1,60) as container_name 
  from sysibmadm.snapcontainer 
  order by tbsp_id, container_id ;
 
