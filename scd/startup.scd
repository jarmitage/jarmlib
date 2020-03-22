// TEST IF HAVING TROUBLE
// (
// s.options.numBuffers = 1024 * 256;
// s.options.memSize = 8192 * 32;
// s.options.maxNodes = 1024 * 32;

// s.options.numOutputBusChannels = 2;
// s.options.numInputBusChannels = 2;

// s.boot();
// );


(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html
s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"

// For system default
// s.options.numOutputBusChannels = 2;
// s.options.numInputBusChannels = 2;

// For general purpose
s.options.numOutputBusChannels = 16;
s.options.numInputBusChannels  = 2;
s.options.device = "SuperCollider";

// For simultaneously using inputs from MOTU
// s.options.numOutputBusChannels = 34;
// s.options.numInputBusChannels = 34;
// s.options.device = "SuperColliderMOTUAggregate";

// For simultaneously using inputs from Scarlett
// s.options.numOutputBusChannels = 34;
// s.options.numInputBusChannels = 34;
// s.options.device = "SuperColliderScarlettAggregate";

// boot the server and start SuperDirt
s.waitForBoot {
	~dirt = SuperDirt(2, s); // 2x channels per orbit (stereo pairs)
	// ~dirt = SuperDirt(4, s); // 8x channels per orbit (multichannel surround)
	
	s.sync;

	~dirt.start(57120, [0, 2, 4, 6, 8, 10, 12, 14]); // 8x stereo pairs / orbits
	// ~dirt.start(57120, [0, 4, 8, 12, 16]); // 8x 4-way pairs / orbits
	// ~dirt.start(57120, [0, 0, 0, 0, 0, 0, 0, 0]); // 8x 4 channel outputs / orbits (multichannel surround)

	// vivid-synth
	// ("/Users/jarm/SparkleShare/gitlab.com/tidal/lib/scd/misc/VividSynthDefs.scd").load; // args? dirtpan?
	// SynthDef(\viv0, {|out=0, freq=440, pan=0.5| }).add;
	// SynthDef(\viv1, {|out=0, freq=440, pan=0.5| }).add;

	// Debug print OSC messages
	// s.dumpOSC(1);

};

s.latency = 1.5; // increase this if you get "late" messages

);
