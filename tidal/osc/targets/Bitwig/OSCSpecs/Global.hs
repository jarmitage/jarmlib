-- Global: https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---global
-- Misc: https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---misc

-- Global OSC Specs
:{
bwGlobal = [OSC "/preroll" $ ArgList [("preroll", Nothing)],
            OSC "/undo" $ ArgList [("undo", Nothing)],
            OSC "/redo" $ ArgList [("redo", Nothing)],
            OSC "/refresh" $ ArgList [("bwrefresh", Nothing)]] -- Flushes all values to the clients
:}

-- Global params
:{
let _bwpreroll = pI "preroll" . (min 4 . (max 0 <$>)) -- {0,1,2,4}
    _bwundo    = pI "undo"
    _bwredo    = pI "redo"
    _bwrefresh = pI "bwrefresh"
:}
