~bitwigMidiOut = MIDIOut.newByName("IAC Driver", "Bitwig");
~bitwigMidiOut.latency = 0.0;
~dirt.soundLibrary.addMIDI(\bitwig,  ~bitwigMidiOut);

// ~tialMidiOut   = MIDIOut.newByName("IAC Driver", "Tidal");
// ~tialMidiOut.latency   = 0.0;
// ~dirt.soundLibrary.addMIDI(\midi,    ~tialMidiOut);

// ~vcvMidiOut    = MIDIOut.newByName("IAC Driver", "VCV Rack");
// ~vcvMidiOut.latency    = 0.0;
// ~dirt.soundLibrary.addMIDI(\vcv,     ~vcvMidiOut);

// ~rtpMidiOut    = MIDIOut.newByName("Network", "RTPMIDI1");
// ~rtpMidiOut.latency    = 0.0;
// ~dirt.soundLibrary.addMIDI(\rtpmidi, ~rtpMidiOut);

// ~analogKeys = MIDIOut.newByName("Analog Keys", "Elektron MIDI");
// ~analogKeys.latency = 0.0;
// ~dirt.soundLibrary.addMIDI(\analogkeys, ~analogKeys);

// ~arturia = MIDIOut.newByName("Arturia BeatStep Pro", "Arturia BeatStepPro");
// ~arturia.latency = 0.5;
// ~dirt.soundLibrary.addMIDI(\arturia, ~arturia);
