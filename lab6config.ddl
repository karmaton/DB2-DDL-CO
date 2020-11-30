connect to tp1 ;
update db cfg using self_tuning_mem off ;
alter bufferpool ibmdefaultbp size 2000  ;
alter bufferpool tp1adata size 7000 ;
alter bufferpool tp1aindx size 6000  ;
update db cfg using sheapthres_shr 7500 sortheap 2500  ;
update db cfg using locklist 100 maxlocks 25  ;
update db cfg using database_memory automatic  ;
update db cfg using logsecond 30 logfilsiz 2000 softmax 100 ;


