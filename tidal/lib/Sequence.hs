
-- TODO
-- - Add more number sequences
-- 	 + Primes
-- 	 + ...?

-- Reverse
ri a = rev (r a) -- run inverted

-- Odd and even
rodd   a = (((r a) + 1) * 2) - 1 -- run of odd numbers
reven  a =  ((r a) + 1) * 2      -- run of even numbers
roddi  a = rev (rodd a)          -- run of odd numbers inverted
reveni a = rev (reven a)         -- run of even numbers inverted

-- Fibonacci functions by Lizzie Wilson / Digital Selves

-- fibonacci sequence, gives nth term
:{
fib:: (Eq a, Num a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib n = fib (n-1)+ fib (n-2)
:}

--  calculate the series given initial conditions.
:{
fibSeries :: Num t => t -> t -> [t]
fibSeries a b = a : (fibSeries b (a+b))
:}

:{
-- output some array of m terms
fibs :: Num a => Int -> [a]
fibs m = take m ( fibSeries 0 1)
:}

-- example use ?
-- fibPat = fibs 8
-- fibPat' = listToPat (fibPat)
