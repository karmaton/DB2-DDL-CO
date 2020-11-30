load from hist200k.ixf of ixf messages ldhist.msg replace into history  nonrecoverable ;
-- collect new statistics
runstats on table inst481.history and indexes all ;
