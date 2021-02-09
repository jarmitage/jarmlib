-- SAM-Nano OSC Sample Player Megakit
:{
let note2Path = "/nanoosc/note2"
    note2Args = [("note",          Nothing),       -- 00
                 ("noteexp",       Just $ VF 0),   -- 01
                 ("gain",          Just $ VF 1),   -- 02
                 ("pan",           Just $ VF 0.5), -- 03
                 ("speed",         Just $ VF 1),   -- 04
                 ("pitch",         Just $ VF 0),   -- 05
                 ("legato",        Just $ VF 1),   -- 06
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
    noteArgs = [("note",     Nothing),     -- 00
                ("gain",     Just $ VF 1), -- 01
                ("gate",     Just $ VF 1), -- 02
                ("noteexp",  Just $ VF 0), -- 03
                ("bank",     Just $ VF 0), -- 04
                ("notechan", Just $ VF 0), -- 05
                ("delay",    Just $ VF 0), -- 06
                ("begin",    Just $ VF 0), -- 07
                ("end",      Just $ VF 1)] -- 08
:}

-- UTL-Nano OSC Control
:{
let ctlPath = "/nanoosc/control"
    ctlArgs = [("control",        Nothing),     -- 00
               ("controlchannel", Just $ VF 0), -- 01
               ("delay",          Just $ VF 0)] -- 02
    control        = pF "control"
    controlchannel = pF "controlchannel"
:}

-- SAM-Nano OSC Sample Player (?)
:{
let samplePath = "/nanoosc/sample"
    sampleArgs = [("speed",       Nothing),     -- 00
                  ("note",        Just $ VF 0), -- 01
                  ("notechannel", Just $ VF 0), -- 02
                  ("begin",       Just $ VF 0), -- 03
                  ("cycle",       Just $ VF 0), -- 04
                  ("cps",         Just $ VF 0)] -- 05
:}

-- UTL-Nano OSC Matrix
:{
let patchPath = "/nanoosc/patch"
    patchArgs = [("patch",       Nothing),     -- 00
                 ("patchinput",  Just $ VF 1), -- 01
                 ("patchoutput", Just $ VF 0), -- 02
                 ("patchdepth",  Just $ VF 0)] -- 03
    patch       = pF "patch"
    patchinput  = pF "patchinput"
    patchoutput = pF "patchoutput"
    patchdepth  = pF "patchdepth"
:}

-- UTL-Nano OSC Clock
:{
let clockPath = "/nanoosc/clock"
    clockArgs = [("lcclock",  Nothing),           -- 00
                 ("timespan", Just $ VF (1/240)), -- 01
                 ("cycle", Just $ VF 0),          -- 02
                 ("cps",   Just $ VF 0)]          -- 03
    lcclock = pF "lcclock"
:}
