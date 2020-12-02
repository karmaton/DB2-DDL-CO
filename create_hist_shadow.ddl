create table colorg.hist_shad 
 as (select * from roworg.historyi ) 
 data initially deferred 
 refresh deferred 
 enable query optimization 
 maintained by replication 
 organize by column 
 in tscold  ; 

set integrity for colorg.hist_shad all immediate unchecked ;

alter table colorg.hist_shad add constraint hist_shad_pk 
 primary key (acct_id, tstmp) ;

