stream <- startStream defaultConfig {cFrameTimespan = 1/240} oscMap
-- stream <- startStream (defaultConfig {cCtrlAddr = "127.0.0.1", cCtrlPort = 6010, cFrameTimespan = 1/200}) oscMap

:script stream/StreamControl.hs
:script stream/StreamTransitions.hs
:script stream/StreamOrbits.hs
:script stream/StreamSharedVars.hs
