:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

import Sound.Tidal.Context

-- LiveCore Target
:{
lcTarget = Target {oName     = "Reaktor 6",
                   oAddress  = "127.0.0.1",
                   oPort     = 10000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
--                  oSchedule = Live
--                  oSchedule = Pre MessageStamp
                   oSchedule = Pre BundleStamp
                  }
:}


-- LiveCore OSC Specs
:{
lcOSCSpecs = [
              (OSC "/nanoosc/note" $ ArgList [("note", Nothing),
                                              ("gain", Just $ VF 1),
                                              ("gate", Just $ VF 1),
                                              ("lcexpression", Just $ VF 0),
                                              ("notechannel", Just $ VF 0),
                                              ("delay", Just $ VF 0),
                                              ("begin", Just $ VF 0),
                                              ("end", Just $ VF 1),
                                              ("delta", Just $ VF 0),
                                              ("cycle", Just $ VF 0),
                                              ("cps", Just $ VF 0)]),
              (OSC "/nanoosc/control" $ ArgList [("control", Nothing),
                                              ("controlchannel", Just $ VF 0),
                                              ("delay", Just $ VF 0),
                                              ("delta", Just $ VF 0),
                                              ("cycle", Just $ VF 0),
                                              ("cps", Just $ VF 0)]),
              (OSC "/nanoosc/sample" $ ArgList [("speed", Nothing),
                                                ("note", Just $ VF 0),
                                                ("notechannel", Just $ VF 0),
                                                ("begin", Just $ VF 0),
                                                ("end", Just $ VF 1),
                                                ("cycle", Just $ VF 0),
                                                ("cps", Just $ VF 0)]),
              (OSC "/nanoosc/select" $ ArgList [("lcselect", Nothing),
                                                ("gain", Just $ VF 1),
                                                ("selectchannel", Just $ VF 0),
                                                ("delta", Just $ VF 0),
                                                ("cycle", Just $ VF 0),
                                                ("cps", Just $ VF 0)]),
              (OSC "/nanoosc/clock" $ ArgList [("lcclock", Nothing),
                                               ("timespan", Just $ VF (1/20)),
                                               ("cycle", Just $ VF 0),
                                               ("cps",   Just $ VF 0)])]
:}

-- LiveCore pattern parameters
:{
let lcnotenumber      = pI "lcnotenumber"    -- pattern int
    lcnotevelocity    = pF "lcnotevelocity"  -- pattern float
    lcnoteduration    = pF "lcnoteduration"  -- pattern float
    lcexpression      = pF "lcexpression"   -- pattern float
    lcchannel         = pI "lcchannel"   -- pattern int
    lccontrolvalue    = pF "lccontrolvalue"  -- pattern float
    lcselect          = pI "lcselect"   -- pattern int
    lcselectlevel     = pF "lcselectlevel"   -- pattern float
    lcsampleselect    = pI "lcsampleselect"    -- pattern string
    lcclock           = pI "lcclock"         -- pattern string
    notechannel       = pI "notechannel" -- pattern int
    controlchannel    = pI "controlchannel" -- pattern int
    selectchannel     = pI "selectchannel" -- pattern int
:}


-- LiveCore pattern parameter shorthands
:{
let lcn n v d e c = note n # gain v # gate d # lcexpression e # notechannel c
    lcn_ n c = note n # gain 0.5 # gate 0.5 # lcexpression 0 # notechannel c
    lcc v c   = control v # controlchannel c
    lcn' n (#) v (+) d e c = note n # gain v + gate d # lcexpression e # notechannel c
    lccc c v = control v # controlchannel c
:}


-- LiveCore OSC Map
:{
lcOscMap = [(superdirtTarget, [superdirtShape]),
            (lcTarget, lcOSCSpecs)]
:}

-- LiveCore Stream
stream <- startStream defaultConfig {cFrameTimespan = 1/200} lcOscMap

-- Stream Control
:{
let p           = streamReplace     stream
    hush        = streamHush        stream
    list        = streamList        stream
    mute        = streamMute        stream
    unmute      = streamUnmute      stream
    solo        = streamSolo        stream
    unsolo      = streamUnsolo      stream
    once        = streamOnce        stream
    first       = streamFirst       stream
    nudgeAll    = streamNudgeAll    stream
    all         = streamAll         stream
    resetCycles = streamResetCycles stream
    asap        = once
    setcps      = asap . cps
:}

-- Stream Transitions
:{
let xfade i           = transition stream True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t       = transition stream True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t       = transition stream True (Sound.Tidal.Transition.histpan t) i
    wait i t          = transition stream True (Sound.Tidal.Transition.wait t) i
    waitT i f t       = transition stream True (Sound.Tidal.Transition.waitT f t) i
    jump i            = transition stream True (Sound.Tidal.Transition.jump) i
    jumpIn i t        = transition stream True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t       = transition stream True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t       = transition stream True (Sound.Tidal.Transition.jumpMod t) i
    interpolate i     = transition stream True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition stream True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i          = transition stream True (Sound.Tidal.Transition.clutch) i
    clutchIn i t      = transition stream True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i      = transition stream True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t  = transition stream True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t         = transition stream False (Sound.Tidal.Transition.mortalOverlay t) i
    mortal i lifespan release = transition stream True (Sound.Tidal.Transition.mortal lifespan release) i
:}

-- Stream default orbits
:{
let p1  = p 1 . (|< orbit 0)
    p2  = p 2 . (|< orbit 1)
    p3  = p 3 . (|< orbit 2)
    p4  = p 4 . (|< orbit 3)
    p5  = p 5 . (|< orbit 4)
    p6  = p 6 . (|< orbit 5)
    p7  = p 7 . (|< orbit 6)
    p8  = p 8 . (|< orbit 7)
    p9  = p 9 . (|< orbit 8)
    p10 = p 10 . (|< orbit 9)
    p11 = p 11 . (|< orbit 10)
    p12 = p 12 . (|< orbit 11)
    p13 = p 13
    p14 = p 14
    p15 = p 15
    p16 = p 16
:}

-- Stream shared variables
:{
let setI = streamSetI stream
    setF = streamSetF stream
    setS = streamSetS stream
    setR = streamSetR stream
    setB = streamSetB stream
:}

:set prompt "~ "
