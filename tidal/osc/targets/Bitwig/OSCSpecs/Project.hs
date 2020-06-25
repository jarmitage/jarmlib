-- Project: https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---project
-- Marker: https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---marker

-- Project OSC Specs
:{
bwProject = [OSC "/project"             $ ArgList [("bwproject", Nothing)], -- {+,-} Switch to the next/previous opened project
             OSC "/project/engine"      $ ArgList [("bwengine",  Nothing)], -- {1,0,-} De-/Activate the audio engine
             OSC "/project/save"        $ ArgList [("bwsave",    Nothing)], -- Save the current project
             OSC "/marker/{bwmarker}/launch" $ ArgList []]                  -- Start playback at the marker position
:}

-- Project params
:{
let _bwproject = pS "bwproject"
    _bwengine  = pI "bwengine"
    _bwsave    = pI "bwsave"
    bwmarker   = pI "bwmarker"
:}
