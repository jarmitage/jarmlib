-- Target
:{
tmpTarget = Target {oName    = "Template",
                   oAddress  = "127.0.0.1",
                   oPort     = 8000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

-- OSC Specs
:{
tmpOSCSpecs = [OSC "/path/{path}/" $ ArgList [("parameter", Nothing),
                                          ("delta",  Just $ VF 0),
                                          ("cycle",  Just $ VF 0),
                                          ("cps",    Just $ VF 0)],
              OSC "/path/{path2}/" $ ArgList [("parameter2", Nothing),
                                          ("delta",  Just $ VF 0),
                                          ("cycle",  Just $ VF 0),
                                          ("cps",    Just $ VF 0)]]
:}

-- Parameters
:{
let path = pF "path"
    path2 = pF "path2"
    parameter = pF "parameter"
    parameter2 = pF "parameter2"
:}

-- Parameter shortcuts/groups
:{
let pa = parameter
    pa2 = parameter2
:}

-- OSC Map
tmpOscMap = (tmpTarget, tmpOSCSpecs)
