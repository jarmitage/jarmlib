:{
bitwigGridTarget = OSCTarget {oName      = "Bitwig", 
                              oAddress   = "127.0.0.1", 
                              oPort      = 10002, 
                              oPath      = "/grid", 
                              oShape     = Nothing, 
                              oLatency   = 0.02, 
                              oPreamble  = [], 
                              oTimestamp = MessageStamp}
:}

bitwigGrid <- startTidal bitwigGridTarget (defaultConfig {cFrameTimespan = 1/20})

:{
let g = streamReplace bitwigGrid
    -- Pattern state
    hushG        = streamHush   bitwigGrid
    listG        = streamList   bitwigGrid
    muteG        = streamMute   bitwigGrid
    unmuteG      = streamUnmute bitwigGrid
    soloG        = streamSolo   bitwigGrid
    unsoloG      = streamUnsolo bitwigGrid
    -- Globals
    allG         = streamAll         bitwigGrid
    onceG        = streamOnce        bitwigGrid
    nudgeAllG    = streamNudgeAll    bitwigGrid
    resetCyclesG = streamResetCycles bitwigGrid
    -- -- Transitions
    -- xfade i           = transition bitwigGrid True (Sound.Tidal.Transition.xfadeIn 4) i
    -- xfadeIn i t       = transition bitwigGrid True (Sound.Tidal.Transition.xfadeIn t) i
    -- histpan i t       = transition bitwigGrid True (Sound.Tidal.Transition.histpan t) i
    -- wait i t          = transition bitwigGrid True (Sound.Tidal.Transition.wait t) i
    -- waitT i f t       = transition bitwigGrid True (Sound.Tidal.Transition.waitT f t) i
    -- jump i            = transition bitwigGrid True (Sound.Tidal.Transition.jump) i
    -- jumpIn i t        = transition bitwigGrid True (Sound.Tidal.Transition.jumpIn t) i
    -- jumpIn' i t       = transition bitwigGrid True (Sound.Tidal.Transition.jumpIn' t) i
    -- jumpMod i t       = transition bitwigGrid True (Sound.Tidal.Transition.jumpMod t) i
    -- interpolate i     = transition bitwigGrid True (Sound.Tidal.Transition.interpolate) i
    -- interpolateIn i t = transition bitwigGrid True (Sound.Tidal.Transition.interpolateIn t) i
    -- clutch i          = transition bitwigGrid True (Sound.Tidal.Transition.clutch) i
    -- clutchIn i t      = transition bitwigGrid True (Sound.Tidal.Transition.clutchIn t) i
    -- anticipate i      = transition bitwigGrid True (Sound.Tidal.Transition.anticipate) i
    -- anticipateIn i t  = transition bitwigGrid True (Sound.Tidal.Transition.anticipateIn t) i
    -- forId i t         = transition bitwigGrid False (Sound.Tidal.Transition.mortalOverlay t) i
    -- mortal i lifespan release = transition bitwigGrid True (Sound.Tidal.Transition.mortal lifespan release) i
    -- Default pattern IDs
    g1  = g  1 . (|< orbit  0) 
    g2  = g  2 . (|< orbit  1) 
    g3  = g  3 . (|< orbit  2) 
    g4  = g  4 . (|< orbit  3) 
    g5  = g  5 . (|< orbit  4) 
    g6  = g  6 . (|< orbit  5) 
    g7  = g  7 . (|< orbit  6) 
    g8  = g  8 . (|< orbit  7) 
    g9  = g  9 . (|< orbit  8)
    g10 = g 10 . (|< orbit  9)
    g11 = g 11 . (|< orbit 10)
    g12 = g 12 . (|< orbit 11)
    g13 = g 13
    g14 = g 14
    g15 = g 15
    g16 = g 16
:}

-- :{
-- let setGridI = streamSetI bitwigGrid
--     setGridF = streamSetF bitwigGrid
--     setGridS = streamSetS bitwigGrid
--     setGridR = streamSetI bitwigGrid
--     setGridB = streamSetB bitwigGrid
-- :}
