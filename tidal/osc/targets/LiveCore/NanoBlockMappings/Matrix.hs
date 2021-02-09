-- UTL-Nano OSC Matrix (?)
:{
let matrix       = patch
    matrixinput  = patchinput
    matrixdepth  = patchdepth
    matrixoutput = patchoutput
    mx  = matrix
    mxi = matrixinput
    mxd = matrixdepth
    mxo = matrixoutput
    mxio   i o     = mxi i # mxo o
    mxido  i d o   = mxi i # mxd d # mxo o
    mxio'  i (#) o = mxi i # mxo o
    -- mxido' i (+) d (-) o = mxi i (+) mxd d (-) mxo o
:}