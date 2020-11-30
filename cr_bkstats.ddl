create table bkstats 
 ( id int not null, 
   dir_read_start  bigint not null,
   dir_read_now    bigint not null 
 )
 in userspace1 ;
 insert into bkstats values (1 , 0, 0) ;
 
 
