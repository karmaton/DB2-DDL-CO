 ingest set commit_count 5000 ;

 ingest from file /home/inst20/data/files/acct.del
 format delimited  messages ingestacct.msg
 insert into test.acct ;

