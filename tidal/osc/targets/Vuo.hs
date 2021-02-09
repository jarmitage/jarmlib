-- Target
:{
vuoTarget = Target {oName    = "Vuo",
                   oAddress  = "127.0.0.1",
                   oPort     = 8009,
                   oLatency  = 0.2,
                   oWindow   = Nothing,
                   oSchedule = Pre BundleStamp
                  }
:}

-- OSC Specs
:{
vuoOSCSpecs = [OSC "/tidal" $ ArgList [("video",          Nothing), -- 1
                                      ("begin",          Just $ VF 0), -- 2
                                      ("end",            Just $ VF 1), -- 3
                                      ("vloop",          Just $ VI 0), -- 4
                                      ("vspeed",         Just $ VF 1), -- 5
                                      ("vgain",          Just $ VF 0), -- 6
                                      ("valpha",         Just $ VF 1), -- 7
                                      ("vlayer",         Just $ VI 0), -- 8
                                      -- ("vwidth",         Just $ VF 1),
                                      -- ("vheight",        Just $ VF 1),
                                      -- ("vposx",          Just $ VF 0),
                                      -- ("vposy",          Just $ VF 0),
                                      -- ("vred",           Just $ VF 1), 
                                      -- ("vgreen",         Just $ VF 1),
                                      -- ("vblue",          Just $ VF 1),
                                      -- ("vrotationangle", Just $ VF 0),
                                      -- ("vrotationspeed", Just $ VF 0),
                                      -- ("vrotationaxis",  Just $ VS "x"),
                                      -- ("vshader",        Just $ VS ""),
                                      ("delta",          Just $ VF 0),
                                      ("cycle",          Just $ VF 0),
                                      ("cps",            Just $ VF 0)]]
:}

-- ++oscBundle

-- VuoVJ video parameters
:{
let video     = pI "video"          -- video                 pattern string 0
    vbegin    = begin -- pF "vbegin"         -- video begin           pattern float  1
    vend      = end -- pF "vend"           -- video end             pattern float  2
    vloop     = pI "vloop"          -- video loop            pattern bool   3
    vspeed    = pF "vspeed"         -- video speed           pattern float  4
    vgain     = pF "vgain"          -- video audio gain      pattern float  5
    valpha    = pF "valpha"         -- video alpha channel   pattern float  6
    vlayer    = pI "vlayer"         -- video layer           pattern int    7
    -- vwidth    = pF "vwidth"         -- video width           pattern float  8
    -- vheight   = pF "vheight"        -- video height          pattern float  9
    -- vposx     = pF "vposx"          -- video position X      pattern float  10
    -- vposy     = pF "vposy"          -- video position Y      pattern float  11
    -- vred      = pF "vred"           -- video colour red      pattern float  12
    -- vgreen    = pF "vgreen"         -- video colour green    pattern float  13
    -- vblue     = pF "vblue"          -- video colour blue     pattern float  14
    -- vrotangle = pF "vrotationangle" -- video rotation angle  pattern float  15
    -- vrotspeed = pF "vrotationspeed" -- video rotation speed  pattern float  16
    -- vrotaxis  = pS "vrotationaxis"  -- video rotation axis   pattern string 17
    -- vshader   = pS "vshader"        -- shader layer          pattern string 18
:}

-- VuoVJ pattern parameter shorthands. Example:
-- ```
-- p1
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
    va = valpha
    vl = vlayer
    -- vw = vwidth
    -- vh = vheight
    -- vx = vposx
    -- vy = vposy
    -- vr = vred
    -- vg = vgreen
    -- vb = vblue
    -- vrota = vrotangle
    -- vrots = vrotspeed
    -- vrotx = vrotaxis
    -- vxy    x     y       = vx x # vy y                 -- video position XY
    -- vxy'   x (#) y       = vx x # vy y                 -- video position XY, with operator
    -- vwh    w     h       = vw w # vh h                 -- video scale width & height
    -- vwh'   w (#) h       = vw w # vh h                 -- video scale width & height, with operator
    -- vxywh  x  y     w  h = vxy x y # vwh w h           -- video position XY & video scale width & height
    -- vxywh' x  y (#) w  h = vxy x y # vwh w h           -- video position XY & video scale width & height, with operator
    -- vrgb   r     g     b = vr r # vg g # vb b          -- video colour red green blue
    -- vrgb'  r (#) g (+) b = vr r # vg g + vb b          -- video colour red green blue, with operators
    vio    i     o       = vi i # vo o                 -- video in/out
    vio'   i (#) o       = vi i # vo o                 -- video in/out, with operator
    val    a     l       = va a # vl l                 -- video alpha & layer
    val'   a (#) l       = va a # vl l                 -- video alpha & layer, with operator
    -- vrot   a     s     x = vrota a # vrots s # vrotx x -- video rotation
    -- vrot'  a (#) s (+) x = vrota a # vrots s + vrotx x -- video rotation, with operator
    -- vxywh'' x (#) y (+) w (-) h = vx x # vy y + vw w - vh h -- video position XY & video scale width & height, with operators
:}

-- Sample Kits names
:{
vuo_vids = ""
vidN "dynamic" = 1
vidN "fluido" = 2
vidN "forsythe" = 3
vidN "laurel" = 4
vidN "lildata" = 5
vidN "rain" = 6
vidN "rainbow" = 7
vidN "uniday" = 8
-- vidN "" = 8
-- vidN "" = 9
-- vidN "" = 10
-- vidN "" = 11
-- vidN "" = 12
-- vidN "" = 13
-- vidN "" = 14
-- vidN "" = 15
v = video . (vidN <$>)
v' = video
:}

-- DIYVideoMixer example
-- -- OSC Specs
-- :{
-- vuoOSCSpecs = [OSC "/1/{vuoLR}/clips/{vuo1}/{vuo2}" $ ArgList [("vuoValue", Nothing)]]
-- :}
-- -- Parameters
-- :{
-- let vuolr = pS "vuoLR"
--     vuo1 = pI "vuo1"
--     vuo2 = pI "vuo2"
--     vuoval = pI "vuoValue"
-- :}

-- Parameter shortcuts/groups
-- :{
-- let pa = parameter
--     pa2 = parameter2
-- :}

-- OSC Map
vuoOscMap = (vuoTarget, vuoOSCSpecs)
