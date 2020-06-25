:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

import Sound.Tidal.Context

-- https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
:def hoogle (\x -> return $ ":!/Users/xxx/Library/Haskell/bin/hoogle --info "++x)

-- :script /path/to/here/tidal/osc/controllers/Controllers.hs
:script /path/to/here/tidal/osc/targets/Targets.hs
:script /path/to/here/tidal/stream/Stream.hs

:script /path/to/here/tidal/lib/Lib.hs
:script /path/to/here/tidal/osc/targets/TargetLibs.hs

:set prompt "~ "
