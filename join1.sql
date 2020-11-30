select history.branch_id , teller.teller_name, history.acctname, 
    history.acct_id, history.balance, 
    from inst481.history as history , inst481.teller as teller 
  where history.teller_id = teller.teller_id 
  and history.branch < 50 
  order by history.branch_id , history.acct_id ; 
