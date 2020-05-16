-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---track

-- Master OSC Specs
:{
bwMaster = [(OSC "/master/volume" $ ArgList [("mastervol", Nothing)]),
            (OSC "/master/pan" $ ArgList [("masterpan", Nothing)])]
:}

-- Master params
:{
let mastervol = pF "mastervol"
    masterpan = pF "masterpan"
    master v p = mastervol v # masterpan p
    master' v (#) p = mastervol v # masterpan p
:}