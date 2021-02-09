let megakit_note = "note noteexp gain pan speed pitch legato begin end attack decay sustain release high midgain midfreq low fxmode fxdepth delay delaytime delayfeedback reverbdepth reverbsize bank notechan notedelay"

-- Effects params
:{
let mid     f g     = midfreq f # midgain g
    mid'    f (#) g = midfreq f # midgain g
    midhigh mf mg h = mid mf mg # high h
    lowmid  l mf mg = low l # mid mf mg
    lowhigh l h     = low l # high h
    lowmidhigh l mf mg h = low l # mid mf mg # high h
    mh  = midhigh
    lm  = lowmid
    lh  = lowhigh
    lmh = lowmidhigh
    rvbs = reverbsize
    rvbd = reverbdepth
    rvbsd s d = reverbsize  s # reverbdepth d
    rvbds d s = reverbdepth d # reverbsize  s
    rvbsd' s (+) d = reverbsize s + reverbdepth d
    rvbds' d (+) s = reverbdepth d + reverbsize s
:}

-- Sample Kits names
:{
megakit_kits = "old1 old2 fm1 fm2 fm3 trap1 trap2 trap3 bass bs chords stabs notes ins voxriff vox fx"
kitN "old1"    = 0
kitN "old2"    = 1
kitN "fm1"     = 2
kitN "fm2"     = 3
kitN "fm3"     = 4
kitN "trap1"   = 5
kitN "trap2"   = 6
kitN "trap3"   = 7
kitN "bass"    = 8
kitN "bs"      = 8
kitN "chords"  = 9
kitN "stabs"   = 10
kitN "notes"   = 11
kitN "ins"     = 12
kitN "voxriff" = 13
kitN "vox"     = 14
kitN "fx"      = 15
kit = bank . (kitN <$>)
:}

-- Sample Kit shortcuts
:{
let k = kit
    k0 p n_      = note n_ # k p # notechan 0
    k1 p n_      = note n_ # k p # notechan 1
    k2 p n_      = note n_ # k p # notechan 2
    k3 p n_      = note n_ # k p # notechan 3
    k4 p n_      = note n_ # k p # notechan 4
    k5 p n_      = note n_ # k p # notechan 5
    k6 p n_      = note n_ # k p # notechan 6
    k7 p n_      = note n_ # k p # notechan 7
    k0' p (+) n_ = note n_ + k p # notechan 0
    k1' p (+) n_ = note n_ + k p # notechan 1
    k2' p (+) n_ = note n_ + k p # notechan 2
    k3' p (+) n_ = note n_ + k p # notechan 3
    k4' p (+) n_ = note n_ + k p # notechan 4
    k5' p (+) n_ = note n_ + k p # notechan 5
    k6' p (+) n_ = note n_ + k p # notechan 6
    k7' p (+) n_ = note n_ + k p # notechan 7
:}


-- FX Mode names
:{
megakit_fxmodes = "compression comp saturation sat distortion dist lofi phaser chorus tremolo trem exciter" 
fxmodeN "compression" = 0
fxmodeN "comp"        = 0
fxmodeN "saturation"  = 1
fxmodeN "sat"         = 1
fxmodeN "distortion"  = 2
fxmodeN "dist"        = 2
fxmodeN "lofi"        = 3
fxmodeN "phaser"      = 4
fxmodeN "chorus"      = 5
fxmodeN "tremolo"     = 6
fxmodeN "trem"        = 6
fxmodeN "exciter"     = 7
fxm = fxmode . (fxmodeN <$>)
:}

-- FX Modes
:{
let fxd = fxdepth
    fx  m d = fxm m # fxd d         -- string version
    fxi m d = fxmode m # fxd d      -- numerical version
    fx'  m (+) d = fxm m + fxd d    -- string version
    fxi' m (+) d = fxmode m + fxd d -- numerical version
:}

-- Control params
:{
megakit_ctl = "m1_speed m1_pitch m1_pos m1_level m1_pan m2_speed m2_pitch m2_pos m2_level m2_pan m3_speed m3_pitch m3_pos m3_level m3_pan"
m1_speed x = control x # controlchannel 0
m1_pitch x = control x # controlchannel 1
m1_pos x = control x # controlchannel 2
m1_level x = control x # controlchannel 3
m1_pan x = control x # controlchannel 4
m2_speed x = control x # controlchannel 6
m2_pitch x = control x # controlchannel 7
m2_pos x = control x # controlchannel 8
m2_level x = control x # controlchannel 9
m2_pan x = control x # controlchannel 10
m3_speed x = control x # controlchannel 12
m3_pitch x = control x # controlchannel 13
m3_pos x = control x # controlchannel 14
m3_level x = control x # controlchannel 15
m3_pan x = control x # controlchannel 16
:}

let megakit_print = show ["[MEGAKIT] NOTE", megakit_note, "KITS", megakit_kits, "CONTROL", megakit_ctl, "FXMODES" ,megakit_fxmodes]
