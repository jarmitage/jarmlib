// https://tidalcycles.org/index.php/Controller_Input#MIDI

// Evaluate the block below to start the mapping MIDI -> OSC.
(
var on, off, cc;
var osc;
osc = NetAddr.new("127.0.0.1", 6010);

// efairbanks shizz
// https://github.com/efairbanks/tidal-performance-2019/blob/master/main.scd
// https://www.youtube.com/watch?v=biynSrFygUo

e=();
e.notes=[];

on = MIDIFunc.noteOn({|veloc, num, chan, src|
	e.notes=e.notes.add(num);
	e.notes=e.notes.sort({|a,b| a>b}).reverse;
	osc.sendMsg('/ctrl', "notes", format("%", e.notes-60));
	// e.notes.postln;
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
	e.notes=e.notes.takeThese({|x| x==num});
	osc.sendMsg('/ctrl', "notes", format("%", e.notes-60));
	// e.notes.postln;
});

cc = MIDIFunc.cc({|val, num, chan, src|
	osc.sendMsg('/ctrl', num, val/127.0);
}, nil, nil, nil);

if (~stopMidiToOsc != nil, {
	~stopMidiToOsc.value;
});

~stopMidiToOsc = {
	on.free;
	off.free;
	cc.free;
};
)

// Evaluate the line below to stop it.
// ~stopMidiToOsc.value;



