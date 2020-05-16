-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---scene

-- Scene OSC Specs
:{
bwScene = [(OSC "/scene/{scene}/launch" $ ArgList []),
           -- (OSC "/scene/{scenestep}" $ ArgList []), -- Step by 1
           -- (OSC "/scene/bank/{scenebankstep}" $ ArgList []), -- Step by 8
           (OSC "/scene/{scenecreate}" $ ArgList [])] -- Create a new scene from all playing clips
:}

-- Scene params
:{
let scenelaunch = pI "scene"
    scene = scenelaunch -- alias
    -- scenestep = pS "" -- {+,-} Step by 1
    -- scenebankstep = pS ""  -- {+,-} Step by 8
    _scenecreate = pS "scenecreate"
    scenecreate = _scenecreate "create"
:}
