connect to tp1 ;
create tablespace testload initialsize 20M ;
create table acctcyes like acct in testload ;
create table acctcno like acct in testload ;
create table acctnrec like acct in testload ;
export to acct5k.del of del messages lab9exp1.txt
  select * from acct where acct_id < 5001 ;
export to acct8k.del of del messages lab9exp2.txt
  select * from acct where acct_id between 5001 and 8000  ;
export to acct10k.del of del messages lab9exp3.txt
  select * from acct where acct_id between 8001 and 10000  ;
connect reset ;

