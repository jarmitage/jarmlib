-- Bela Resonators Target
:{
brTarget = Target {oName     = "Bela Resonators",
                   oAddress  = "192.168.7.2",
                   oPort     = 8000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Live
                  }
:}

-- Bela Resonators OSC Specs
:{
brOSCSpecs = [OSC "/block/{resblock}/model" $ ArgList [("resmodel", Nothing)]++oscBundle,
              OSC "/block/{resblock}/pitch" $ ArgList [("respitch", Nothing)]++oscBundle,
              OSC "/block/{resblock}/resonator" $ ArgList [("resindex", Nothing),
                                                           ("resfreq", Nothing),
                                                           ("resgain", Nothing),
                                                           ("resdecay", Nothing)
                                                          ]++oscBundle
             ]
:}

-- Bela Resonators pattern params
:{
let resblock = pI "resblock"
    resmodel = pS "resmodel"
    respitch = pS "respitch"
    resindex = pI "resindex"
    resfreq  = pF "resfreq"
    resgain  = pF "resgain"
    resdecay = pF "resdecay"
:}

-- Bela Resonators shorthands
:{
let model b m      = resmodel m # resblock b
    model' b (#) m = resmodel m # resblock b
    res b i f g d  = resfreq f # resgain g # resdecay d # resindex i # resblock b
    res' b i f (#) g (+) d  = resfreq f # resgain g + resdecay d # resindex i # resblock b
:}

-- Bela Resonators OSC Map
brOscMap = (brTarget, brOSCSpecs)
