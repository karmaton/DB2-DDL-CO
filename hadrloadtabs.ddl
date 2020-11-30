connect to tp1 ;
create table hadrcyes like acct in tp1hadr ;
create table hadrcno like acct in tp1hadr ;
create table hadrnrec like acct in tp1hadr ;
export to acct100k.del of del messages lab9exp1.txt
  select * from acct where acct_id < 100001 ;
connect reset ;

