# jarmlib: Jack Armitage's (mostly TidalCycles) live coding library

This is not a "working repo", I just update this occassionally to make what I do a bit more shareable.

Currently this doesn't include much SuperCollider / SuperDirt code as that's a mess.
Also not included as of now is Emacs stuffs.
If you poke me I might do something about that.

Mostly what I'm trying to achieve with live coding is efficiency, flexibility, minimal cognitive overhead, and easy memorisation (both cognitive and embodied).

## Overview
- Three main Haskell files: 
    + `Boot.hs`: the main entry point.
    + `Lib.hs`: extra functionality.
    + `Targets.hs`: destinations for sending Tidal pattersn to (AKA `OSCTargets`).
- Some random SuperCollider bits:
    + `tidal-midi-setup.scd` possibly the only thing here that's useful to anyone other than me.

### `Boot.hs`
- Main entry point kept simple as possible
- Includes `hoogle` if you have that installed

### `Lib.hs` (in order of import)
- `Shorthands.hs`: shorthand versions of standard Tidal functions/parameters. Because life is short.
- `Signal.hs`: efficient ways to work with "continuous functions".
- `Sequence.hs`: number sequences.
- `Param.hs`: efficient ways to work with groups of parameters.
- `Harmony.hs`: a `keyTable` and a `harmonise` function for writing in-key chord sequences efficiently.
- `Composition.hs`: experiments in writing Tidal "tracks".
- `MIDI.hs`: any custom MIDI stuff.
- `Misc.hs`: misc.
- `Compatibility.hs`: anything deprecated.

### `Targets.hs`
- `SuperDirt.hs` (basically the rest of the default `BootTidal.hs`)
- `Bitwig/BitwigAPI.hs` (experimental)
- Other experiments

## Setup
- Set the absolute paths in `Boot.hs`, `Targets.hs` and `Lib.hs`
- Run `:script /path/to/Boot.hs` when booting Tidal (this will depend on your editor)

## Customisation
- Comment out what you do/don't want inside `Boot.hs`, `Targets.hs` and `Lib.hs`

## Questions/comments
- Why isn't this "proper Haskell/SuperCollider code/modules"? I'm lazy, and this works fine!
- Contact here or Twitter (`@jdkarmitage`).

## Buy Me A Coffee
- Merci! https://www.buymeacoffee.com/jarmitage
