create table histsample like histcopy in userspace1 ;
insert into histsample 
select * from histcopy tablesample bernoulli(5);
select count(*) as sample_count from histsample ;
export to sampledata.del of del select acct_id,teller_id,branch_id,balance from histsample ;
 
