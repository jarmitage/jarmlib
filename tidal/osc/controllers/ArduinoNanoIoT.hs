-- https://desertbot.io/blog/arduino-nano-33-iot-imu

-- TODO
-- - Sensor processing: 
--   - possible/desirable to take derivates?
--   - filtering, smoothing?
--   - downsampling
--   - averaging

-- Arduino Nano IoT OSC input params
:{
let nanoai i = cF 0 $ "nanoain"      ++ i -- analog  in
    nanodi i = cF 0 $ "nanodin"      ++ i -- digital in
    nanoia a = cF 0 $ "nanoimuaccel" ++ a -- imu acceleration axis
    nanoig g = cF 0 $ "nanoimugyro"  ++ g -- imu gyroscope axis
:}

-- ("nanoai", )

-- nano "anin1"

-- nanoai "0 1 2"

-- nano "a" 1
-- nano "i" "x"
