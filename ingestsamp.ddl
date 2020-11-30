ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingest1.txt restart off 
  update inst464.acct 
  set (balance) = ($balance) 
  where acct_id = $ackey ;

ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingest2.txt restart off 
  update inst464.branch 
  set (balance) = (balance + $balance) 
  where branch_id = $brkey ;

ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingest1.txt restart off 
  update inst464.teller 
  set (balance) = (balance + $balance) 
  where teller_id = $telkey ;



 
