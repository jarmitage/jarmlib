-- Target
:{
vdmxTarget = Target {oName    = "VDMX",
                   oAddress  = "127.0.0.1",
                   oPort     = 8009,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

-- OSC Specs
:{
vdmxOSCSpecs = [OSC "/tidal/play" $ ArgList [("play", Nothing)],
                OSC "/tidal/source" $ ArgList [("source", Nothing)],
                OSC "/tidal/position" $ ArgList [("begin", Nothing)],
                OSC "/tidal/speed" $ ArgList [("speed", Nothing)]]
:}

-- Parameters
:{
let play = pI "play"
    source = pI "source"
:}

-- Parameter shortcuts/groups
-- :{
-- let pa = parameter
--     pa2 = parameter2
-- :}

-- OSC Map
vdmxOscMap = (vdmxTarget, vdmxOSCSpecs)
