-- Stream Transitions
:{
let xfade i           = transition stream True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t       = transition stream True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t       = transition stream True (Sound.Tidal.Transition.histpan t) i
    wait i t          = transition stream True (Sound.Tidal.Transition.wait t) i
    waitT i f t       = transition stream True (Sound.Tidal.Transition.waitT f t) i
    jump i            = transition stream True (Sound.Tidal.Transition.jump) i
    jumpIn i t        = transition stream True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t       = transition stream True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t       = transition stream True (Sound.Tidal.Transition.jumpMod t) i
    interpolate i     = transition stream True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition stream True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i          = transition stream True (Sound.Tidal.Transition.clutch) i
    clutchIn i t      = transition stream True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i      = transition stream True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t  = transition stream True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t         = transition stream False (Sound.Tidal.Transition.mortalOverlay t) i
    mortal i lifespan release = transition stream True (Sound.Tidal.Transition.mortal lifespan release) i
:}
