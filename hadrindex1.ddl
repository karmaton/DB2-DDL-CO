connect to tp1 ;
alter table hadrcno log index build off ;
create index hadrix1 on hadrcyes (acct_id)  ;
create index hadrix2 on hadrcno (acct_id)  ;
connect reset ;

