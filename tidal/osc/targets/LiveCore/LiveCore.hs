-- LiveCore Targets
:{
oPorts = [ 10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007 ]
lcTarget0 = Target {oName     = "LiveCore t0",
                    oAddress  = "127.0.0.1",
                    oPort     = oPorts!!0,
                    oLatency  = 0.5,
                    oWindow   = Nothing,
                    oSchedule = Pre BundleStamp
                   }
lcTarget1 = lcTarget0 { oName = "LiveCore t1", oPort = oPorts!!1 }
lcTarget2 = lcTarget0 { oName = "LiveCore t2", oPort = oPorts!!2 }
lcTarget3 = lcTarget0 { oName = "LiveCore t3", oPort = oPorts!!3 }
lcTarget4 = lcTarget0 { oName = "LiveCore t4", oPort = oPorts!!4 }
lcTarget5 = lcTarget0 { oName = "LiveCore t5", oPort = oPorts!!5 }
lcTarget6 = lcTarget0 { oName = "LiveCore t6", oPort = oPorts!!6 }
lcTarget7 = lcTarget0 { oName = "LiveCore t7", oPort = oPorts!!7 }
:}


-- SDND
:{
clockTarget = Target {oName   = "SDND clockTarget",
                    oAddress  = "127.0.0.1",
                    oPort     = 9696,
                    oLatency  = 0.5,
                    oWindow   = Nothing,
                    oSchedule = Pre BundleStamp
                   }
:}

-- LiveCore Target parameters and shortcut
:{
let _lcT0 = [("target0", Nothing), ("ignore", Just $ VF 0)]
    _lcT1 = [("target1", Nothing), ("ignore", Just $ VF 0)]
    _lcT2 = [("target2", Nothing), ("ignore", Just $ VF 0)]
    _lcT3 = [("target3", Nothing), ("ignore", Just $ VF 0)]
    _lcT4 = [("target4", Nothing), ("ignore", Just $ VF 0)]
    _lcT5 = [("target5", Nothing), ("ignore", Just $ VF 0)]
    _lcT6 = [("target6", Nothing), ("ignore", Just $ VF 0)]
    _lcT7 = [("target7", Nothing), ("ignore", Just $ VF 0)]
    _target0 = pF "target0"
    _target1 = pF "target1"
    _target2 = pF "target2"
    _target3 = pF "target3"
    _target4 = pF "target4"
    _target5 = pF "target5"
    _target6 = pF "target6"
    _target7 = pF "target7"
    t0 = _target0 1
    t1 = _target1 1
    t2 = _target2 1
    t3 = _target3 1
    t4 = _target4 1
    t5 = _target5 1
    t6 = _target6 1
    t7 = _target7 1
:}

-- Messages, lcOSCSpecs, block mappings & shorthands
:script osc/targets/LiveCore/NanoOSCMessages.hs
:script osc/targets/LiveCore/NanoOSCSpecs.hs
:script osc/targets/LiveCore/NanoBlockMappings/NanoBlockMappings.hs

-- LiveCore OSC Map
:{
lcOscMap = [(lcTarget0, lcOSCSpec0),
            (lcTarget1, lcOSCSpec1),
            (lcTarget2, lcOSCSpec2),
            (lcTarget3, lcOSCSpec3),
            (lcTarget4, lcOSCSpec4),
            (lcTarget5, lcOSCSpec5),
            (lcTarget6, lcOSCSpec6),
            (lcTarget7, lcOSCSpec7),
            (clockTarget, lcOSCSpec0)] -- SDND
:}
