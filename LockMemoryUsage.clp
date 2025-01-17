with dbcfg1 as 
( select float(int(value) * 4096) as locklist  from sysibmadm.dbcfg where name = 'locklist' ) , 

dbcfg2 as 
( select float(int(value)) as maxlocks  from sysibmadm.dbcfg where name = 'maxlocks' )  

select  dec((MDB.lock_list_in_use/locklist)*100,4,1) as "% Lock List",
       dec((MDB.lock_list_in_use/(locklist*(maxlocks/100))*100),4,1)
                as "% to Maxlock",
       MDB.appls_cur_cons as "Number of Cons",
       MDB.lock_list_in_use/MDB.appls_cur_cons  as "Avg Lock Mem Per Con (bytes)"
from dbcfg1, dbcfg2 , table (MON_GET_DATABASE(-1)) AS MDB ;
