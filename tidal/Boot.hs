:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

import Sound.Tidal.Context

-- https://github.com/ndmitchell/hoogle/blob/master/docs/Install.md
:def hoogle (\x -> return $ ":!/path/to/Haskell/bin/hoogle --info "++x)

-- :script /path/to/this/repo/tidal/targets/Targets.hs
:script /path/to/this/repo/tidal/streams/Streams.hs
:script /path/to/this/repo/tidal/lib/Lib.hs

:set prompt "~ "
