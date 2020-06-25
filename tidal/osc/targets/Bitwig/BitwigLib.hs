-- These extra shorthands require the main Stream to be already defined

-- Transport shorthands
:{
let bwplay     = once $ transport "play"
    bwstop     = once $ transport "stop"
    bwrestart  = once $ transport "restart"
    bwloop     = once $ transport "repeat"
    bwclick    = once $ transport "click"
    bwpunchin  = once $ transport "punchIn"
    bwpunchout = once $ transport "punchOut"
    bwrecord   = once $ transport "record"
    bwoverdub  = once $ transport "overdub"
    bwtempo  t = once $ tempo t
    bwtempo' t = p "tempo" $ tempo t -- patternable
:}

-- Tranpsort aliases
:{
let bwp    = bwplay
    bws    = bwstop
    bwhush = bwstop
    bwrec  = bwrecord
    bwbpm  = bwtempo
    bwbpm' = bwtempo'
:}

-- Global shorthands
:{
let bwpreroll n = once $ _bwpreroll n
    bwpre       = bwpreroll
    bwundo      = once $ _bwundo    "1" -- 1 doesn't mean anything
    bwredo      = once $ _bwredo    "1" -- 1 doesn't mean anything
    bwrefresh   = once $ _bwrefresh "1" -- 1 doesn't mean anything
:}

-- Project shorthands
:{
let bwproject p  = once $ _bwproject p
    bwengine e   = once $ _bwengine e
    bwsave       = once $ _bwsave "1" -- 1 doesn't mean anything
    bwautosave t   = p "bwautosave" $ slow t $ _bwsave "1" -- 1 doesn't mean anything
    bwautosavestop = p "bwautosave" silence
:}

-- Global hush
:{
let hush' = do
      bwstop
      hush
    hushh = hush'
    hushhh = hush'
    hushhhh = hush'
    hushhhhh = hush'
    hushhhhhh = hush'
    hsh  = hush'
    hshu = hush'
    hsuh = hush'
    hshh = hush'
    hshs = hush'
    shh = hush'
    shhh = hush'
    shhhh = hush'
    shhhhh = hush'
    shhhhhh = hush'
    shhhhhhh = hush'
:}

-- Connect Bitwig stream to Carabiner (Ableton Link)
:{
let bwlink bpc latency = carabiner stream bpc (latency)
:}

-- High level controllers
:{
let bwcv   t c v   = stack [bwcl t c, bwtv t v]           -- track t launch clip c with volume v
    bwcvp  t c v p = stack [bwcl t c, bwtv t v, bwtp t p] -- track t launch clip c with volume v & pan p
    bwcv'  c v     = stack [heap bwcl c, heap bwtv v]     -- launch clips cs with volumes vs
    bwcvp' c v p   = stack [heap bwcl c, heap bwtv v, heap bwtp p] -- launch clips cs with volumes vs and pans ps
    bwvp t v p = stack [bwtv t v, bwtp t p]       -- track t volume v pan p
    bwvp'  v p = stack [heap bwtv v, heap bwtp p] -- track volumes vs and pans ps
:}
