:{
bitwigTarget = OSCTarget {oName      = "Bitwig", 
                          oAddress   = "127.0.0.1", 
                          oPort      = 10000, 
                          oPath      = "/bitwig", 
                          oShape     = Nothing, 
                          oLatency   = 0.02, 
                          oPreamble  = [], 
                          oTimestamp = MessageStamp}
:}

bitwig <- startTidal bitwigTarget (defaultConfig {cFrameTimespan = 1/20})

:{
let b = streamReplace bitwig
    -- Pattern state
    hushB        = streamHush   bitwig
    listB        = streamList   bitwig
    muteB        = streamMute   bitwig
    unmuteB      = streamUnmute bitwig
    soloB        = streamSolo   bitwig
    unsoloB      = streamUnsolo bitwig
    -- Globals
    allB         = streamAll         bitwig
    onceB        = streamOnce        bitwig
    nudgeAllB    = streamNudgeAll    bitwig
    resetCyclesB = streamResetCycles bitwig
    -- -- Transitions
    -- xfade i           = transition bitwig True (Sound.Tidal.Transition.xfadeIn 4) i
    -- xfadeIn i t       = transition bitwig True (Sound.Tidal.Transition.xfadeIn t) i
    -- histpan i t       = transition bitwig True (Sound.Tidal.Transition.histpan t) i
    -- wait i t          = transition bitwig True (Sound.Tidal.Transition.wait t) i
    -- waitT i f t       = transition bitwig True (Sound.Tidal.Transition.waitT f t) i
    -- jump i            = transition bitwig True (Sound.Tidal.Transition.jump) i
    -- jumpIn i t        = transition bitwig True (Sound.Tidal.Transition.jumpIn t) i
    -- jumpIn' i t       = transition bitwig True (Sound.Tidal.Transition.jumpIn' t) i
    -- jumpMod i t       = transition bitwig True (Sound.Tidal.Transition.jumpMod t) i
    -- interpolate i     = transition bitwig True (Sound.Tidal.Transition.interpolate) i
    -- interpolateIn i t = transition bitwig True (Sound.Tidal.Transition.interpolateIn t) i
    -- clutch i          = transition bitwig True (Sound.Tidal.Transition.clutch) i
    -- clutchIn i t      = transition bitwig True (Sound.Tidal.Transition.clutchIn t) i
    -- anticipate i      = transition bitwig True (Sound.Tidal.Transition.anticipate) i
    -- anticipateIn i t  = transition bitwig True (Sound.Tidal.Transition.anticipateIn t) i
    -- forId i t         = transition bitwig False (Sound.Tidal.Transition.mortalOverlay t) i
    -- mortal i lifespan release = transition bitwig True (Sound.Tidal.Transition.mortal lifespan release) i
    -- Default pattern IDs
    b1  = b  1 . (|< orbit  0) 
    b2  = b  2 . (|< orbit  1) 
    b3  = b  3 . (|< orbit  2) 
    b4  = b  4 . (|< orbit  3) 
    b5  = b  5 . (|< orbit  4) 
    b6  = b  6 . (|< orbit  5) 
    b7  = b  7 . (|< orbit  6) 
    b8  = b  8 . (|< orbit  7) 
    b9  = b  9 . (|< orbit  8)
    b10 = b 10 . (|< orbit  9)
    b11 = b 11 . (|< orbit 10)
    b12 = b 12 . (|< orbit 11)
    b13 = b 13
    b14 = b 14
    b15 = b 15
    b16 = b 16
:}

-- -- Single target setState
-- :{
-- let setBitwigI = streamSetI bitwig
--     setBitwigF = streamSetF bitwig
--     setBitwigS = streamSetS bitwig
--     setBitwigR = streamSetI bitwig
--     setBitwigB = streamSetB bitwig
-- :}
