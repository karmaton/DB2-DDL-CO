echo Clean Up Unit 5 Objects
db2 terminate 
echo Drop TEST tablespaces in TP1 database 
db2 connect to tp1 
db2 -v drop tablespace testsmall,testhist1,testhist2 
db2 terminate  
echo Drop the TEST database
db2 -v drop database test 

