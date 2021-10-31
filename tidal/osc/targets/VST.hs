-- Target
:{
vstTarget = Target {oName      = "VST", 
                    oAddress   = "127.0.0.1", 
                    oHandshake = True, 
                    oPort      = 3337, 
                    oBusPort   = Just 3338, 
                    oLatency   = 0.1, 
                    oSchedule  = Pre BundleStamp, 
                    oWindow    = Nothing
                  }
:}

-- OSC Map
vstOscMap = (vstTarget, [superdirtShape])
