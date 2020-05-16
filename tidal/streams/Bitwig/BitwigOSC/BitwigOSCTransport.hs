-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---transport

-- Transport OSC specs
:{
-- "/{bwTransport}": stop, play, playbutton, restart, repeat, click, punchIn, punchOut, record, overdub
bwTransport = [(OSC "/{transport}" $ ArgList []),
               -- (OSC "/click/volume" $ ArgList [("clickvolume", Nothing)]),-- Just $ VF 0)]), -- Not defined?
               -- (OSC "/click/preroll" $ ArgList [("clickpreroll", Nothing)]), -- {-,1} Toggles click in preroll
               -- (OSC "/overdub/launcher" $ ArgList [("overdublauncher", Nothing)]), -- {1,-}
               -- (OSC "/crossfade" $ ArgList [("crossfade", Nothing)]),-- Just $ VF 0)]),-- {0-MAX_VALUE}
               -- (OSC "/autowrite" $ ArgList [("autowrite", Nothing)]),-- {0,1}
               -- (OSC "/autowrite/launcher" $ ArgList [("autowritelauncher", Nothing)]), -- {0,1}
               -- (OSC "/automationWriteMode"  $ ArgList [("autWriteMode", Nothing)]),--Just $ VS "latch")]),-- {latch,touch,write}
               (OSC "/tempo/raw" $ ArgList [("raw", Nothing)])] -- {0-666}
               -- (OSC "/tempo/tap" $ ArgList [("tap", Nothing)]),
               -- (OSC "/position/{playheadscroll}" $ ArgList []), -- {+,-} Small in-/decrease of play position
               -- (OSC "/position/{playheadscrolllarge}" $ ArgList []), --{++,--} Large in-/decrease of play position
               -- (OSC "/position" $ ArgList [("moveplayhead", Nothing)])] -- {-2,-1,1,2} Small in-/decrease of play position for -1 and 1, large for all other values
:}

-- Transport params
:{
let transport = pS "transport"
    tempo     = pF "raw"
:}