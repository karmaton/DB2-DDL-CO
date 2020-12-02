select 
 utility_id,
 utility_start_time,
 utility_type,
 varchar(object_schema,12) as schema,
 varchar(object_name,20) as object_name,
 substr(utility_detail,1,200) as cmd
 from table(mon_get_utility(-1)) as t1 ;

