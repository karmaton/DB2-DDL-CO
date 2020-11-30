connect to tp1 ;
create table histcopy like history in userspace1 ;

INGEST SET COMMIT_COUNT 5000 ;
INGEST FROM FILE /home/inst464/bin/hist200k.del FORMAT DELIMITED 
   messages INGEST_msg.txt INSERT INTO INST464.HISTCOPY ;

select count(*) as histcopy_row_count from histcopy ;

