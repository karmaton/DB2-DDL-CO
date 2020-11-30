connect to tp1 ;
update db cfg using self_tuning_mem off ;
alter bufferpool ibmdefaultbp size 15000  ;
update db cfg using sheapthres_shr 7500 sortheap 2500  ;
call SYSINSTALLOBJECTS('EXPLAIN','C','USERSPACE1',NULL) ;
load from hist200k.del of del replace into inst481.history nonrecoverable ;
runstats on table inst481.history and indexes all;




