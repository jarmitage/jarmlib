-- Docs: https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md

-- TODO:
-- [ ] Track mixer
-- [ ] Layouts and panels
-- [ ] Track groups
-- [ ] Cursor Device / Primary Device
-- [ ] Browser

-- Target
:{
bwTarget = Target {oName     = "bitwig",
                   oAddress  = "127.0.0.1",
                   oPort     = 8000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Live
                  }
:}

-- OSC range converter (MAX_VALUE in DrivenByMoss ext.)
let bwO m = range 0 16384 m

-- OSC paths and args
:script osc/targets/Bitwig/OSCSpecs/Global.hs
:script osc/targets/Bitwig/OSCSpecs/Project.hs
:script osc/targets/Bitwig/OSCSpecs/Transport.hs
:script osc/targets/Bitwig/OSCSpecs/Track.hs
:script osc/targets/Bitwig/OSCSpecs/TrackClip.hs
:script osc/targets/Bitwig/OSCSpecs/Master.hs
:script osc/targets/Bitwig/OSCSpecs/Scene.hs
:script osc/targets/Bitwig/OSCSpecs/User.hs
:script osc/targets/Bitwig/OSCSpecs/MIDI.hs

-- OSC map
:{
bwOscMap = (bwTarget, bwGlobal++
                      bwProject++
                      bwTransport++
                      bwTrack++
                      bwTrackClip++
                      bwMaster++
                      bwScene++
                      bwUser++
                      bwMIDI
            )
:}
