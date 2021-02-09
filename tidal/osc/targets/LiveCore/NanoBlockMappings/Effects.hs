-- Effects Rack
:{
fx_ = "fltshape fltcut fltres combdamp combcut combfb combmix grainpitch grainpitchjitt graindelay grainsize graindist grainjitt grainfreeze grainmix specoffset specatt specrel specshift specblur specnoise specmix timestretchspeed timestretchtilt timestretchshift timestretchmix lpgres lpgdecay lpgshape lpgthresh lpgmix globalmix globalreset"
fx_fltshape x = control x # controlchannel 0
fx_fltcut x = control x # controlchannel 1
fx_fltres x = control x # controlchannel 2
fx_combdamp x = control x # controlchannel 3
fx_combcut x = control x # controlchannel 4
fx_combfb x = control x # controlchannel 5
fx_combmix x = control x # controlchannel 21
fx_grainpitch x = control x # controlchannel 6
fx_grainpitchjitt x = control x # controlchannel 7
fx_graindelay x = control x # controlchannel 8
fx_grainsize x = control x # controlchannel 9
fx_graindist x = control x # controlchannel 10
fx_grainjitt x = control x # controlchannel 11
fx_grainfreeze x = control x # controlchannel 30
fx_grainmix x = control x # controlchannel 22
fx_specoffset x = control x # controlchannel 12
fx_specatt x = control x # controlchannel 13
fx_specrel x = control x # controlchannel 14
fx_specshift x = control x # controlchannel 15
fx_specblur x = control x # controlchannel 16
fx_specnoise x = control x # controlchannel 17
fx_specmix x = control x # controlchannel 19
fx_timestretchspeed x = control x # controlchannel 24
fx_timestretchtilt x = control x # controlchannel 25
fx_timestretchshift x = control x # controlchannel 26
fx_timestretchmix x = control x # controlchannel 20
fx_lpgres x = control x # controlchannel 31
fx_lpgdecay x = control x # controlchannel 32
fx_lpgshape x = control x # controlchannel 33
fx_lpgthresh x = control x # controlchannel 34
fx_lpgmix x = control x # controlchannel 23
fx_globalmix x = control x # controlchannel 18
fx_globalreset x = control x # controlchannel 35
:}