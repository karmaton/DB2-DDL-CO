load from acct.del of del messages loadracct.msg replace into roworg.acct ;
runstats on table roworg.acct and indexes all ;

load from histdata.del of del messages loadrhist.msg replace into roworg.history ;
runstats on table roworg.history and indexes all;

load from branch.del of del messages loadrbranch.msg replace into ROWORG.branch ;
runstats on table roworg.branch and indexes all;

load from teller.del of del messages loadrteller.msg replace into ROWORG.teller ;
runstats on table roworg.teller and indexes all;



