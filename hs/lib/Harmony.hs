import qualified Sound.Tidal.Scales as Scales

import qualified Sound.Tidal.Chords as Chords

import Sound.Tidal.Utils -- `!!!`

import Data.Maybe -- `fromMaybe`

chordTable = Chords.chordTable
scaleList  = Scales.scaleList

:{
let majork      = ["major", "minor", "minor", "major", "major", "minor", "dim7"]
    minork      = ["minor", "minor", "major", "minor", "major", "major", "major"]
    doriank     = ["minor", "minor", "major", "major", "minor", "dim7",  "major"]
    phrygiank   = ["minor", "major", "major", "minor", "dim7",  "major", "minor"]
    lydiank     = ["major", "major", "minor", "dim7",  "major", "minor", "minor"]
    mixolydiank = ["major", "minor", "dim7",  "major", "minor", "minor", "major"]
    locriank    = ["dim7",  "major", "minor", "minor", "major", "major", "minor"]
:}

:{
let keyTable = [("major",      majork),
                ("minor",      minork),
                ("dorian",     doriank),
                ("phrygian",   phrygiank),
                ("lydian",     lydiank),
                ("mixolydian", mixolydiank),
                ("locrian",    locriank),
                ("ionian",     majork),
                ("aeolian",    minork)]
:}

keyL p = (\name -> fromMaybe [] $ lookup name keyTable) <$> p

-- | @chord p@ turns a pattern of chord names into a pattern of
-- numbers, representing note value offsets for the chords
-- chord :: Num a => Pattern String -> Pattern a
chord p = flatpat $ Chords.chordL p

harmonise ch p = scale ch p + chord (flip (!!!) <$> p <*> keyL ch)
