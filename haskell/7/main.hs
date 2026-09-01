{-
Project Euler 7
https://projecteuler.net/problem=7

By listing the first six prime numbers: $2, 3, 5, 7, 11$, and $13$, we can see that the
$6$th prime is $13$.

What is the $10\,001$st prime number?
-}

main :: IO ()
main = print (head $ reverse $ take 10001 primes)

primes =
  [ x
  | x <- [2..]
  , all (\y -> x `mod` y /= 0) [2 .. truncate (sqrt (fromIntegral x))]
  ]
