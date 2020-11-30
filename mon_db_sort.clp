with dbcfg1 as 
( select int(value)  as sheapthres_shr from sysibmadm.dbcfg where name = 'sheapthres_shr' ) 
 
select sheapthres_shr as "Shared_sort_heap" ,
    sort_shrheap_allocated as "Shared_sort_allocated" ,
    dec((100 * sort_shrheap_allocated)/sheapthres_shr,5,2) as " % Sheap_alloc" , 
    dec((100* sort_shrheap_top)/sheapthres_shr,5,2) as " % Max Sheap_alloc" ,
       sort_overflows as "Sort_Overflows", 
       total_sorts as "Total_Sorts"
from dbcfg1,  table (MON_GET_DATABASE(-1)) AS MONDB ;
