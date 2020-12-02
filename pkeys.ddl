alter table colorg.acct add primary key (acct_id) not enforced ;
alter table colorg.branch add primary key (branch_id)  not enforced ;
alter table colorg.teller add primary key (teller_id)  not enforced ;

alter table colorg.history add constraint fkeyteller 
      foreign key (teller_id) references colorg.teller not enforced ;

alter table colorg.history add constraint fkeybranch 
      foreign key (branch_id) references colorg.branch not enforced ;

alter table colorg.history add constraint fkeyacct 
      foreign key (acct_id) references colorg.acct not enforced ;

