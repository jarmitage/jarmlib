:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

import Sound.Tidal.Context

:{
let oscBundle = [("delta", Just $ VF 0),
                 ("cycle", Just $ VF 0),
                 ("cps", Just $ VF 0)]
    oscMessage = [("sec", Just $ VF 0),
                  ("usec", Just $ VF 0)]
:}

let sdOscMap = (superdirtTarget, [superdirtShape])

-- LiveCore Targets
:{
oPorts = [ 10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007 ]
lcTarget0 = Target {oName     = "Reaktor 6",
                    oAddress  = "127.0.0.1",
                    oPort     = oPorts!!0,
                    oLatency  = 0.5,
                    oWindow   = Nothing,
                    oSchedule = Pre BundleStamp
                   }
lcTarget1 = lcTarget0 { oPort = oPorts!!1 }
lcTarget2 = lcTarget0 { oPort = oPorts!!2 }
lcTarget3 = lcTarget0 { oPort = oPorts!!3 }
lcTarget4 = lcTarget0 { oPort = oPorts!!4 }
lcTarget5 = lcTarget0 { oPort = oPorts!!5 }
lcTarget6 = lcTarget0 { oPort = oPorts!!6 }
lcTarget7 = lcTarget0 { oPort = oPorts!!7 }
:}

-- LiveCore Target parameters and shortcut
:{
let _lcT0 = [("target0", Nothing)]
    _lcT1 = [("target1", Nothing)]
    _lcT2 = [("target2", Nothing)]
    _lcT3 = [("target3", Nothing)]
    _lcT4 = [("target4", Nothing)]
    _lcT5 = [("target5", Nothing)]
    _lcT6 = [("target6", Nothing)]
    _lcT7 = [("target7", Nothing)]
    _target0 = pF "target0"
    _target1 = pF "target1"
    _target2 = pF "target2"
    _target3 = pF "target3"
    _target4 = pF "target4"
    _target5 = pF "target5"
    _target6 = pF "target6"
    _target7 = pF "target7"
    t0 = _target0 1
    t1 = _target1 1
    t2 = _target2 1
    t3 = _target3 1
    t4 = _target4 1
    t5 = _target5 1
    t6 = _target6 1
    t7 = _target7 1
:}

-- Messages, 
-- SAM-Nano OSC Sample Player Megakit
:{
let note2Path = "/nanoosc/note2"
    note2Args = [("note",          Just $ VF 0),   -- 00
                 ("noteexp",       Just $ VF 0),   -- 01
                 ("gain",          Just $ VF 1),   -- 02
                 ("pan",           Just $ VF 0.5), -- 03
                 ("speed",         Just $ VF 1),   -- 04
                 ("pitch",         Just $ VF 0),   -- 05
                 ("gate",          Just $ VF 1),   -- 06
                 ("begin",         Just $ VF 0),   -- 07
                 ("end",           Just $ VF 1),   -- 08
                 ("attack",        Just $ VF 0),   -- 19
                 ("decay",         Just $ VF 0.1), -- 10
                 ("sustain",       Just $ VF 1),   -- 11
                 ("release",       Just $ VF 0.1), -- 12
                 ("high",          Just $ VF 0),   -- 13
                 ("midgain",       Just $ VF 0),   -- 14
                 ("midfreq",       Just $ VF 1e3), -- 15
                 ("low",           Just $ VF 0),   -- 16
                 ("fxmode",        Just $ VF 0),   -- 17
                 ("fxdepth",       Just $ VF 0),   -- 18
                 ("delay",         Just $ VF 0),   -- 29
                 ("delaytime",     Just $ VF 1),   -- 20
                 ("delayfeedback", Just $ VF 0),   -- 21
                 ("reverbdepth",   Just $ VF 0),   -- 22
                 ("reverbsize",    Just $ VF 0),   -- 23
                 ("bank",          Just $ VI 0),   -- 24
                 ("notechan",      Just $ VI 0),   -- 25
                 ("notedelay",     Just $ VI 0)]   -- 26
    noteexp     = pF "noteexp"
    pitch       = pF "pitch"
    gate        = pF "gate"
    high        = pF "high"
    midgain     = pF "midgain"
    midfreq     = pF "midfreq"
    low         = pF "low"
    fxmode      = pF "fxmode"
    fxdepth     = pF "fxdepth"
    reverbdepth = pF "reverbdepth"
    reverbsize  = pF "reverbsize"
    bank        = pF "bank"
    notechan    = pF "notechan"
    notedelay   = pF "notedelay"
:}

-- UTL-Nano OSC Note
:{
let notePath = "/nanoosc/note"
    noteArgs = [("note", Nothing),
                ("gain", Just $ VF 1),
                ("gate", Just $ VF 1),
                ("noteexp", Just $ VF 0),
                ("bank", Just $ VF 0),
                ("notechan", Just $ VF 0),
                ("delay", Just $ VF 0),
                ("begin", Just $ VF 0),
                ("end", Just $ VF 1)]
:}

