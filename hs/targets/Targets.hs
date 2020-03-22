
-- https://tidalcycles.org/index.php/Custom_OSC

:script /path/to/this/repo/hs/targets/SuperDirt.hs
-- :script /path/to/this/repo/hs/targets/Bitwig/BitwigAPI.hs
-- :script /path/to/this/repo/hs/targets/Bitwig/BitwigUser.hs
-- :script /path/to/this/repo/hs/targets/Bitwig/BitwigTempo.hs
-- :script /path/to/this/repo/hs/targets/Bitwig/Bitwig.hs
-- :script /path/to/this/repo/hs/targets/Bitwig/BitwigGrid.hs
-- :script /path/to/this/repo/hs/targets/LiveCore.hs
-- :script /path/to/this/repo/hs/targets/Svampolin.hs
-- :script /path/to/this/repo/hs/targets/Bela.hs

-- Group state
:{
let setI a b = streamSetI superDirt a b -- >> streamSetI bitwigUser a b
    setF a b = streamSetF superDirt a b -- >> streamSetF bitwigUser a b
    setS a b = streamSetS superDirt a b -- >> streamSetS bitwigUser a b
    setR a b = streamSetR superDirt a b -- >> streamSetR bitwigUser a b
    setB a b = streamSetB superDirt a b -- >> streamSetB bitwigUser a b
:}
