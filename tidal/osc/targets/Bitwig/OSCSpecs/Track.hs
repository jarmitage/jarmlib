-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---track

-- Track OSC specs
:{
bwTrack = [--(OSC "/track/bank/{bankscroll}" $ ArgList []), -- {+,-} Scrolls bank by 1
           --(OSC "/track/bank/page/{bankpagescroll}" $ ArgList []), -- {+,-} Scrolls bank by 8
           -- (OSC "/track/{trackcolor}/color" $ ArgList []), --  rgb(r,g,b) with r,g,b = 0..255
           -- (OSC "/track/{trackscroll}" $ ArgList []), -- {+,-} Select the next/previous track
           -- (OSC "/track/vu {0,1} En-/Disable VU-Meter notifications
           -- (OSC "/track/toggleBank Toggles between the Audio/Instrument and Effect track bank
           OSC "/track/add/{trackadd}" $ ArgList [], -- audio, effect, instrument
           OSC "/track/{trackactivated}/activated" $ ArgList [("trackactivatedstate", Nothing)], -- {0,1}
           OSC "/track/{trackselect}/select" $ ArgList [],
           OSC "/track/{trackvolume}/volume" $ ArgList [("trackvolumeval", Nothing)], -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/volume/indicate {0,1}
           -- (OSC "/track/{1-8}/volume/reset
           -- (OSC "/track/{1-8}/volume/touched {0,1}
           OSC "/track/{trackpan}/pan" $ ArgList [("trackpanval", Nothing)], -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/pan/indicate {0,1}
           -- (OSC "/track/{1-8}/pan/reset
           -- (OSC "/track/{1-8}/pan/touched {0,1}
           OSC "/track/{trackstate}/{trackstateprop}" $ ArgList [("trackstatepropval", Nothing)], -- mute, solo, recarm {1,0,-}
           -- (OSC "/track/{1-8}/monitor"
           -- (OSC "/track/{1-8}/autoMonitor"
           -- (OSC "/track/{1-8}/crossfadeMode/{A,B,AB} {1}
           OSC "/track/{tracksend}/send/{tracksendindex}/volume" $ ArgList [("tracksendvol", Nothing)], -- {0-MAX_VALUE}
           -- (OSC "/track/{1-8}/send/{1-8}/volume/indicate" -- {0,1}
           OSC "/track/stop" $ ArgList [("trackstop", Nothing)]]
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
let tadd            = pS "trackadd"            -- audio, effect, instrument
    tactivated      = pI "trackactivated" . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE} 
    tselect         = pI "trackselect"    . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    tvolume         = pI "trackvolume"    . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    _tpan           = pI "trackpan"       . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    _tstate         = pI "trackstate"     . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    tsend           = pI "tracksend"      . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    tsendindex      = pI "tracksendindex" . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    _tstop          = pI "trackstop"      -- . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    tactivatedstate = pI "trackactivatedstate" . (min 1 . (max 0 <$>)) -- {0,1}
    tvolumeval      = pF "trackvolumeval"      -- {0-MAX_VALUE}
    tpanval         = pF "trackpanval"         -- {0-MAX_VALUE}
    tstateprop      = pS "trackstatepop"       -- mute, solo, recarm
    tstatepropval   = pI "trackstatepropval"   . (min 1 . (max 0 <$>)) -- {1,0,-}
    _tsendvol       = pF "tracksendvol"        -- {0-MAX_VALUE}
:}

-- Track param shortcuts
:{
let tactive t s    = tactivated t # tactivatedstate s
    tvol t v       = tvolumeval (bwO v) # tvolume t
    tpan t p       = tpanval (bwO p) # _tpan t 
    tstop          = _tstop "1"
    tstate t p v   = tstateprop p # tstatepropval v # _tstate t
    tmute   t      = tstateprop "mute" # tstatepropval 1 # _tstate t
    tunmute t      = tstateprop "mute" # tstatepropval 0 # _tstate t
    tsolo   t      = tstateprop "solo" # tstatepropval 1 # _tstate t
    tunsolo t      = tstateprop "solo" # tstatepropval 0 # _tstate t
    trecarm t      = tstateprop "recarm" # tstatepropval 1 # _tstate t
    tunrecarm t    = tstateprop "recarm" # tstatepropval 0 # _tstate t
    tsendvol t s v = tsend t # tsendindex s # _tsendvol v
    tactive'  t (#) s  = tactivated t # tactivatedstate s
    tvol'     t (#) v  = tvolume t # tvolumeval (bwO v)
    tpan'     t (#) p  = _tpan t # tpanval (bwO p)
    tstate'   t (#) p (+) v = _tstate t # tstateprop p + tstatepropval v
    tsendvol' t (#) s (+) v = tsend t # tsendindex s + _tsendvol (bwO v)
:}

-- Track param shorthands
:{
let bwtadd = tadd
    bwtact = tactive
    bwtv   = tvol
    bwtp   = tpan
    bwtst  = tstop
    bwtm   = tmute
    btwum  = tunmute
    bwts   = tsolo
    bwtus  = tunsolo
    bwtr   = trecarm
    bwtur  = tunrecarm
    bwtsv  = tsendvol
    bwtv'  = tvol'
    bwtp'  = tpan'
    bwtst' = tstate'
    bwtsv' = tsendvol'
    bwtact' = tactive'
:}

-- Track utils
-- :{
-- let bwmx mx = fmap mx tvol -- tvol 0 mx!!0
-- :}