-- UTL-Nano OSC Control
:{
let ctlPath = "/nanoosc/control"
    ctlArgs = [("control", Nothing),
               ("controlchannel", Just $ VF 0),
               ("delay", Just $ VF 0)]
    control        = pF "control"
    controlchannel = pF "controlchannel"
:}

-- SAM-Nano OSC Sample Player (?)
:{
let samplePath = "/nanoosc/sample"
    sampleArgs = [("speed", Nothing),
                  ("note", Just $ VF 0),
                  ("notechannel", Just $ VF 0),
                  ("begin", Just $ VF 0),
                  ("cycle", Just $ VF 0),
                  ("cps", Just $ VF 0)]
:}

-- UTL-Nano OSC Matrix
:{
let matrixPath = "/nanoosc/select"
    matrixArgs = [("matrix", Nothing),
                  ("matrixdepth", Just $ VF 1),
                  ("matrixchannel", Just $ VF 0)]
    matrixinput  = pF "matrix"
    matrixdepth  = pF "matrixdepth"
    matrixoutput = pF "matrixchannel"
:}

-- UTL-Nano OSC Matrix (?)
:{
let patchPath = "/nanoosc/patch"
    patchArgs = [("patch", Nothing),
                 ("patchinput", Just $ VF 1),
                 ("patchoutput", Just $ VF 0),
                 ("patchdepth", Just $ VF 0)]
    patch       = pF "patch"
    patchinput  = pF "patchinput"
    patchoutput = pF "patchoutput"
    patchdepth  = pF "patchdepth"
:}

-- UTL-Nano OSC Clock (?)
:{
let clockPath = "/nanoosc/clock"
    clockArgs = [("lcclock", Nothing),
                 ("timespan", Just $ VF (1/20)),
                 ("cycle", Just $ VF 0),
                 ("cps",   Just $ VF 0)]
    lcclock = pF "lcclock"
:}

-- lcOSCSpecs
-- LiveCore OSC Spec template
:{
lcOSCSpec t = [OSC note2Path  $ ArgList $ note2Args++oscBundle++t,
               OSC notePath   $ ArgList $ noteArgs++oscBundle++t,
               OSC ctlPath    $ ArgList $ ctlArgs++oscBundle++t,
               OSC samplePath $ ArgList $ sampleArgs++t,
               OSC matrixPath $ ArgList $ matrixArgs++oscBundle++t,
               OSC patchPath  $ ArgList $ patchArgs++oscBundle++t,
               OSC clockPath  $ ArgList $ clockArgs++t]
:}

-- OSC Specs for targets 0-7
lcOSCSpec0 = lcOSCSpec _lcT0
lcOSCSpec1 = lcOSCSpec _lcT1
lcOSCSpec2 = lcOSCSpec _lcT2
lcOSCSpec3 = lcOSCSpec _lcT3
lcOSCSpec4 = lcOSCSpec _lcT4
lcOSCSpec5 = lcOSCSpec _lcT5
lcOSCSpec6 = lcOSCSpec _lcT6
lcOSCSpec7 = lcOSCSpec _lcT7


-- Block mappings
-- SAM-Nano OSC Sample Player Megakit: Sample Kits
:{
kitN "old1"    = 0
kitN "old2"    = 1
kitN "fm1"     = 2
kitN "fm2"     = 3
kitN "fm3"     = 4
kitN "trap1"   = 5
kitN "trap2"   = 6
kitN "trap3"   = 7
kitN "bass"    = 8
kitN "bs"      = 8
kitN "chords"  = 9
kitN "stabs"   = 10
kitN "notes"   = 11
kitN "ins"     = 12
kitN "voxriff" = 13
kitN "vox"     = 14
kitN "fx"      = 15
kit = bank . (kitN <$>)
:}

-- SAM-Nano OSC Sample Player Megakit: FX Modes
:{
fxmodeN "compression" = 0
fxmodeN "comp"        = 0
fxmodeN "saturation"  = 1
fxmodeN "sat"         = 1
fxmodeN "distortion"  = 2
fxmodeN "dist"        = 2
fxmodeN "lofi"        = 3
fxmodeN "phaser"      = 4
fxmodeN "chorus"      = 5
fxmodeN "tremolo"     = 6
fxmodeN "trem"        = 6
fxmodeN "exciter"     = 7
fxm = fxmode . (fxmodeN <$>)
:}

-- SEQ-Nano Position Effects
:{
posfxmch = 0 -- position FX mode controlchannel
posfxdch = 1 -- position FX depth controlchannel
posfxmodes = 13
posfxmN "no"      = 0
posfxmN "fast"    = 1/posfxmodes
posfxmN "loop"    = 2/posfxmodes
posfxmN "clip"    = 3/posfxmodes
posfxmN "xdown"   = 4/posfxmodes
posfxmN "xup"     = 5/posfxmodes
posfxmN "rev"     = 6/posfxmodes
posfxmN "ping"    = 7/posfxmodes
posfxmN "pong"    = 8/posfxmodes
posfxmN "jitter"  = 9/posfxmodes
posfxmN "jit"     = 9/posfxmodes
posfxmN "rand"    = 10/posfxmodes
posfxmN "pattern" = 11/posfxmodes
posfxmN "pat"     = 11/posfxmodes
posfxmN "randrev" = 12/posfxmodes
posfxmN "repeat"  = 13/posfxmodes
posfxmN "rep"     = 13/posfxmodes
_posfxm = control . (posfxmN <$>)
:}

