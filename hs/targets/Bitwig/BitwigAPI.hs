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
                           oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- SCENE
:{ 
bwSceneTarget = OSCTarget {oName = "BitwigScene", oAddress = bwAddress, oPort = bwPort,
                           oPath = "/scene/{scene}/launch", oShape = Just [],
                           oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- TRACK
:{ 
bwTrackTarget = OSCTarget {oName = "BitwigTrack", oAddress = bwAddress, oPort = bwPort,
                           oPath = "/track/{track}/{action}",
                           oShape = Just [("volume", Just $ VF 0), ("pan", Just $ VF 0)],
                           oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- CLIP
:{ 
bwClipTarget = OSCTarget {oName = "BitwigClip", oAddress = bwAddress, oPort = bwPort,
                          oPath = "/track/{track}/clip/{clip}/{action}", oShape = Just [],
                          oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- MASTER
:{ 
bwMasterTarget = OSCTarget {oName = "BitwigMaster", oAddress = bwAddress, oPort = bwPort,
                            oPath = "/master/{action}/{value}",
                            oShape = Just [("volume", Just $ VF 0), ("pan", Just $ VF 0)],
                            oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- MIDI
:{ 
bwMIDITarget = OSCTarget {oName = "BitwigMIDI", oAddress = bwAddress, oPort = bwPort,
                          oPath = "/vkb_midi/{channel}/{action}/{value}", oShape = Just [("value", Just $ VI 0)],
                          oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- MIDICC
:{ 
bwMIDICCTarget = OSCTarget {oName = "BitwigMIDICC", oAddress = bwAddress, oPort = bwPort,
                            oPath = "/vkb_midi/{channel}/{action}/{channel}/{value}", oShape = Just [("value", Just $ VI 0)],
                            oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- USER
:{ 
bwUserTarget = OSCTarget {oName = "BitwigUser", oAddress = bwAddress, oPort = bwPort,
                          oPath = "/user/{channel}/value", oShape = Just [("value", Just $ VF 0)],
                          oLatency = bwLatency, oPreamble = bwPreamble, oTimestamp = bwTimestamp}
:}

-- :{
bwTempo  <- startTidal bwTempoTarget  (defaultConfig {cFrameTimespan = 1/20})
bwScene  <- startTidal bwSceneTarget  (defaultConfig {cFrameTimespan = 1/20})
bwTrack  <- startTidal bwTrackTarget  (defaultConfig {cFrameTimespan = 1/20})
bwClip   <- startTidal bwClipTarget   (defaultConfig {cFrameTimespan = 1/20})
bwMaster <- startTidal bwMasterTarget (defaultConfig {cFrameTimespan = 1/20})
bwMIDI   <- startTidal bwMIDITarget   (defaultConfig {cFrameTimespan = 1/20})
bwMIDICC <- startTidal bwMIDICCTarget (defaultConfig {cFrameTimespan = 1/20})
bwUser   <- startTidal bwUserTarget   (defaultConfig {cFrameTimespan = 1/20})
-- :}


-- oPath parameters
:{
let channel  = pI "channel"
    value   = pF "value"
    -- vi       = pI "value"
    action   = pS "action"
    tempo    = pF "raw"
    scene    = pI "scene"
    track    = pI "track"
    clip     = pI "clip"
    -- p c v    = value (range 0 16384 v) # channel c
:}

:{
let bwB   = streamReplace bwTempo
    bwS   = streamReplace bwScene
    bwT   = streamReplace bwTrack
    bwC   = streamReplace bwClip
    bwM   = streamReplace bwMaster
    bwV   = streamReplace bwMIDI
    bwVC  = streamReplace bwMIDICC
    bwU   = streamReplace bwUser
    hushB = mapM_ streamHush [bwTempo, bwScene, bwTrack, bwClip, bwMaster, bwMIDI, bwMIDICC, bwUser]
    -- once  = streamOnce superDirt
:}

