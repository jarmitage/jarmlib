-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---play

-- Virtual keyboard OSC Specs
:{
bwMIDI = [(OSC "/vkb_midi/{vkbnotech}/note/{vkbnote}" $ ArgList [("vkbnotevelocity", Nothing)]), -- {Velocity:0-127}
          -- (OSC "/vkb_midi/{Channel:1-16}/note/+" -- 1 octave up
          -- (OSC "/vkb_midi/{Channel:1-16}/note/-" -- 1 octave down
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/{Note:0-127} {Velocity:0-127}
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/+ 1 drum octave up
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/- 1 drum octave down
          (OSC "/vkb_midi/{vkbccch}/cc/{vkbccn}" $ ArgList [("vkbccv", Nothing)]), -- {Value:0-127}
          (OSC "/vkb_midi/{vkbpatch}/aftertouch/{vkbpat}" $ ArgList [("vkbpatpr", Nothing)]), -- {Pressure:0-127} Sends Poly Aftertouch
          -- (OSC "/vkb_midi/{Channel:1-16}/aftertouch {Pressure:0-127} Sends Channel Aftertouch
          (OSC "/vkb_midi/{vkbpbch}/pitchbend" $ ArgList [("vkbpb", Nothing)])] -- {Pitch:0-127 (No-Bend:64)}
          -- (OSC "/vkb_midi/velocity {0-127 (0 disables fixed velocity, 1-127 fixes the velocity to the value)}
          -- (OSC "/vkb_midi/noterepeat/isActive {0,1} Turn on/off
          -- (OSC "/vkb_midi/noterepeat/period {1/4, 1/4t, 1/8, 1/8t, 1/16, 1/16t, 1/32, 1/32t} The repeat period
          -- (OSC "/vkb_midi/noterepeat/length {1/4, 1/4t, 1/8, 1/8t, 1/16, 1/16t, 1/32, 1/32t} The note length
:}

-- bwMidi   = OSC "/vkb_midi/{channel}/{action}/{value}" $ ArgList [("value", Just $ VI 0)]
-- bwMidiCC = OSC "/vkb_midi/{channel}/{action}/{channel}/{value}" $ ArgList [("value", Just $ VI 0)]

-- Virtual keyboard params
:{
let vkbnotech       = pI "vkbnotech"       -- vkb note channel {1-16}
    vkbnote         = pI "vkbnote"         -- vkb note number {0-127}
    vkbnotevelocity = pI "vkbnotevelocity" -- vkb note velocity {0-127}
    vkbccch         = pI "vkbccch"         -- vkb cc channel {1-16}
    vkbccn          = pI "vkbccn"          -- vkb cc number {0-127}
    vkbccv          = pI "vkbccv"          -- vkb cc value {0-127}
    vkbpatch        = pI "vkbpatch"        -- vkb poly aftertouch channel {1-16}
    _vkbpat         = pI "vkbpat"          -- vkb poly aftertouch note number {0-127}
    vkbpatpr        = pI "vkbpatpr"        -- vkb poly aftertouch note pressure {0-127}
    vkbpbch         = pI "vkbpbch"         -- vkb channel pitch bend channel {1-16}
    _vkbpb          = pI "vkbpb"           -- vkb channel pitch bend value {0-127}
:}

-- Virtual keyboard shorthands
:{
let vkbn   c n v = vkbnotech c # vkbnote n # vkbnotevelocity v
    vkbcc  c n v = vkbccch   c # vkbccn n  # vkbccv v
    vkbat  c n p = vkbpatch  c # _vkbpat n # vkbpatpr p
    vkbpb  c b   = vkbpbch   c # _vkbpb b
    vkbn'  c (#) n (+) v = vkbnotech c # vkbnote n + vkbnotevelocity v
    vkbcc' c (#) n (+) v = vkbccch   c # vkbccn  n + vkbccv v
    vkbat' c (#) n (+) p = vkbpatch  c # _vkbpat n + vkbpatpr p
    vkbpb' c (#) b = vkbpbch c # _vkbpb b
:}
