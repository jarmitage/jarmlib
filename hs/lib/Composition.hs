
-- Example: https://gist.github.com/jarmitage/930442ae4d341d6fa4ffa48914317f55

-- Mute/Unmute/Solo Patterns and IntPatterns
:{
let mutePatterns      g = mapM (streamMute   superDirt) g
    unmutePatterns    g = mapM (streamUnmute superDirt) g
    soloPatterns      g = mapM (streamSolo   superDirt) g
    unsoloPatterns    g = mapM (streamUnsolo superDirt) g
    mutePatterns'   s g = mutePatterns   (fromJust $ lookup g s)
    unmutePatterns' s g = unmutePatterns (fromJust $ lookup g s)
    soloPatterns'   s g = soloPatterns   (fromJust $ lookup g s)
    unsoloPatterns' s g = unsoloPatterns (fromJust $ lookup g s)
    muteIntPatterns   g = mutePatterns   (map show g)
    unmuteIntPatterns g = unmutePatterns (map show g)
:}

-- Mute/Unmute/Solo Track Patterns
:{
let muteTrackPatterns    t g   = mapM (streamMute   superDirt) (map ((t ++ "-") ++) g)
    unmuteTrackPatterns  t g   = mapM (streamUnmute superDirt) (map ((t ++ "-") ++) g)
    soloTrackPatterns    t g   = mapM (streamSolo   superDirt) (map ((t ++ "-") ++) g)
    unsoloTrackPatterns  t g   = mapM (streamUnsolo superDirt) (map ((t ++ "-") ++) g)
    muteTrackPatterns'   t s g = muteTrackPatterns   (fromJust $ lookup (map ((t ++ "-") ++) g) s)
    unmuteTrackPatterns' t s g = unmuteTrackPatterns (fromJust $ lookup (map ((t ++ "-") ++) g) s)
    soloTrackPatterns'   t s g = soloTrackPatterns   (fromJust $ lookup (map ((t ++ "-") ++) g) s)
    unsoloTrackPatterns' t s g = unsoloTrackPatterns (fromJust $ lookup (map ((t ++ "-") ++) g) s)
    muteTrackIntPatterns t g   = muteTrackPatterns   t (map show g)
    unmuteTrackIntPatterns t g = unmuteTrackPatterns t (map show g)
:}

-- Name patterns based on track names
:{
let trackPatternName track patternName = d (track ++ "-" ++ patternName)
    trackIntPattern track patternName  = d (track ++ "-" ++ (show patternName))
:}

-- Shorthands for patterns and track patterns
:{
let mp    = mutePatterns
    md    = muteIntPatterns
    mp'   = mutePatterns'
    ump   = unmutePatterns
    umd   = unmuteIntPatterns
    ump'  = unmutePatterns'
    -- sp  = soloPatterns
    -- sp' = soloPatterns'
    usp   = unsoloPatterns
    usp'  = unsoloPatterns'
    mtp   = muteTrackPatterns
    mtd   = muteTrackIntPatterns
    mtp'  = muteTrackPatterns'
    umtp  = unmuteTrackPatterns
    umtd  = unmuteTrackIntPatterns
    umtp' = unmuteTrackPatterns'
    stp   = soloTrackPatterns
    stp'  = soloTrackPatterns'
    ustp  = unsoloTrackPatterns
    ustp' = unsoloTrackPatterns'
    tp    = trackPatternName
    td    = trackIntPattern
:}

-- Named patterns or numbered patterns
track   t mx dn ps p f = td t dn $ f $ (fromJust $ lookup p ps)  # g (mx!!(dn-1)) # o (fromList [dn] -1)
track'  t mx ps dn f   = td t dn $ f $ (fromJust $ lookup dn ps) # g (mx!!(dn-1)) # o (fromList [dn] -1)
track'' t mx ps dn f   = td t dn $ f $ (ps!!(dn-1)) # g (mx!!(dn-1)) # o (fromList [dn] -1)

-- Shorthands for tracks
:{
let tr   = track
    tr'  = track'
    tr'' = track''
:}

-- Lookup function from map and apply pattern
f fs n = fromJust $ lookup n fs
