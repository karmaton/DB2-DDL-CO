 update bkstats 
 set dir_read_start 
   =  (select direct_reads from table (mon_get_database(-2)) as mondb )
   where id = 1 ;
 
 select dir_read_start as direct_read_before_backup from bkstats where id = 1;
 
