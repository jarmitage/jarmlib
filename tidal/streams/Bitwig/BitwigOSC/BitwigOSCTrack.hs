-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---track

-- Track OSC specs
:{
bwTrack = [--(OSC "/track/bank/{bankscroll}" $ ArgList []), -- {+,-} Scrolls bank by 1
           --(OSC "/track/bank/page/{bankpagescroll}" $ ArgList []), -- {+,-} Scrolls bank by 8
           -- (OSC "/track/{trackcolor}/color" $ ArgList []), --  rgb(r,g,b) with r,g,b = 0..255
           -- (OSC "/track/{trackscroll}" $ ArgList []), -- {+,-} Select the next/previous track
           -- (OSC "/track/vu {0,1} En-/Disable VU-Meter notifications
           -- (OSC "/track/toggleBank Toggles between the Audio/Instrument and Effect track bank
           (OSC "/track/add/{trackadd}" $ ArgList []), -- audio, effect, instrument
           (OSC "/track/{trackactivated}/activated" $ ArgList [("trackactivatedstate", Nothing)]), -- {0,1}
           (OSC "/track/{trackselect}/select" $ ArgList []),
           (OSC "/track/{trackvolume}/volume" $ ArgList [("trackvolumeval", Nothing)]), -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/volume/indicate {0,1}
           -- (OSC "/track/{1-8}/volume/reset
           -- (OSC "/track/{1-8}/volume/touched {0,1}
           (OSC "/track/{trackpan}/pan" $ ArgList [("trackpanval", Nothing)]), -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/pan/indicate {0,1}
           -- (OSC "/track/{1-8}/pan/reset
           -- (OSC "/track/{1-8}/pan/touched {0,1}
           (OSC "/track/{trackstate}/{trackstateprop}" $ ArgList [("trackstatepropval", Nothing)]), -- mute, solo, recarm {1,0,-}
           -- (OSC "/track/{1-8}/monitor"
           -- (OSC "/track/{1-8}/autoMonitor"
           -- (OSC "/track/{1-8}/crossfadeMode/{A,B,AB} {1}
           (OSC "/track/{tracksend}/send/{tracksendindex}/volume" $ ArgList [("tracksendvol", Nothing)]), -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/send/{1-8}/volume/indicate" -- {0,1}
           (OSC "/track/{trackclip}/clip/{trackclipindex}/{trackclipprop}" $ ArgList []), -- select, launch, record, remove
           -- (OSC "/track/{1-8}/clip/{1-8}/color" -- rgb(r,g,b) with r,g,b = 0..255
           (OSC "/track/{trackclipstop}/clip/stop" $ ArgList []),
           -- (OSC "/track/{1-8}/clip/returntoarrangement"
           (OSC "/track/{trackstop}/stop" $ ArgList [])]
           -- (OSC "/track/indicate/volume {0,1} Indicate the volumes of all 8 tracks
           -- (OSC "/track/indicate/pan {0,1} Indicate the pans of all 8 tracks
           -- (OSC "/track/indicate/send/{1-8} {0,1} Indicate send 1-8 of all 8 tracks
           -- (OSC "/track/selected/{attribute} (as above)
          -- ]
:}

-- Track params
:{
-- let bankscroll          = pS "bankscroll" -- {+,-} Scrolls bank by 1
    -- bankpagescroll      = pS "bankpagescroll" -- {+,-} Scrolls bank by 8
    -- trackscroll         = pS "trackscroll" -- {+,-} Select the next/previous track
let trackadd            = pS "trackadd"            -- audio, effect, instrument
    trackactivated      = pI "trackactivated"      -- {1-8} 
    trackactivatedstate = pI "trackactivatedstate" -- {0,1}
    trackselect         = pI "trackselect"         -- {1-8}
    trackvolume         = pI "trackvolume"         -- {1-8}
    trackvolumeval      = pF "trackvolumeval"      -- {0-MAX_VALUE}
    _trackpan           = pI "trackpan"            -- {1-8}
    trackpanval         = pF "trackpanval"         -- {0-MAX_VALUE}
    _trackstate         = pI "trackstate"          -- {1-8}
    trackstateprop      = pS "trackstatepop"       -- mute, solo, recarm
    trackstatepropval   = pS "trackstatepropval"   -- {1,0,-}
    tracksend           = pI "tracksend"           -- {1-8}
    tracksendindex      = pI "tracksendindex"      -- {1-8}
    _tracksendvol       = pF "tracksendvol"        -- {0-MAX_VALUE}
    _trackclip          = pI "trackclip"           -- {1-8}
    trackclipindex      = pI "trackclipindex"      -- {1-8}
    trackclipprop       = pS "trackclipprop"       -- select, launch, record, remove
    trackclipstop       = pI "trackclipstop"
    trackstop           = pI "trackstop"
:}

-- Track param shortcuts
:{
let trackactivate t s  = trackactivated t # trackactivatedstate s
    trackvol t v       = trackvolume t # trackvolumeval v
    trackpan t p       = _trackpan t   # trackpanval p
    trackstate t p v   = _trackstate t # trackstateprop p # trackstatepropval v
    trackmute   t      = _trackstate t # trackstateprop "mute" # trackstatepropval "1"
    trackunmute t      = _trackstate t # trackstateprop "mute" # trackstatepropval "0"
    tracksolo   t      = _trackstate t # trackstateprop "solo" # trackstatepropval "1"
    trackunsolo t      = _trackstate t # trackstateprop "solo" # trackstatepropval "0"
    trackrecarm t      = _trackstate t # trackstateprop "recarm" # trackstatepropval "1"
    trackunrecarm t    = _trackstate t # trackstateprop "recarm" # trackstatepropval "0"
    tracksendvol t s v = tracksend t # tracksendindex s # _tracksendvol v
    trackclip    t c p = _trackclip t # trackclipindex c # trackclipprop p -- select, launch, record, remove
    trackvol'     t (#) v  = trackvolume t # trackvolumeval v
    trackpan'     t (#) p  = _trackpan t # trackpanval p
    trackstate'   t (#) p (+) v = _trackstate t # trackstateprop p + trackstatepropval v
    tracksendvol' t (#) s (+) v = tracksend t # tracksendindex s + _tracksendvol v
    trackclip'    t (#) c (+) p = _trackclip t # trackclipindex c + trackclipprop p
:}