stream <- startStream defaultConfig {cFrameTimespan = 1/200} oscMap
-- stream <- startStream (defaultConfig {cCtrlAddr = "127.0.0.1", cCtrlPort = 6010, cFrameTimespan = 1/200}) oscMap

:script /path/to/here/tidal/stream/StreamControl.hs
:script /path/to/here/tidal/stream/StreamTransitions.hs
:script /path/to/here/tidal/stream/StreamOrbits.hs
:script /path/to/here/tidal/stream/StreamSharedVars.hs
