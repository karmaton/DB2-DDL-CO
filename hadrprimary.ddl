
update db cfg for tp1 using hadr_target_list 'ibmclass:6492' ;
update db cfg for tp1 using HADR_LOCAL_HOST ibmclass ;
update db cfg for tp1 using HADR_LOCAL_SVC 6491  ;
update db cfg for tp1 using HADR_REMOTE_HOST ibmclass ;
update db cfg for tp1 using HADR_REMOTE_SVC 6492 ;
update db cfg for tp1 using HADR_REMOTE_INST inst492 ;
update db cfg for tp1 using HADR_TIMEOUT 30 ;
update db cfg for tp1 using HADR_PEER_WINDOW 60 ;