-- Shorthands
-----------------
-- Messages
-----------------

-- SAM-Nano OSC Sample Player Megakit
-- UTL-Nano OSC Note
:{
let notechannel = notechan
    notech      = notechan
    notec       = notechan
    notedel     = notedelay
    noted       = notedelay
    notex       = noteexp
    mid     f g     = midfreq f # midgain g
    mid'    f (#) g = midfreq f # midgain g
    midhigh mf mg h = mid mf mg # high h
    lowmid  l mf mg = low l # mid mf mg
    lowhigh l h     = low l # high h
    lowmidhigh l mf mg h = low l # mid mf mg # high h
    mh  = midhigh
    lm  = lowmid
    lh  = lowhigh
    lmh = lowmidhigh
    rvbs = reverbsize
    rvbd = reverbdepth
    rvbsd s d = reverbsize  s # reverbdepth d
    rvbds d s = reverbdepth d # reverbsize  s
    rvbsd' s (+) d = reverbsize s + reverbdepth d
    rvbds' d (+) s = reverbdepth d + reverbsize s
:}

-- UTL-Nano OSC Control
:{
let ctl c ch = control c # controlchannel ch
    ctl' c (#) ch = control c # controlchannel ch
:}

-- UTL-Nano OSC Matrix
-- :{
-- let mxi = matrixinput
--     mxd = matrixdepth
--     mxo = matrixoutput
--     mxio i o = mxi i # mxo o
--     mxio' i (#) o = mxi i # mxo o
--     mxido i d o = mxi i # mxd d # mxo o
--     mxido' i (#) d (+) o = mxi i (#) mxd d (+) mxo o
-- :}

-- UTL-Nano OSC Matrix (?)
:{
let mxi = patchinput
    mxd = patchdepth
    mxo = patchoutput
    mxio   i o     = mxi i # mxo o
    mxido  i d o   = mxi i # mxd d # mxo o
    mxio'  i (#) o = mxi i # mxo o
    -- mxido' i (+) d (-) o = mxi i (+) mxd d (-) mxo o
:}

-- UTL-Nano OSC Clock (?)
:{
let clock = lcclock 1
:}

-----------------
-- Block Mappings
-----------------

-- SAM-Nano OSC Sample Player Megakit: Sample Kits
:{
let k = kit
    k0 n_ p      = note n_ # k p # notec 0
    k1 n_ p      = note n_ # k p # notec 1
    k2 n_ p      = note n_ # k p # notec 2
    k3 n_ p      = note n_ # k p # notec 3
    k4 n_ p      = note n_ # k p # notec 4
    k5 n_ p      = note n_ # k p # notec 5
    k6 n_ p      = note n_ # k p # notec 6
    k7 n_ p      = note n_ # k p # notec 7
    k0' n_ (+) p = note n_ + k p # notec 0
    k1' n_ (+) p = note n_ + k p # notec 1
    k2' n_ (+) p = note n_ + k p # notec 2
    k3' n_ (+) p = note n_ + k p # notec 3
    k4' n_ (+) p = note n_ + k p # notec 4
    k5' n_ (+) p = note n_ + k p # notec 5
    k6' n_ (+) p = note n_ + k p # notec 6
    k7' n_ (+) p = note n_ + k p # notec 7
:}

-- SAM-Nano OSC Sample Player Megakit: FX Modes
:{
let fxd = fxdepth
    fx m d = fxm m # fxd d
    fx' m (+) d = fxm m + fxd d
:}

-- SEQ-Nano Position Effects
:{
let posfxm m  = _posfxm m # controlchannel posfxmch -- string version
    posfxd d  = ctl d posfxdch
    posfx m d = stack [posfxm m, posfxd d]   -- string version
    posfx' m d = stack [posfxm' m, posfxd d] -- numerical version
    posfxm' m  = ctl (m/posfxmodes) posfxmch -- numerical version
:}

-- LiveCore OSC Map
:{
lcOscMap = [(lcTarget0, lcOSCSpec0),
            (lcTarget1, lcOSCSpec1),
            (lcTarget2, lcOSCSpec2),
            (lcTarget3, lcOSCSpec3),
            (lcTarget4, lcOSCSpec4),
            (lcTarget5, lcOSCSpec5),
            (lcTarget6, lcOSCSpec6),
            (lcTarget7, lcOSCSpec7)]
:}

:{
let oscMap = lcOscMap
:}
-- :{
-- let oscMap = lcOSCMap++[sdOscMap
--         --,bwOscMap
--         --,brOscMap
--         --,cvOscMap
--         --,ascOscMap
--         ]
-- :}

stream <- startStream defaultConfig {cFrameTimespan = 1/100} oscMap

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
