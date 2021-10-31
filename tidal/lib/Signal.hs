import Control.Applicative -- `liftA2`

-- TODO
-- - [ ] Add segment?
-- - [ ] Add param arg versions?
-- - [ ] Test old funcs

-- Range prime
range' from to p = (p*to - p*from) + from -- TODO: obsolete?
rg' = range'

-- pulse, pulsewidth, shorthands
pulse w  = sig $ \t -> if ((snd $ properFraction t) >= w) then 1.0 else 0.0
pulse' w = liftA2 (\a b -> if (a>=b) then 1.0 else 0.0) saw w
pw       = pulse
pw'      = pulse'

-- perlin noise
per   = perlin
per'  = perlinWith
-- per2  = perlin2
-- per2' = perlin2With

-- continuous at freq
sinf  f = fast f $ sin     -- sine at freq
cosf  f = fast f $ cos     -- cosine at freq
trif  f = fast f $ tri     -- triangle at freq
sawf  f = fast f $ saw     -- saw at freq
isawf f = fast f $ isaw    -- inverted saw at freq
sqf   f = fast f $ sq      -- square at freq
pwf   w f = fast f $ pw w  -- pulse at freq
pwf'  w f = fast f $ pw' w -- pulse' at freq
randf f = fast f $ rand    -- rand at freq
perf  f = fast f $ per     -- perlin at freq
perf' f p = fast f $ per' p     -- perlinWith at freq
-- per2f f = fast f $ per2    -- perlin 2D at freq

-- ranged continuous
rsin  i o = rg' i o sin      -- ranged' sine
rcos  i o = rg' i o cos      -- ranged' cosine
rtri  i o = rg' i o tri      -- ranged' triangle
rsaw  i o = rg' i o saw      -- ranged' saw
risaw i o = rg' i o isaw     -- ranged' inverted saw
rsq   i o = rg' i o sq       -- ranged' square
-- rpw i o w = rg' i o pw w -- ranged' pulse
-- rpw' i o w = rg' i o pw' w -- ranged' pulse'
rrand  i o = rg' i o rand    -- ranged' rand
rper  i o = rg' i o per      -- ranged' perlin
rper' i o p = rg' i o $ per' p     -- ranged' perlinWith

-- ranged continuous exponential
rxsin  i o = rgx i o sin     -- ranged' exponential sine
rxcos  i o = rgx i o cos     -- ranged' exponential cosine
rxtri  i o = rgx i o tri     -- ranged' exponential triangle
rxsaw  i o = rgx i o saw     -- ranged' exponential saw
rxisaw i o = rgx i o isaw    -- ranged' exponential inverted saw
rxsq   i o = rgx i o sq      -- ranged' exponential sqaure
rxpw   i o w = rgx i o pw w  -- ranged' exponential pulse
rxpw'  i o w = rgx i o pw' w -- ranged' exponential pulse'
rxrand i o = rgx i o rand    -- ranged' exponential rand
rxper  i o = rgx i o per     -- ranged' exponential perlin
rxper' i o p = rgx i o $ per' p    -- ranged' exponential perlinWith

-- ranged continuous at freq
rsinf   i o f = fast f $ rsin i o      -- ranged' sine at freq
rcosf   i o f = fast f $ rcos i o      -- ranged' cosine at freq
rtrif   i o f = fast f $ rtri i o      -- ranged' triangle at freq
rsawf   i o f = fast f $ rsaw i o      -- ranged' saw at freq
risawf  i o f = fast f $ risaw i o     -- ranged' inverted saw at freq
rsqf    i o f = fast f $ rsq i o       -- ranged' square at freq
-- rpwf i o w f = fast f $ rpw' i o w -- ranged' pulse at freq
rrandf  i o f = fast f $ rrand i o     -- ranged' rand at freq
rperf   i o f = fast f $ rper i o      -- ranged' perlin at freq
rperf'  i o f p = fast f $ rper' i o p     -- ranged' perlinWith at freq

-- ranged continuous exponential at frequency
rxsinf  i o f = fast f $ rxsin i o     -- ranged' exponential sine at freq
rxcosf  i o f = fast f $ rxcos i o     -- ranged' exponential cosine at freq
rxtrif  i o f = fast f $ rxtri i o     -- ranged' exponential triangle at freq
rxsawf  i o f = fast f $ rxsaw i o     -- ranged' exponential saw at freq
rxisawf i o f = fast f $ rxisaw i o    -- ranged' exponential inverted saw at freq
rxsqf   i o f = fast f $ rxsq i o      -- ranged' exponential square at freq
rxpwf   i o w f = fast f $ rxpw i o w  -- ranged' exponential pulse at freq
rxpwf'  i o w f = fast f $ rxpw' i o w -- ranged' exponential pulse' at freq
rxrandf i o f = fast f $ rxrand i o    -- ranged' exponential random at freq
rxperf  i o f = fast f $ rxper i o     -- ranged' exponential perlin at freq
rxperf' i o f p = fast f $ rxper' i o p    -- ranged' exponential perlinWith at freq

-- prime functions (not needed?)
-- ssin'  i o = sc'  i o sin  -- scaled' sine
-- scos'  i o = sc'  i o cos  -- scaled' cosine
-- stri'  i o = sc'  i o tri  -- scaled' triangle
-- ssaw' i o = sc'  i o saw  -- scaled' saw
-- ssq'   i o = sc'  i o sq   -- scaled' square
-- srand' i o = sc' i o rand  -- scaled' rand
-- ssinf' i o f = fast f $ ssin'   i o -- scaled' sine at freq
-- scosf' i o f = fast f $ scos'   i o -- scaled' cosine at freq
-- strif' i o f = fast f $ stri'   i o -- scaled' triangle at freq
-- ssawf' i o f = fast f $ ssaw'  i o -- scaled' saw at freq
-- ssqf'   i o f = fast f $ ssq'   i o -- scaled' square at freq
-- srandf' i o f = fast f $ srand' i o -- scaled' rand at freq

-- limit values in a Pattern to n equally spaced divisions of 1.
-- quantise' :: (Functor f, RealFrac b) => b -> f b -> f b
quantise' n = fmap ((/n) . (fromIntegral :: RealFrac b => Int -> b) . round . (*n))

-- convert continuous functions to floats, ints, melodies x / x' (struct version)
c2f  t p = seg t $ p                        -- continuous to floats
c2f' t p = struct t $ p                     -- continuous to structured floats
c2i  t p = quantise' 1 $ c2f t p            -- continuous to ints
c2i' t p = quantise' 1 $ c2f' t p           -- continuous to structured ints
c2m  s t p = scale s $ round <$> (c2f t p)  -- continuous to melodic scale
c2m' s t p = scale s $ round <$> (c2f' t p) -- continuous to structured melodic scale
