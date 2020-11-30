select 
  varchar(TBSP_NAME,20) As TBSP_NAME, 
  container_id, 
  stripe_set ,
  container_type, 
  total_pages,
  usable_pages,
  varchar(container_name,50) as CONTAINER_NAME

  from table(mon_get_container('ASMTSPD',-1)) AS cont
  order by container_id ; 


select TBSP_TOTAL_PAGES as Total_pages, 
 TBSP_USED_PAGES as Used_pages , TBSP_PAGE_TOP as High_water_MARK
 from table (mon_get_tablespace('ASMTSPD',-1)) AS TBSP


   ;

