-- LiveCore OSC Spec template
:{
lcOSCSpec t = [OSC note2Path  $ ArgList $ note2Args++oscBundle++t,
               -- OSC notePath   $ ArgList $ noteArgs++oscBundle++t,
               OSC ctlPath    $ ArgList $ ctlArgs++oscBundle++t,
               -- OSC samplePath $ ArgList $ sampleArgs++t,
               OSC patchPath  $ ArgList $ patchArgs++oscBundle++t,
               OSC clockPath  $ ArgList $ clockArgs++t]
:}

-- OSC Specs for targets 0-7
lcOSCSpec0 = lcOSCSpec _lcT0
lcOSCSpec1 = lcOSCSpec _lcT1
lcOSCSpec2 = lcOSCSpec _lcT2
lcOSCSpec3 = lcOSCSpec _lcT3
lcOSCSpec4 = lcOSCSpec _lcT4
lcOSCSpec5 = lcOSCSpec _lcT5
lcOSCSpec6 = lcOSCSpec _lcT6
lcOSCSpec7 = lcOSCSpec _lcT7
