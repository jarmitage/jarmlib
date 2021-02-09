:{
let oscBundle = [("delta", Just $ VF 0),
                 ("cycle", Just $ VF 0),
                 ("cps", Just $ VF 0)]
    oscMessage = [("sec", Just $ VF 0),
                  ("usec", Just $ VF 0)]
:}

-- :script osc/targets/ASCIISVS.hs
-- :script osc/targets/BelaRes.hs
-- :script osc/targets/Bitwig/Bitwig.hs
-- :script osc/targets/CineVivo.hs
-- :script osc/targets/LiveCore/LiveCore.hs
-- :script osc/targets/Vuo.hs
-- :script osc/targets/VDMX.hs

let sdOscMap = (superdirtTarget, [superdirtShape])

:{
let oscMap = [sdOscMap]
:}
-- :{
-- let oscMap = [sdOscMap
--         -- ,bwOscMap
--         -- ,brOscMap
--         -- ,cvOscMap
--         -- ,ascOscMap
--         -- vuoOscMap
--         ,vdmxOscMap
--         ]
-- :}
