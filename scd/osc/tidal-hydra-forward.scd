// atom-hydra
// based on tidal-forward.scd
// https://github.com/ojack/hydra-examples/blob/master/tidal/tidal-forward.scd
// forwards all tidal messages to port 3333

OSCFunc({ |msg, time, tidalAddr|
	var latency = time - Main.elapsedTime;
	var addr = NetAddr.new("127.0.0.1", 3333);
	msg = msg ++ ["time", time, "latency", latency];
	// msg.postln;
	addr.sendBundle(latency, msg)
}, '/play2').fix;
