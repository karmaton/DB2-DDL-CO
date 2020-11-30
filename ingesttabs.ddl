truncate table history drop storage immediate;

ingest set commit_count 5000 ;
ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingestsamp.txt restart off 
  update inst464.acct 
  set (balance) = ($balance) 
  where acct_id = $ackey ;

ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingestsamp.txt restart off 
  update inst464.branch 
  set (balance) = (balance + $balance) 
  where branch_id = $brkey ;

ingest from file sampledata.del  format delimited 
  ( $ackey integer external ,
    $telkey integer external ,
    $brkey integer external,
    $balance decimal(15,2) external ) 
  messages ingestsamp.txt restart off 
  update inst464.teller 
  set (balance) = (balance + $balance) 
  where teller_id = $telkey ;

ingest from file hist200k.del  format delimited 
  messages ingestsamp.txt restart off 
  insert into inst464.history 
 ;



 
