/*

https://github.com/musikinformatik/SuperDirt/blob/master/synths/default-synths.scd

Add your own instruments here.
They can be used in Tidal just as samples (ignoring the sample number, so instead of "bd:2" write "inr")

// supported parameters are e.g.
// sustain, speed, endSpeed, begin, end, pan, accelerate, offset, cps
// all instruments ought to use: out

If your SuperDirt instance is assigned to the variable ~dirt, you can livecode these synths.
*/

 // live audio input
SynthDef(\in, { |out, sustain = 1, speed = 1, begin = 0, end = 1, pan, accelerate, amp = 1, offset|
	var env, sound, rate, phase;
	phase = Line.ar(begin, end, sustain);
	rate = (begin + 1) * (speed + Sweep.kr(1, accelerate));
	sound = SoundIn.ar([0, 1]); // stereo in
	OffsetOut.ar(out,
		DirtPan.ar(sound, ~dirt.numChannels, pan, amp)
	)
}).add;

/*
https://github.com/BelaPlatform/Bela/blob/master/examples/12-SuperCollider-EXPERIMENTAL/remote-examples/bela_complete_examples.scd

  Please note that support for SuperCollider on Bela is still experimental,
so feel free to report issues here: https://github.com/sensestage/supercollider/issues

 This file contains code that should be run on your computer from
 within the SuperCollider IDE, while `scsynth` is running on the board.

 In order to start `scsynth`, run the `12-SuperCollider/start-scsynth`
 example project or run the `scripts/scsynth.sh` script from a terminal
 on the host.

 You will need to add the class files for the Bela-specific UGens to your
 computer in order to run these scripts. You can get them here
 https://github.com/sensestage/bela-remote
 */

// connect to bela
Server.default = s = Server("belaServer", NetAddr("192.168.7.2", 57110));
s.initTree;
s.startAliveThread;

(
SynthDef("AnalogIn",{ arg out=0;
	Out.ar(out,
		SinOsc.ar( AnalogIn.ar( 0 ).poll.exprange( 200, 5000 ), 0, 0.1 )
	)
}).send(s);
);

a = Synth.new("AnalogIn", target: s).postln;
a.free;

//
(
SynthDef(\anintest, { |out, sustain = 1, speed = 1, begin = 0, end = 1, pan, accelerate, amp = 1, offset|
	var env, sound, rate, phase;
	phase = Line.ar(begin, end, sustain);
	rate = (begin + 1) * (speed + Sweep.kr(1, accelerate));
	sound = SinOsc.ar( AnalogIn.ar( 0 ).poll.exprange( 200, 5000 ), 0, 0.1 );
	OffsetOut.ar(out,
		DirtPan.ar(sound, ~dirt.numChannels, pan, amp)
	)
}).send(s);
);

b = Synth.new("anintest", target: s).postln;
b.free;

// live audio input
SynthDef(\anintest2, { |out, sustain = 1, speed = 1, begin = 0, end = 1, pan, accelerate, amp = 1, offset|
	var env, sound, rate, phase;
	phase = Line.ar(begin, end, sustain);
	rate = (begin + 1) * (speed + Sweep.kr(1, accelerate));
	sound = SinOsc.ar( AnalogIn.ar( 0 ).poll.exprange( 200, 5000 ), 0, 0.1 );
	OffsetOut.ar(out,
		DirtPan.ar(sound, ~dirt.numChannels, pan, amp)
	)
}).send(s);