:{
let testIP = "127.0.0.1"
    belaIP = "192.168.7.2"
:}

-- EFFECTS
:{ 
svampolinEffectsTarget = OSCTarget {oName = "SvampolinEffects", oAddress = belaIP, oPort = 7562,
                       oPath = "/{effect}/value", oShape = Just [("value", Just $ VF 0)],
                       oLatency = bwLatency, oPreamble = [], oTimestamp = BundleStamp
                      }
:}

svampolinEffects <- startTidal svampolinEffectsTarget (defaultConfig {cFrameTimespan = 1/20})

-- CONTROL
:{
svampolinControlsTarget = OSCTarget {oName = "SvampolinControl", oAddress = belaIP, oPort = 7562,
                       oPath = "/{action}", oShape = Just [],
                       oLatency = bwLatency, oPreamble = [], oTimestamp = BundleStamp
                      }
:}

svampolinControls <- startTidal svampolinControlsTarget (defaultConfig {cFrameTimespan = 1/20})

:{
let effect    = pS "effect"
    action    = pS "action"
    svFX      = streamReplace svampolinEffects
    svCTL     = streamReplace svampolinControls
    onceSVFX  = streamOnce svampolinEffects
    onceSVCTL = streamOnce svampolinControls
    hushSV    = mapM_ streamHush [svampolinEffects, svampolinControls]
:}

:{
let svwetdry v   = value v # effect "wetdry"
    svdelay v    = value v # effect "delay"
    svshift v    = value v # effect "shift"
    svcutoff v   = value v # effect "cutoff"
    svfeedback v = value v # effect "feedback"
:}
