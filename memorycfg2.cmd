alter bufferpool ibmdefaultbp immediate size 50000 ;
alter bufferpool tp1h16k immediate size 10000 ;
update db cfg for tp1 using sortheap 10000 ;


