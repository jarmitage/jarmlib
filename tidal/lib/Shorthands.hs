
-- Common
ac    = accelerate
c     = choose
deg   = degrade
degBy = degradeBy
ev    = every
fa    = fast
fE    = foldEvery
g     = gain
i     = id
m     = mute
o     = orbit
oa    = offadd
r     = run
rg    = range
rgx   = rangex
seg   = segment
sl    = slow
sp    = speed
str   = striate
str'  = striate'
u     = up

-- Transitions
j  p n = jumpIn'  p n
xf p n = xfadeIn  p n
cl p n = clutchIn p n
j2   p = jumpIn'  p 2
j4   p = jumpIn'  p 4
j8   p = jumpIn'  p 8
j16  p = jumpIn'  p 16
xf2  p = xfadeIn  p 2
xf4  p = xfadeIn  p 4
xf8  p = xfadeIn  p 8
xf16 p = xfadeIn  p 16
cl2  p = clutchIn p 2
cl4  p = clutchIn p 4
cl8  p = clutchIn p 8
cl16 p = clutchIn p 16

-- Continous functions
sin = sine
cos = cosine
sq  = square
