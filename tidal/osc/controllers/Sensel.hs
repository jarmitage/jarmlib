-- Sensel OSC input params
:{
let sensel1x = cF 0 "sensel1x"
    sensel1y = cF 0 "sensel1y"
    sensel1z = cF 0 "sensel1z"
:}

:{
let sensel n a = cF 0 $ "sensel" ++ (show n) ++ a
:}

p1 $ s "bd" # gain (sensel 1 "x")
