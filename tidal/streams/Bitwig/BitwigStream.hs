:script /path/to/tidal/streams/Bitwig/BitwigOSCMap.hs

bwStream <- startStream defaultConfig bwOscMap

:{
let b           = streamReplace bwStream
    hush        = streamHush bwStream
    list        = streamList bwStream
    mute        = streamMute bwStream
    unmute      = streamUnmute bwStream
    solo        = streamSolo bwStream
    unsolo      = streamUnsolo bwStream
    once        = streamOnce bwStream
    first       = streamFirst bwStream
    asap        = once
    nudgeAll    = streamNudgeAll bwStream
    all         = streamAll bwStream
    resetCycles = streamResetCycles bwStream
    setcps      = asap . cps
    xfade i     = transition bwStream True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition bwStream True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition bwStream True (Sound.Tidal.Transition.histpan t) i
    wait i t    = transition bwStream True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition bwStream True (Sound.Tidal.Transition.waitT f t) i
    jump i      = transition bwStream True (Sound.Tidal.Transition.jump) i
    jumpIn i t  = transition bwStream True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition bwStream True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition bwStream True (Sound.Tidal.Transition.jumpMod t) i
    interpolate i     = transition bwStream True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition bwStream True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i          = transition bwStream True (Sound.Tidal.Transition.clutch) i
    clutchIn i t      = transition bwStream True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i      = transition bwStream True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t  = transition bwStream True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t         = transition bwStream False (Sound.Tidal.Transition.mortalOverlay t) i
    mortal i lifespan release = transition bwStream True (Sound.Tidal.Transition.mortal lifespan release) i
    b1  = b 1 . (|< orbit 0)
    b2  = b 2 . (|< orbit 1)
    b3  = b 3 . (|< orbit 2)
    b4  = b 4 . (|< orbit 3)
    b5  = b 5 . (|< orbit 4)
    b6  = b 6 . (|< orbit 5)
    b7  = b 7 . (|< orbit 6)
    b8  = b 8 . (|< orbit 7)
    b9  = b 9 . (|< orbit 8)
    b10 = b 10 . (|< orbit 9)
    b11 = b 11 . (|< orbit 10)
    b12 = b 12 . (|< orbit 11)
    b13 = b 13
    b14 = b 14
    b15 = b 15
    b16 = b 16
:}

-- :{
-- let setI = streamSetI bwStream
--     setF = streamSetF bwStream
--     setS = streamSetS bwStream
--     setR = streamSetR bwStream
--     setB = streamSetB bwStream
-- :}
