:{
bitwigUserTarget = OSCTarget {oName = "BitwigUserParams",
                            oAddress = "127.0.0.1",
                            oPort = 8000,
                            oPath = "/user/{channel}/value",
                            oShape = Just [("value", Just $ VF 0)],
                            oLatency = 0.02,
                            oPreamble = [],
                            oTimestamp = BundleStamp
                           }
:}

bitwigUser <- startTidal bitwigUserTarget (defaultConfig {cFrameTimespan = 1/20})

:{
let bwU = streamReplace bitwigUser
    -- Pattern state
    hushU        = streamHush   bitwigUser
    listU        = streamList   bitwigUser
    muteU        = streamMute   bitwigUser
    unmuteU      = streamUnmute bitwigUser
    soloU        = streamSolo   bitwigUser
    unsoloU      = streamUnsolo bitwigUser
    -- Globals
    allU         = streamAll         bitwigUser
    onceU        = streamOnce        bitwigUser
    -- asapU        = onceU
    -- setcpsU      = asapU . cps
    nudgeAllU    = streamNudgeAll    bitwigUser
    resetCyclesU = streamResetCycles bitwigUser
    -- -- Transitions
    -- xfadeU i           = transition bitwigUser True (Sound.Tidal.Transition.xfadeIn 4) i
    -- xfadeInU i t       = transition bitwigUser True (Sound.Tidal.Transition.xfadeIn t) i
    -- histpanU i t       = transition bitwigUser True (Sound.Tidal.Transition.histpan t) i
    -- waitU i t          = transition bitwigUser True (Sound.Tidal.Transition.wait t) i
    -- waitTU i f t       = transition bitwigUser True (Sound.Tidal.Transition.waitT f t) i
    -- jumpU i            = transition bitwigUser True (Sound.Tidal.Transition.jump) i
    -- jumpInU i t        = transition bitwigUser True (Sound.Tidal.Transition.jumpIn t) i
    -- jumpInU' i t       = transition bitwigUser True (Sound.Tidal.Transition.jumpIn' t) i
    -- jumpModU i t       = transition bitwigUser True (Sound.Tidal.Transition.jumpMod t) i
    -- interpolateU i     = transition bitwigUser True (Sound.Tidal.Transition.interpolate) i
    -- interpolateInU i t = transition bitwigUser True (Sound.Tidal.Transition.interpolateIn t) i
    -- clutchU i          = transition bitwigUser True (Sound.Tidal.Transition.clutch) i
    -- clutchInU i t      = transition bitwigUser True (Sound.Tidal.Transition.clutchIn t) i
    -- anticipateU i      = transition bitwigUser True (Sound.Tidal.Transition.anticipate) i
    -- anticipateInU i t  = transition bitwigUser True (Sound.Tidal.Transition.anticipateIn t) i
    -- forIdU i t         = transition bitwigUser False (Sound.Tidal.Transition.mortalOverlay t) i
    -- mortalU i lifespan release = transition bitwigUser True (Sound.Tidal.Transition.mortal lifespan release) i
    -- Default pattern IDs
    bwU1  = bwU  1 . (|< orbit  0) 
    bwU2  = bwU  2 . (|< orbit  1) 
    bwU3  = bwU  3 . (|< orbit  2) 
    bwU4  = bwU  4 . (|< orbit  3) 
    bwU5  = bwU  5 . (|< orbit  4) 
    bwU6  = bwU  6 . (|< orbit  5) 
    bwU7  = bwU  7 . (|< orbit  6) 
    bwU8  = bwU  8 . (|< orbit  7) 
    bwU9  = bwU  9 . (|< orbit  8)
    bwU10 = bwU 10 . (|< orbit  9)
    bwU11 = bwU 11 . (|< orbit 10)
    bwU12 = bwU 12 . (|< orbit 11)
    bwU13 = bwU 13
    bwU14 = bwU 14
    bwU15 = bwU 15
    bwU16 = bwU 16
:}

-- oPath parameters
:{
let channel = pI "channel"
    value = pF "value"
    p c v = value (range 0 16384 v) # channel c
    -- Default analog and digital signals to bitwig grid
    ua0 v = p 1  v
    ua1 v = p 2  v
    ua2 v = p 3  v
    ua3 v = p 4  v
    ua4 v = p 5  v
    ua5 v = p 6  v
    ua6 v = p 7  v
    ua7 v = p 8  v
    ud0 v = p 9  v
    ud1 v = p 10 v
    ud2 v = p 11 v
    ud3 v = p 12 v
    ud4 v = p 13 v
    ud5 v = p 14 v
    ud6 v = p 15 v
    ud7 v = p 16 v
    -- Default global averaging value
    avg v = p 64 v
:}

-- -- Single target setState
-- :{
-- let setBitwigI = streamSetI bitwigUser
--     setBitwigF = streamSetF bitwigUser
--     setBitwigS = streamSetS bitwigUser
--     setBitwigR = streamSetI bitwigUser
--     setBitwigB = streamSetB bitwigUser
-- :}
