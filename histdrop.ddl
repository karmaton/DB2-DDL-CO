connect to tp1 ;

create tablespace tsdrop using stogroup tp1sg1 initialsize 10M dropped table recovery on ;
create table histdrop like history in tsdrop ;

INGEST SET COMMIT_COUNT 5000 ;
INGEST FROM FILE /home/inst491/bin/hist200k.del FORMAT DELIMITED 
   messages INGEST_msg.txt INSERT INTO INST491.HISTDROP ;

select count(*) as new_row_count from histdrop ;


