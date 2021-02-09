-- UTL-Nano OSC Note
:{
let notechannel = notechan
    notech      = notechan
    notec       = notechan
    notedel     = notedelay
    noted       = notedelay
    notex       = noteexp
:}

-- UTL-Nano OSC Control
:{
let ctl c ch = control c # controlchannel ch
    ctl' c (#) ch = control c # controlchannel ch
:}

-- UTL-Nano OSC Clock (?)
:{
let clock = lcclock 1
:}
