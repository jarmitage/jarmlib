-- SEQ-Nano Position Effects
:{
-- posfxmch = 0 -- position FX mode controlchannel
-- posfxdch = 1 -- position FX depth controlchannel
posfxmodes = 13
posfxmN "no"      = 0
posfxmN "fast"    = 1/posfxmodes
posfxmN "loop"    = 2/posfxmodes
posfxmN "clip"    = 3/posfxmodes
posfxmN "xdown"   = 4/posfxmodes
posfxmN "xup"     = 5/posfxmodes
posfxmN "rev"     = 6/posfxmodes
posfxmN "ping"    = 7/posfxmodes
posfxmN "pong"    = 8/posfxmodes
posfxmN "jitter"  = 9/posfxmodes
posfxmN "jit"     = 9/posfxmodes
posfxmN "rand"    = 10/posfxmodes
posfxmN "pattern" = 11/posfxmodes
posfxmN "pat"     = 11/posfxmodes
posfxmN "randrev" = 12/posfxmodes
posfxmN "repeat"  = 13/posfxmodes
posfxmN "rep"     = 13/posfxmodes
_posfxm = control . (posfxmN <$>)
:}

:{
let posfxm m ch = _posfxm m # controlchannel ch -- string version
    posfxd d ch = control d # controlchannel ch
    posfx  m d ch = stack [posfxm m ch, posfxd d (ch+1)]   -- string version
    posfx' m d ch = stack [posfxm' m ch, posfxd d (ch+1)] -- numerical version
    posfxm' m ch = ctl (m/posfxmodes) ch -- numerical version
:}
