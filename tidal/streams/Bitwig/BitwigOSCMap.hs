-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md

-- TODO: 
-- [ ] Global
-- [ ] Project
-- [ ] Layouts and panels
-- [ ] Track groups
-- [ ] Cursor Device / Primary Device
-- [ ] Browser
-- [ ] Marker
-- [ ] Misc

-- TODO:
-- DrivenByMoss 
-- :{
-- p c v    = value (range 0 16384 v) # channel c
-- :}

-- Target
:{
bwTarget = Target {oName     = "bitwig",
                   oAddress  = "127.0.0.1",
                   oPort     = 8000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

-- OSC paths and args
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCTransport.hs
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCTrack.hs
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCMaster.hs
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCScene.hs
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCUser.hs
:script /path/to/tidal/streams/Bitwig/BitwigOSC/BitwigOSCMIDI.hs

-- OSC map
:{
bwOscMap = [(superdirtTarget, [superdirtShape]),
            (bwTarget, bwTransport++
                       bwTrack++
                       bwMaster++
                       bwScene++
                       bwUser++
                       bwMIDI
            )]
:}
