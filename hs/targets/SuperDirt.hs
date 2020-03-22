superDirt <- startTidal (superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cFrameTimespan = 1/20})

:{
let d = streamReplace superDirt
    -- Pattern state
    hush        = streamHush   superDirt
    list        = streamList   superDirt
    mute        = streamMute   superDirt
    unmute      = streamUnmute superDirt
    solo        = streamSolo   superDirt
    unsolo      = streamUnsolo superDirt
    -- Globals
    once        = streamOnce        superDirt
    asap        = once
    setcps      = asap . cps
    nudgeAll    = streamNudgeAll    superDirt
    all         = streamAll         superDirt
    resetCycles = streamResetCycles superDirt
    -- Transitions
    xfade i           = transition superDirt True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t       = transition superDirt True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t       = transition superDirt True (Sound.Tidal.Transition.histpan t) i
    wait i t          = transition superDirt True (Sound.Tidal.Transition.wait t) i
    waitT i f t       = transition superDirt True (Sound.Tidal.Transition.waitT f t) i
    jump i            = transition superDirt True (Sound.Tidal.Transition.jump) i
    jumpIn i t        = transition superDirt True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t       = transition superDirt True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t       = transition superDirt True (Sound.Tidal.Transition.jumpMod t) i
    interpolate i     = transition superDirt True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition superDirt True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i          = transition superDirt True (Sound.Tidal.Transition.clutch) i
    clutchIn i t      = transition superDirt True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i      = transition superDirt True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t  = transition superDirt True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t         = transition superDirt False (Sound.Tidal.Transition.mortalOverlay t) i
    mortal i lifespan release = transition superDirt True (Sound.Tidal.Transition.mortal lifespan release) i
    -- Default pattern IDs
    d1  = d  1 . (|< orbit  0) 
    d2  = d  2 . (|< orbit  1) 
    d3  = d  3 . (|< orbit  2) 
    d4  = d  4 . (|< orbit  3) 
    d5  = d  5 . (|< orbit  4) 
    d6  = d  6 . (|< orbit  5) 
    d7  = d  7 . (|< orbit  6) 
    d8  = d  8 . (|< orbit  7) 
    d9  = d  9 . (|< orbit  8)
    d10 = d 10 . (|< orbit  9)
    d11 = d 11 . (|< orbit 10)
    d12 = d 12 . (|< orbit 11)
    d13 = d 13
    d14 = d 14
    d15 = d 15
    d16 = d 16
:}

-- -- Single target setState
-- :{
-- let setTidalI = streamSetI superDirt
--     setTidalF = streamSetF superDirt
--     setTidalS = streamSetS superDirt
--     setTidalR = streamSetI superDirt
--     setTidalB = streamSetB superDirt
-- :}
