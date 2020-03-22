
-- TODO
-- - Add more number sequences
-- 	 + Primes
-- 	 + Fibonacci
-- 	 + ...?

-- Reverse
ri a = rev (r a) -- run inverted

-- Odd and even
rodd   a = (((r a) + 1) * 2) - 1 -- run of odd numbers
reven  a =  ((r a) + 1) * 2      -- run of even numbers
roddi  a = rev (rodd a)          -- run of odd numbers inverted
reveni a = rev (reven a)         -- run of even numbers inverted
