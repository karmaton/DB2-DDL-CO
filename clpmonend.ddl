-- drop New tablespaces, tables, and bufferpools
                                                                               
connect to tp1 ;
                                                                               
drop tablespace clpmtsp1,clpmtsp2 ;
                                                                               
drop tablespace usertemp ;
                                                                               
drop BUFFERPOOL CLPBUFFL ;
                                                                               
drop BUFFERPOOL CLPBUFFS  ;
                                                                               
update db cfg using locklist 2000 maxlocks 22 logfilsiz 1000 logsecond 3 ;

