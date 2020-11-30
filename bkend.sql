 update bkstats 
 set dir_read_now 
   =  (select direct_reads from table (mon_get_database(-2)) as mondb )
   where id = 1 ;
 
 select (dir_read_now - dir_read_start) as direct_reads_since_start  from bkstats 
  where id = 1  ;

 
