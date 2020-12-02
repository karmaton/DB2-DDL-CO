insert into roworg.historyi   (
      select ACCT_ID,       TELLER_ID,
       BRANCH_ID        ,
       BALANCE          ,
       DELTA     , PID       ,
        tstmp      ,
       ACCTNAME   ,
       TEMP 
      from roworg.history ) ;
       



