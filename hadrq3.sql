
insert into temphist 
 select * from inst491.history where branch_id < 30 ;

select count(*) as temp_count from temphist ;

