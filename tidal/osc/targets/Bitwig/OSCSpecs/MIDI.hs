-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---play

-- Virtual keyboard OSC Specs
:{
bwMIDI = [OSC "/vkb_midi/{vkbnotech}/note/{vkbnote}" $ ArgList [("vkbnotevel", Nothing)], -- {Velocity:0-127}
          -- (OSC "/vkb_midi/{Channel:1-16}/note/+" -- 1 octave up
          -- (OSC "/vkb_midi/{Channel:1-16}/note/-" -- 1 octave down
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/{Note:0-127} {Velocity:0-127}
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/+ 1 drum octave up
          -- (OSC "/vkb_midi/{Channel:1-16}/drum/- 1 drum octave down
          OSC "/vkb_midi/{vkbccch}/cc/{vkbccn}" $ ArgList [("vkbccv", Nothing)], -- {Value:0-127}
          OSC "/vkb_midi/{vkbpatch}/aftertouch/{vkbpat}" $ ArgList [("vkbpatpr", Nothing)], -- {Pressure:0-127} Sends Poly Aftertouch
          -- (OSC "/vkb_midi/{Channel:1-16}/aftertouch {Pressure:0-127} Sends Channel Aftertouch
          OSC "/vkb_midi/{vkbpbch}/pitchbend" $ ArgList [("vkbpb", Nothing)]] -- {Pitch:0-127 (No-Bend:64)}
          -- (OSC "/vkb_midi/velocity {0-127 (0 disables fixed velocity, 1-127 fixes the velocity to the value)}
          -- (OSC "/vkb_midi/noterepeat/isActive {0,1} Turn on/off
          -- (OSC "/vkb_midi/noterepeat/period {1/4, 1/4t, 1/8, 1/8t, 1/16, 1/16t, 1/32, 1/32t} The repeat period
          -- (OSC "/vkb_midi/noterepeat/length {1/4, 1/4t, 1/8, 1/8t, 1/16, 1/16t, 1/32, 1/32t} The note length
:}

-- Virtual keyboard params
:{
let bwnotech = pI "vkbnotech"  . ((max 1 . (+ 1) ) <$>)  -- note channel                  {1-BANK_PAGE_SIZE}
    bwccch   = pI "vkbccch"    . ((max 1 . (+ 1) ) <$>)  -- cc channel                    {1-BANK_PAGE_SIZE}
    bwpatch  = pI "vkbpatch"   . ((max 1 . (+ 1) ) <$>)  -- poly aftertouch channel       {1-BANK_PAGE_SIZE}
    bwpbch   = pI "vkbpbch"    . ((max 1 . (+ 1) ) <$>)  -- channel pitch bend channel    {1-BANK_PAGE_SIZE}
    bwnote   = pI "vkbnote"    . (min 127 . (max 0 <$>)) -- note number                   {0-127}
    bwccn    = pI "vkbccn"     . (min 127 . (max 0 <$>)) -- cc number                     {0-127}
    bwpat    = pI "vkbpat"     . (min 127 . (max 0 <$>)) -- poly aftertouch note number   {0-127}
    bwvel    = pI "vkbnotevel" . (min 127 . (max 0 <$>)) -- note velocity                 {0-127}
    bwccv    = pI "vkbccv"     . (min 127 . (max 0 <$>)) -- cc value                      {0-127}
    bwpatpr  = pI "vkbpatpr"   . (min 127 . (max 0 <$>)) -- poly aftertouch note pressure {0-127}
    _bwpb    = pI "vkbpb"      . (min 127 . (max 0 <$>)) -- channel pitch bend value      {0-127}
    bwnch    = bwnotech
    bwv      = bwvel
:}

toM val = round <$> range 0 127 val

-- Virtual keyboard shorthands
:{
let bwn   c n v = bwnote n # bwv     (toM v) # bwnch   c
    bwcc  c n v = bwccn  n # bwccv   (toM v) # bwccch  c
    bwat  c n p = bwpat  n # bwpatpr (toM p) # bwpatch c
    bwn'  c (#) n (+) v = bwnch    c # bwnote n + bwv     (toM v)
    bwcc' c (#) n (+) v = bwccch   c # bwccn  n + bwccv   (toM v)
    bwat' c (#) n (+) p = bwpatch  c # bwpat  n + bwpatpr (toM p)
    bwpb  c     b = _bwpb (toM b) # bwpbch c
    bwpb' c (#) b = _bwpb (toM b) # bwpbch c
:}
