
-- TODO
-- - Obsolete?

-- cc = grp [mF "ccn", mF "ccv"]
-- ccn = pF "ccn"
-- ccv = pF "ccv"

-- 0-1 input 
toM val = rg 0 127 val
cc' p n = ccv (toM p) # ccn n
