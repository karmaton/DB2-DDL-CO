select 
  varchar(TBSP_NAME,20) As TBSP_NAME, 
  container_id, 
  stripe_set ,
  container_type, 
  total_pages,
  usable_pages,
  varchar(container_name,90) as CONTAINER_NAME

  from table(mon_get_container(NULL,-1)) AS cont
  where TBSP_NAME IN ('DMSMTSPD','ASMTSPD') 
  order by TBSP_NAME,container_id ; 

select varchar(TBSP_NAME,20) As TBSP_NAME,
 TBSP_TOTAL_PAGES as Total_pages, 
 TBSP_USED_PAGES as Used_pages ,
 (100 * TBSP_USED_PAGES / TBSP_TOTAL_PAGES ) as PCT_USED,  
 TBSP_PAGE_TOP as High_water_MARK,
 (100 * TBSP_PAGE_TOP / TBSP_TOTAL_PAGES ) as PCT_HWM
 from table (mon_get_tablespace(NULL,-1)) AS TBSP
 where TBSP_NAME IN ('DMSMTSPD','ASMTSPD') 
 order by TBSP_NAME  ;

