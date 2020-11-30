select 
 substr(authid,1,10) as authid, 
 substr(appl_name,1,20) as appl_name ,
 percent_rows_selected 
 from sysibmadm.appl_performance ;

