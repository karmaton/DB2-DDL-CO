select TBSP_TOTAL_PAGES as Total_pages, TBSP_FREE_PAGES as Free_pages
 from  table(mon_get_tablespace('DMSMTSPD',-1)) AS TBSP 
   ;
select TBSP_USED_PAGES as Used_pages , TBSP_PAGE_TOP as High_water_MARK
  from table(mon_get_tablespace('DMSMTSPD',-1)) AS TBSP 
   ;

