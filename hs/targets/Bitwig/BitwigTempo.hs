:{
let bwAddress   = "127.0.0.1"
    bwPort      = 8000
    bwLatency   = 0.02
    bwPreamble  = []
    bwTimestamp = BundleStamp
:}

-- TEMPO
:{ 
bwTempoTarget = OSCTarget {oName = "BitwigTempo", oAddress = bwAddress, oPort = bwPort,
                       oPath = "/tempo/raw", oShape = Just [("raw", Just $ VF 0)],
                       oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp
                      }
:}

bwTempo  <- startTidal bwTempoTarget  (defaultConfig {cFrameTimespan = 1/20})

:{
let tempo = pF "raw"
    bwT = streamReplace bwTempo
    onceT = streamOnce bwTempo
    hushT = streamHush bwTempo
:}
