connect to tp1 ;

INGEST SET COMMIT_COUNT 5000 ;
INGEST FROM FILE /home/inst491/bin/hist200k.del FORMAT DELIMITED 
   messages INGEST_msg.txt INSERT INTO INST491.HISTDROP ;

select count(*) as new_row_count from histdrop ;

