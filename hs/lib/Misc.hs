
-- BPM shortcuts
bps b = setcps (b/2)
bpm b = setcps (b/2/120)

-- Choose: odd, even
codd a = c $ take a [1,3..] -- choose an odd number
ceven a = c $ take a [0,2..] -- choose an even number

-- Other misc functions
screw l c p = loopAt l $ chop c $ p
toggle t f p = if (1 == t) then f $ p else id $ p
tog = toggle

-- sound bank https://github.com/tidalcycles/Tidal/issues/231
-- bank p = with s_p (liftA2 (++) (p::Pattern String))
-- b = bank
