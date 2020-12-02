
load from histdata.del of del  messages lhisti.msg replace into roworg.historyi nonrecoverable ;
runstats on table roworg.historyi and indexes all;




