import Data.List (intercalate, sortOn)

:{
let showFrac = show . (fromRational :: Rational -> Double)
    showArc (Arc start stop) = showFrac start ++ ">" ++ showFrac stop
    showMaybeArc a = maybe "analog" showArc a
    showEventAnalog e = (showMaybeArc $ whole e) ++ ":" ++ (showArc $ part e) ++ ":"++ show (value e)
    showEvent e = (showArc $ part e) ++ "," ++ show (value e)
    showPatternStr a pat = intercalate "!" $ map showEvent $ queryArc pat a
    showPattern a pat = map showEvent $ queryArc pat a 
:}
