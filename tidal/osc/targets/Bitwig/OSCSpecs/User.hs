-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---user-parameters

-- User OSC specs
:{
bwUser = [OSC "/user/{userparam}/value" $ ArgList [("userparamval", Just $ VI 0)]]
:}

-- User params
:{
let userparam      = pI "userparam"
    userparamval   = pF "userparamval"
    userp i v      = userparam i # userparamval v
    userp' i (#) v = userparam i # userparamval v
:}

-- User param shorthands
:{
let bwp  = userp
    bwp' = userp'
:}
