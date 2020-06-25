-- LiveCore Target
:{
lcTarget = Target {oName     = "Reaktor 6",
                   oAddress  = "127.0.0.1",
                   oPort     = 10000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

lcTimespan = 1/1000

-- LiveCore OSC Specs
:{
lcOSCSpecs = [OSC "/nanoosc/note" $ ArgList [("note", Nothing),
                                              ("gain", Just $ VF 1),
                                              ("gate", Just $ VF 1),
                                              ("lcexpression", Just $ VF 0),
                                              ("notechannel", Just $ VF 0),
                                              ("delay", Just $ VF 0),
                                              ("begin", Just $ VF 0),
                                              ("end", Just $ VF 1),
                                              ("delta", Just $ VF 0),
                                              ("cycle", Just $ VF 0),
                                              ("cps", Just $ VF 0)],
              OSC "/nanoosc/control" $ ArgList [("control", Nothing),
                                              ("controlchannel", Just $ VF 0),
                                              ("delay", Just $ VF 0),
                                              ("delta", Just $ VF 0),
                                              ("cycle", Just $ VF 0),
                                              ("cps", Just $ VF 0)],
              OSC "/nanoosc/sample" $ ArgList [("speed", Nothing),
                                                ("note", Just $ VF 0),
                                                ("notechannel", Just $ VF 0),
                                                ("begin", Just $ VF 0),
                                                ("end", Just $ VF 1),
                                                ("cycle", Just $ VF 0),
                                                ("cps", Just $ VF 0)],
              OSC "/nanoosc/select" $ ArgList [("lcselect", Nothing),
                                                ("gain", Just $ VF 1),
                                                ("selectchannel", Just $ VF 0),
                                                ("delta", Just $ VF 0),
                                                ("cycle", Just $ VF 0),
                                                ("cps", Just $ VF 0)],
              OSC "/nanoosc/clock" $ ArgList [("lcclock", Nothing),
                                               ("timespan", Just $ VF (1/20)),
                                               ("cycle", Just $ VF 0),
                                               ("cps",   Just $ VF 0)]]
:}

-- LiveCore pattern parameters
:{
let lcnotenumber      = pI "lcnotenumber"    -- pattern int
    lcnotevelocity    = pF "lcnotevelocity"  -- pattern float
    lcnoteduration    = pF "lcnoteduration"  -- pattern float
    lcexpression      = pF "lcexpression"   -- pattern float
    lcchannel         = pI "lcchannel"   -- pattern int
    lccontrolvalue    = pF "lccontrolvalue"  -- pattern float
    lcselect          = pI "lcselect"   -- pattern int
    lcselectlevel     = pF "lcselectlevel"   -- pattern float
    lcsampleselect    = pI "lcsampleselect"    -- pattern string
    lcclock           = pI "lcclock"         -- pattern string
    notechannel       = pI "notechannel" -- pattern int
    controlchannel    = pI "controlchannel" -- pattern int
    selectchannel     = pI "selectchannel" -- pattern int
:}

-- LiveCore pattern parameter shorthands
:{
let lcn n v d e c = note n # gain v # gate d # lcexpression e # notechannel c
    lcn_ n c = note n # gain 0.5 # gate 0.5 # lcexpression 0 # notechannel c
    lcc v c   = control v # controlchannel c
    lcn' n (#) v (+) d e c = note n # gain v + gate d # lcexpression e # notechannel c
    -- lcc' v (#) c       = control n # controlchannel c
    lccc c v = control v # controlchannel c
:}

-- LiveCore OSC Map
lcOscMap = (lcTarget, lcOSCSpecs)
