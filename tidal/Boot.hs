:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

-- change to location of this dir:
:cd /path/to/this/dir

import Sound.Tidal.Context

-- https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
-- :def hoogle (\x -> return $ ":!/Users/jarm/Library/Haskell/bin/hoogle --info "++x)

-- :script osc/controllers/Controllers.hs
:script osc/Targets.hs
:script stream/Stream.hs

:script lib/Lib.hs
:script osc/TargetLibs.hs

:set prompt "~ "
