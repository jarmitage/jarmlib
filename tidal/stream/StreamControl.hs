-- Stream Control
:{
let p           = streamReplace     stream
    hush        = streamHush        stream
    list        = streamList        stream
    mute        = streamMute        stream
    unmute      = streamUnmute      stream
    solo        = streamSolo        stream
    unsolo      = streamUnsolo      stream
    once        = streamOnce        stream
    first       = streamFirst       stream
    nudgeAll    = streamNudgeAll    stream
    all         = streamAll         stream
    resetCycles = streamResetCycles stream
    asap        = once
    setcps      = asap . cps
:}
