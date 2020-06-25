-- A simple video synth for Consoles, controlled by OSC
-- https://github.com/zarquin/ASCII-Simple-Video-Synth

:{
let ascTarget = Target {oName     = "ascii",
                        oAddress  = "127.0.0.1",
                        oPort     = 5050,
                        oLatency  = 0.2,
                        oWindow   = Nothing,
                        oSchedule = Live
                       }
    ascOSCSpecs = [OSC "/{asccolour}/speed"  $ ArgList [("ascspeed", Nothing)],
                   OSC "/{asccolour}/mode"   $ ArgList [("ascmode", Nothing)],
                   OSC "/{asccolour}/offset" $ ArgList [("ascoffset", Nothing)],
                   OSC "/{asccolour}/scale"  $ ArgList [("ascscale", Nothing)],
                   OSC "/shape/sides" $ ArgList [("ascsides", Nothing)],
                   OSC "/shape/size"  $ ArgList [("ascsize", Nothing)],
                   OSC "/shape/xinc"  $ ArgList [("ascxinc", Nothing)],
                   OSC "/shape/yinc"  $ ArgList [("ascyinc", Nothing)]
                  ]
    ascspeed  = pI "ascspeed"
    ascmode   = pI "ascmode"
    ascoffset = pI "ascoffset"
    ascscale  = pI "ascscale"
    ascsides  = pI "ascsides"
    ascsize   = pI "ascsize"
    ascxinc   = pI "ascxinc"
    ascyinc   = pI "ascyinc"
    asccolour = pS "asccolour"
    ascOscMap = (ascTarget, ascOSCSpecs)
:}
