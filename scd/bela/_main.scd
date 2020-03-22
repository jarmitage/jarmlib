/**
This script exemplifies the use of SuperCollider on Bela.
When a project contains a `_main.scd` file, `sclang` is started
and the content of the file is executed.
If you want to interact with SuperCollider running on the board
from within the SuperCollider IDE on your computer, check out 
the 12-SuperCollider/remote examples instead.
Those files also include more code examples to interface with
Bela-specific UGens.
 */
Server.default = Server(\bela, NetAddr("192.168.7.2", 57110)); 
s = Server.default;

s.options.numAnalogInChannels = 8;
s.options.numAnalogOutChannels = 8;
s.options.numDigitalChannels = 16;

s.options.pgaGainLeft = 4;     // sets the pga gain of the left channel to 4 dB
s.options.pgaGainRight = 5;    // sets the pga gain of the right channel to 5 dB
s.options.headphoneLevel = -8; // sets the headphone level to -8 dB
s.options.speakerMuted = 0;    // the speakers are not muted (so active)
s.options.dacLevel = -5;       // sets the gain of the dac to -5 dB
s.options.adcLevel = -3;       // sets the gain of the adc to -3 dB
s.options.numMultiplexChannels = 0; // do not enable multiplexer channels
s.options.belaPRU = 0;         // select the PRU on which Bela audio will run

s.options.blockSize = 16;
s.options.numInputBusChannels = 2;
s.options.numOutputBusChannels = 2;
s.options.numAudioBusChannels = 1024;

s.options.numBuffers = 1024 * 16; // increase this if you need to load more samples
s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"

s.options.maxLogins = 64;  // set max number of clients
s.options.postln;

s.waitForBoot({
	~dirt = SuperDirt(2, s);
	// ~dirt.loadSoundFiles(); // increase numBuffers to 1024 * 128 for this to work
  	s.sync;
	// ~dirt.start(57120, [0, 0], (NetAddr("192.168.7.1")));
	~dirt.start(57120, [0, 0]);
	// OSCFunc.trace (true, true); // print OSC messages to the console to verify connection with Tidal
});

s.latency = 0.5;
