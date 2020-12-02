 select   
 SUBSTR(TABSCHEMA,1,10) AS SCHEMA , SUBSTR(TABNAME,1,50) AS TABLE , 
 DATA_OBJECT_P_SIZE, INDEX_OBJECT_P_SIZE ,  
 COL_OBJECT_P_SIZE, COL_OBJECT_L_SIZE 
 from table ( admin_get_tab_info ('SYSIBM',NULL  ) ) AS TABINFO
where tabname like 'SYN%'  
order by TABNAME  ; 
