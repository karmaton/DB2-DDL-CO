select 
 LOG_WRITES  ,
 NUM_LOG_WRITE_IO,
 NUM_LOG_PART_PAGE_IO  
 from sysibmadm.snapdb ;

select
 '(LOG_WRITES - NUM_LOG_PART_PAGE_IO) / 4' as formula ,
 (LOG_WRITES - NUM_LOG_PART_PAGE_IO) / 4 AS LOGPAGES_PERMIN
 from sysibmadm.snapdb ;

