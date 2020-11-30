load from hist200k.del of del messages ldhtest1.msg replace into test.history1 statistics yes copy no  ;
load from hist200k.del of del messages ldhtest1.msg replace into test.history2 statistics yes copy no  ;
INSERT INTO TEST.BRANCH  SELECT * FROM INST464.BRANCH ;
INSERT INTO TEST.TELLER  SELECT * FROM INST464.TELLER ;






