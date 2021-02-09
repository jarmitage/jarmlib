import qualified Sound.Tidal.Tempo as T

-- LiveCore OSC scheduler init and reset
:{
let
  lcinit = once
    $ stack [
        lcclock 0 # t0,
        lcclock 0 # t1,
        lcclock 0 # t2,
        lcclock 0 # t3,
        lcclock 0 # t4,
        lcclock 0 # t5,
        lcclock 0 # t6,
        lcclock 0 # t7
      ]
:}

:{
let
  lcreset =
    do
      resetCycles
      lcinit
:}

-- Reset LiveCore OSC on boot
-- lcreset

:{
_setCycle c tempoMV = T.changeTempo tempoMV (\t tempo -> tempo {T.atTime = t, T.atCycle = c})

streamSetCycle c s = do _ <- _setCycle c (sTempoMV s)
                        return ()

setCycle c = streamSetCycle c stream
:}

:{
let
  lcsetcycle x =
    do
      setCycle x
      lcinit
:}

:{
let transportPattern = p 17
    clock = _target0 1
    transport x = transportPattern $ lcclock x #clock
:}

