:script /Users/jarm/SparkleShare/gitlab.com/tidal/lib/tidal/osc/OSCMaps.hs

:{
futureTarget = Target {oName     = "bitwig",
                       oAddress  = "127.0.0.1",
                       oPort     = 8000,
                       oLatency  = 0.2,
                       oWindow   = Just (-2, 4),
                       oSchedule = Pre BundleStamp
                      }
:}

:{
oscmap = [(superdirtTarget, [superdirtShape]),
          (futureTarget, [superdirtShape])]
:}

stream <- streamReplace defaultConfig oscmap

-- streamReplace stream 1 $ s "bd*4"
