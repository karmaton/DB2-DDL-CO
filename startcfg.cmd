alter bufferpool ibmdefaultbp immediate size 1000 ;
alter bufferpool tp1h16k immediate size 250 ;
update db cfg for tp1 using sortheap 250 SHEAPTHRES_SHR 80000;
update db cfg for tp1 using locklist 5000 maxlocks 80 ;

