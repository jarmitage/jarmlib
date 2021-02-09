
-- TODO
-- - FX group prime:
-- 	 + Does this need >1.0 update/rethink?
-- - Add to FX groups:
--   + SpectralTricks
--   + Custom scsynths

import Sound.Tidal.Pattern as P

rangem i_min i_max o_min o_max p = (\v im ix om ox -> (v-im)*(ox-om)/(ix-im)+om) <$> p P.*> i_min P.*> i_max P.*> o_min P.*> o_max

heap   f   p = stack $ zipWith (\i x -> f i x) (map fromInteger [0..]) p
heap'  f i p = stack $ zipWith (\i x -> f i x) (map fromInteger [i..]) p
heap'' f i p = stack $ zipWith (\i x -> f i x) (map fromInteger i)     p

pile f p = stack $ zipWith heap f p -- same types in the pile
pile' f f' p p' = stack [heap f p, heap f' p'] -- mixed types in a pile of 2

-- FX Groups - `grp` version
adsr    = grp [mF "attack",      mF "decay", mF "sustain", mF "release"]
del     = grp [mF "delay",       mF "delaytime", mF "delayfeedback"]
scc     = grp [mF "shape",       mF "coarse", mF "crush"]
spa     = grp [mF "speed",       mF "accelerate"]
rvb     = grp [mF "room",        mF "size"]
gco     = grp [mF "gain",        mF "cut", mF "orbit"]
glo     = grp [mF "gain",        mF "legato", mF "orbit"]
go      = grp [mF "gain",        mF "orbit"]
io      = grp [mF "begin",       mF "end"]
eq      = grp [mF "cutoff",      mF "resonance", mF "bandf", mF "bandq", mF "hcutoff", mF "hresonance"]
tremolo = grp [mF "tremolorate", mF "tremolodepth"]
phaser  = grp [mF "phaserrate",  mF "phaserdepth"]

-- FX Groups - prime version
adsr' a d s r = attack a # decay d # sustain s # release r
del'  l t f   = delay l # delaytime t # delayfeedback f
scc'  s c c'  = shape s # coarse c # crush c'
lpf'  c r     = cutoff c # resonance r
bpf'  f q     = bandf f # bandq q
hpf'  c r     = hcutoff c # hresonance r
spa'  s a     = speed s # accelerate a
gco'  g c o   = gain g # cut c # orbit o
glo'  g l o   = gain g # legato l # orbit o
go'   g o     = gain g # orbit o
rvb'  r s     = room r # size s
io'   i o     = begin i # end o
eq    h b l q = cutoff l # resonance q # bandf b # bandq q # hcutoff h # hresonance q
tremolo' r d  = tremolorate r # tremolodepth d
phaser'  r d  = phaserrate r # phaserdepth d

-- FX Groups - custom synth / params
-- ring' f r = ringf f # ring r
-- wah' f r = wahf f # wah r
-- superfmbass l f a = lfo l # modFreq f # modAmount a
-- bkfm a b c d e f = carPartial a # modPartial b # mul c # detune d # index e # nharm f
-- fmB a b c d e f = carPartial a # modPartial b # mul c # detune d # index e # nharm f

-- gilfuser/livecode-this/synths/tidalInstruments.scd
-- superbow
bowforce = pF "force"
bowrate  = pF "tremrate"
bowdepth = pF "tremdepth"

-- superrhodes
modind = pF "modind"
-- mix = pF "mix"
lfospeed = pF "lfospeed"
lfodepth = pF "lfodepth"

-- superstring
losslo = pF "losslo"
losshi = pF "losshi"
inharm = pF "inharm"

-- old custom params to convert
-- accel      = pF "accel"
-- bits       = pI "bits"
-- carPartial = pF "carPartial"
-- detune     = pF "detune"
-- fm         = pF "fm"
-- fmf        = pF "fmf"
-- fmod       = pF "fmod"
-- freq       = pI "freq"
-- index      = pI "index"
-- kcutoff    = pF "kcutoff"
-- krush      = pF "krush"
-- modPartial = pF "modPartial"
-- modFreq    = pF "modFreq"
-- modAmount  = pF "modAmount"
-- mul        = pF "mul"
-- nharm      = pI "nharm"
-- noisy      = pF "noisy"
-- rate       = pI "rate"
-- ring       = pF "ring"
-- ringf      = pF "ringf"
-- slide      = pI "slide"
-- slidefrom  = pI "slidefrom"
-- vib        = pI "vib"
-- wah        = pF "wah"
-- wahf       = pF "wahf"
-- TODO: turn ^ intro groups

-- bgold hall reverb
-- GlobalDirtEffect(\dirt_hall, [\hall, \hallfb, \hallpredelay, \hallcutoff, \halltail, \hallshift, \halldelay, \halldelayt, \halldelayfb]),
-- hall         = pF "hall"
-- hallfb       = pF "hallfb"
-- hallpredelay = pF "hallpredelay"
-- hallcutoff   = pF "hallcutoff"
-- halltail     = pF "halltail"
-- hallshift    = pF "hallshift"
-- halldelay    = pF "halldelay"
-- halldelayt   = pF "halldelayt"
-- halldelayfb  = pF "halldelayfb"
-- hallgrp h f c t s = hall h # hallfb f # hallcutoff c # halltail t # hallshift s
-- halldel p d t f   = hallpredelay p # halldelay d # halldelayt t # halldelayfb f

-- Svampolin
-- string = pF "string"
