-- https://github.com/git-moss/DrivenByMoss-Documentation/blob/master/Generic-Tools-Protocols/Open-Sound-Control-(OSC).md#receive---user-parameters

-- User OSC specs
:{
bwUser = [(OSC "/user/{userparam}/value" $ ArgList [("userparamval", Just $ VI 0)])]
:}

-- /user/{+,-}
-- /user/page/selected {1-8}
-- /user/page/{1-8}
-- /user/{1-8}/value {0-MAX_VALUE}
-- /user/{1-8}/indicate {0,1}
-- /user/{1-8}/reset
-- /user/{1-8}/touched

-- User params
:{
let userparam = pI "userparam"
    userparamval = pF "userparamval"
    userp i v = userparam i # userparamval v
    userp' i (#) v = userparam i # userparamval v
:}
