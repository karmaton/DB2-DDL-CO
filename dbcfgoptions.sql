
select name, substr(value,1,60) as value 
 from sysibmadm.dbcfg 
 where name like 'log%' 
   or name in ('softmax','page_age_trgt_mcr','util_heap_sz') 
  order by name  ;


