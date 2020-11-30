update 
 inst491.history set balance=balance +1  
 where branch_id = 10  ; 

create table temphist like inst491.history in userspace1 ;


