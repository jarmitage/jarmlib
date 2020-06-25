:{
let oscBundle = [("delta", Just $ VF 0),
                 ("cycle", Just $ VF 0),
                 ("cps", Just $ VF 0)]
    oscMessage = [("sec", Just $ VF 0),
                  ("usec", Just $ VF 0)]
:}

:script /path/to/here/tidal/osc/targets/ASCIISVS.hs
-- :script /path/to/here/tidal/osc/targets/BelaRes.hs
:script /path/to/here/tidal/osc/targets/Bitwig/Bitwig.hs
:script /path/to/here/tidal/osc/targets/CineVivo.hs
:script /path/to/here/tidal/osc/targets/LiveCore.hs

let sdOscMap = (superdirtTarget, [superdirtShape])

:{
let oscMap = [--sdOscMap
              -- bwOscMap
              -- ,brOscMap
              -- lcOscMap
              cvOscMap
              -- ,ascOscMap]
              ]
:}
