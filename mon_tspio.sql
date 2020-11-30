select container_id, 
 pages_read, pages_written,
 direct_reads, direct_writes 
 from  table(mon_get_container('DMSMTSPD',-1)) AS TBSP 
   ;

