-- Target
:{
flowerTarget = Target {oName    = "Flower",
                       oAddress  = "127.0.0.1",
                       oPort     = 8888,
                       oLatency  = 0.2,
                       oWindow   = Nothing,
                       oSchedule = Pre BundleStamp,
                       oHandshake = False,
                       oBusPort = Nothing
                      }
:}

-- OSC Specs
:{
flowerOSCSpecs = [OSC "/flower/freq" $ ArgList [("flowerfreq", Nothing)],
                  OSC "/flower/gain" $ ArgList [("flowergain", Nothing)],
                  OSC "/flower/sin"  $ ArgList [("flowersin",  Nothing)],
                  OSC "/flower/saw"  $ ArgList [("flowersaw",  Nothing)],
                  OSC "/flower/squ"  $ ArgList [("flowersqu",  Nothing)],
                  OSC "/flower/tri"  $ ArgList [("flowertri",  Nothing)]]
:}

-- Parameters
:{
let flowerFreq = pF "flowerfreq"
    flowerGain = pF "flowergain"
    flowerSin = pF "flowersin"
    flowerSaw = pF "flowersaw"
    flowerSqu = pF "flowersqu"
    flowerTri = pF "flowertri"
:}

-- Parameter shortcuts/groups
-- :{
-- let pa = parameter
--     pa2 = parameter2
-- :}

-- OSC Map
flowerOscMap = (flowerTarget, flowerOSCSpecs)
