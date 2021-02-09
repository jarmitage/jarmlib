-- CineVivo Target
:{
cvTarget = Target {oName     = "CineVivo",
                   oAddress  = "127.0.0.1",
                   oPort     = 8000,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

-- CineVivo Video OSC Spec
:{
cvVideo = OSC "/tidalVideo" $ ArgList [("video",          Nothing),
                                       ("begin",          Just $ VF 0),
                                       ("end",            Just $ VF 1),
                                       ("vloop",          Just $ VI 0),
                                       ("vspeed",         Just $ VF 1),
                                       ("vgain",          Just $ VF 0),
                                       ("valpha",         Just $ VF 1),
                                       ("vlayer",         Just $ VI 0),
                                       ("vwidth",         Just $ VF 1),
                                       ("vheight",        Just $ VF 1),
                                       ("vposx",          Just $ VF 0),
                                       ("vposy",          Just $ VF 0),
                                       ("vred",           Just $ VF 1), 
                                       ("vgreen",         Just $ VF 1),
                                       ("vblue",          Just $ VF 1),
                                       ("vrotationangle", Just $ VF 0),
                                       ("vrotationspeed", Just $ VF 0),
                                       ("vrotationaxis",  Just $ VS "x"),
                                       ("vshader",        Just $ VS ""),
                                       ("delta",          Just $ VF 0),
                                       ("cycle",          Just $ VF 0),
                                       ("cps",            Just $ VF 0)]
:}

-- CineVivo video parameters
:{
let video     = pS "video"          -- video                 pattern string 0
    vbegin    = begin -- pF "vbegin"         -- video begin           pattern float  1
    vend      = end -- pF "vend"           -- video end             pattern float  2
    vloop     = pI "vloop"          -- video loop            pattern bool   3
    vspeed    = pF "vspeed"         -- video speed           pattern float  4
    vgain     = pF "vgain"          -- video audio gain      pattern float  5
    valpha    = pF "valpha"         -- video alpha channel   pattern float  6
    vlayer    = pI "vlayer"         -- video layer           pattern int    7
    vwidth    = pF "vwidth"         -- video width           pattern float  8
    vheight   = pF "vheight"        -- video height          pattern float  9
    vposx     = pF "vposx"          -- video position X      pattern float  10
    vposy     = pF "vposy"          -- video position Y      pattern float  11
    vred      = pF "vred"           -- video colour red      pattern float  12
    vgreen    = pF "vgreen"         -- video colour green    pattern float  13
    vblue     = pF "vblue"          -- video colour blue     pattern float  14
    vrotangle = pF "vrotationangle" -- video rotation angle  pattern float  15
    vrotspeed = pF "vrotationspeed" -- video rotation speed  pattern float  16
    vrotaxis  = pS "vrotationaxis"  -- video rotation axis   pattern string 17
    vshader   = pS "vshader"        -- shader layer          pattern string 18
:}

-- CineVivo pattern parameter shorthands. Example:
-- ```
-- cv1
--   $ v     "vid"   -- video file
--   # vs    1       -- speed
--   # vio   0 1     -- in-out / begin-end
--   # vrgb  1 1 1   -- colour
--   # vxywh 0 0 1 1 -- x, y, width & height
--   # vrot  0 1 "x" -- rotation angle, speed & axis
--   # val   1 0     -- alpha & layer
-- ```
:{
let v  = video
    vs = vspeed
    vi = vbegin
    vo = vend
    vw = vwidth
    vh = vheight
    vx = vposx
    vy = vposy
    vr = vred
    vg = vgreen
    vb = vblue
    va = valpha
    vl = vlayer
    vrota = vrotangle
    vrots = vrotspeed
    vrotx = vrotaxis
    vxy    x     y       = vx x # vy y                 -- video position XY
    vxy'   x (#) y       = vx x # vy y                 -- video position XY, with operator
    vwh    w     h       = vw w # vh h                 -- video scale width & height
    vwh'   w (#) h       = vw w # vh h                 -- video scale width & height, with operator
    vxywh  x  y     w  h = vxy x y # vwh w h           -- video position XY & video scale width & height
    vxywh' x  y (#) w  h = vxy x y # vwh w h           -- video position XY & video scale width & height, with operator
    vrgb   r     g     b = vr r # vg g # vb b          -- video colour red green blue
    vrgb'  r (#) g (+) b = vr r # vg g + vb b          -- video colour red green blue, with operators
    vio    i     o       = vi i # vo o                 -- video in/out
    vio'   i (#) o       = vi i # vo o                 -- video in/out, with operator
    val    a     l       = va a # vl l                 -- video alpha & layer
    val'   a (#) l       = va a # vl l                 -- video alpha & layer, with operator
    vrot   a     s     x = vrota a # vrots s # vrotx x -- video rotation
    vrot'  a (#) s (+) x = vrota a # vrots s + vrotx x -- video rotation, with operator
    vxywh'' x (#) y (+) w (-) h = vx x # vy y + vw w - vh h -- video position XY & video scale width & height, with operators
:}

-- CineVivo Hydra OSC Spec
:{
cvHydra = OSC "/hydra/{hsrc}/{f1}/{f2}/{f3}/{f4}/{hout}" $ ArgList [("hlayer", Just $ VF 0),
                                                                    ("hsrcp1", Just $ VF 0),
                                                                    ("hsrcp2", Just $ VF 0),
                                                                    ("hsrcp3", Just $ VF 0),
                                                                    ("hf1p1",  Just $ VF 0),
                                                                    ("hf1p2",  Just $ VF 0),
                                                                    ("hf1p3",  Just $ VF 0),
                                                                    ("hf2p1",  Just $ VF 0),
                                                                    ("hf2p2",  Just $ VF 0),
                                                                    ("hf2p3",  Just $ VF 0),
                                                                    ("hf3p1",  Just $ VF 0),
                                                                    ("hf3p2",  Just $ VF 0),
                                                                    ("hf3p3",  Just $ VF 0),
                                                                    ("hf4p1",  Just $ VF 0),
                                                                    ("hf4p2",  Just $ VF 0),
                                                                    ("hf4p3",  Just $ VF 0),
                                                                    ("delta",  Just $ VF 0),
                                                                    ("cycle",  Just $ VF 0),
                                                                    ("cps",    Just $ VF 0)]
:}

-- CineVivo Hydra pattern parameter
:{
let hsrc   = pS "hsrc"   -- hydra source function              pattern string
    hf1    = pS "f1"     -- hydra function slot 1              pattern string
    hf2    = pS "f2"     -- hydra function slot 2              pattern string
    hf3    = pS "f3"     -- hydra function slot 3              pattern string
    hf4    = pS "f4"     -- hydra function slot 4              pattern string
    hout   = pS "hout"   -- hydra output channel               pattern int
    hlayer = pI "hlayer" -- hydra cinevivo layer               pattern int
    hsrcp1 = pF "hsrcp1" -- hydra source function parameter 1  pattern float
    hsrcp2 = pF "hsrcp2" -- hydra source function parameter 2  pattern float
    hsrcp3 = pF "hsrcp3" -- hydra source function parameter 3  pattern float
    hf1p1  = pF "hf1p1"  -- hydra function 1 parameter 1       pattern float
    hf1p2  = pF "hf1p2"  -- hydra function 1 parameter 2       pattern float
    hf1p3  = pF "hf1p3"  -- hydra function 1 parameter 3       pattern float
    hf2p1  = pF "hf2p1"  -- hydra function 2 parameter 1       pattern float
    hf2p2  = pF "hf2p2"  -- hydra function 2 parameter 2       pattern float
    hf2p3  = pF "hf2p3"  -- hydra function 2 parameter 3       pattern float
    hf3p1  = pF "hf3p1"  -- hydra function 3 parameter 1       pattern float
    hf3p2  = pF "hf3p2"  -- hydra function 3 parameter 2       pattern float
    hf3p3  = pF "hf3p3"  -- hydra function 3 parameter 3       pattern float
    hf4p1  = pF "hf4p1"  -- hydra function 4 parameter 1       pattern float
    hf4p2  = pF "hf4p2"  -- hydra function 4 parameter 2       pattern float
    hf4p3  = pF "hf4p3"  -- hydra function 4 parameter 3       pattern float
:}

-- CineVivo Hydra pattern groups
-- cv 1
--  $ hsrcp "osc:1:0:1"
--  # hf1p "color:1:1:1"
--  # hf2p "color:1:1:1"
--  # hf3p "color:1:1:1"
--  # hf4p "color:1:1:1"
--  # hout "1"
:{
let hsrcp = grp [mS "hsrc", mF "hsrcp1", mF "hsrcp2", mF "hsrcp3"] -- hydra source parameter group
    hf1p  = grp [mS "f1", mF "hf1p1", mF "hf1p2", mF "hf1p3"] -- hydra function 1 parameter group
    hf2p  = grp [mS "f2", mF "hf2p1", mF "hf2p2", mF "hf2p3"] -- hydra function 1 parameter group
    hf3p  = grp [mS "f3", mF "hf3p1", mF "hf3p2", mF "hf3p3"] -- hydra function 1 parameter group
    hf4p  = grp [mS "f4", mF "hf4p1", mF "hf4p2", mF "hf4p3"] -- hydra function 1 parameter group
    hsrcp' s a b c = hsrcp1 a # hsrcp2 b # hsrcp3 c # hsrc s
    hf1p'  f a b c = hf1p1 a # hf1p2 b # hf1p3 c # hf1 f
    hf2p'  f a b c = hf2p1 a # hf2p2 b # hf2p3 c # hf2 f
    hf3p'  f a b c = hf3p1 a # hf3p2 b # hf3p3 c # hf3 f
    hf4p'  f a b c = hf4p1 a # hf4p2 b # hf4p3 c # hf4 f
    hsrcp'' s (#) a (+) b (-) c = hsrcp1 a # hsrcp2 b + hsrcp3 c - hsrc s
    hf1p''  f (#) a (+) b (-) c = hf1p1 a  # hf1p2 b  + hf1p3 c  - hf1 f
    hf2p''  f (#) a (+) b (-) c = hf2p1 a  # hf2p2 b  + hf2p3 c  - hf2 f
    hf3p''  f (#) a (+) b (-) c = hf3p1 a  # hf3p2 b  + hf3p3 c  - hf3 f
    hf4p''  f (#) a (+) b (-) c = hf4p1 a  # hf4p2 b  + hf4p3 c  - hf4 f
:}

-- CineVivo OSC Map
cvOscMap = (cvTarget, [cvVideo, cvHydra])
