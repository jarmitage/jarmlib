-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---track

-- Track Clip OSC specs
:{
bwTrackClip = [OSC "/track/{trackclip}/clip/{trackclipindex}/{trackclipprop}" $ ArgList [], -- select, launch, record, remove
               -- (OSC "/track/{1-8}/clip/{1-8}/color" -- rgb(r,g,b) with r,g,b = 0..255
               OSC "/track/{trackclipstop}/clip/stop"      $ ArgList [],
               OSC "/track/{trackcliparrange}/clip/returntoarrangement" $ ArgList []]
:}

-- Track Clip params
:{
let _clip     = pI "trackclip"      . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    clipindex = pI "trackclipindex" . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    clipstop  = pI "trackclipstop"  . ((max 1 . (+ 1) ) <$>) -- {1-BANK_PAGE_SIZE}
    clipprop  = pS "trackclipprop"  -- select, launch, record, remove
    cliparr   = pI "trackcliparrange" -- return to arrangement
:}

-- Track Clip param shortcuts
:{
let clip t c p = clipindex c # _clip t # clipprop p -- select, launch, record, remove
    clip' t (#) c (+) p = clipindex c # _clip t + clipprop p
    clips t c = clip t c "select"
    clipl t c = clip t c "launch"
    clipr t c = clip t c "record"
    clipd t c = clip t c "remove"
    cliph t   = clipstop t -- clip hush
    clipa t   = cliparr t
    clips' t (+) c = clip' t (+) c (#) "select"
    clipl' t (+) c = clip' t (+) c (#) "launch"
    clipr' t (+) c = clip' t (+) c (#) "record"
    clipd' t (+) c = clip' t (+) c (#) "remove"
:}

-- Track Clip param shorthands
:{
let bwc   = clip
    bwc'  = clip'
    bwcs  = clips
    bwcl  = clipl
    bwcr  = clipr
    bwcd  = clipd
    bwch  = cliph
    bwca  = clipa
    bwcs' = clips'
    bwcl' = clipl'
    bwcr' = clipr'
    bwcd' = clipd'
:}
