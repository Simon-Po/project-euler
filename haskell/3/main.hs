{-
Project Euler 3
https://projecteuler.net/problem=3

The prime factors of $13195$ are $5, 7, 13$ and $29$.

What is the largest prime factor of the number $600851475143$?

How Trial Division Works

Start with a divisor (\(d\)) of 2.

Divide repeatedly:
While the number \(n\) is divisible by \(d\), add \(d\) to your list of factors and divide \(n\) by \(d\).

Increment the divisor: Increase \(d\) by 1 (or by 2 after checking 2) until \(d \times d > n\).

Finish up: If \(n\) is still greater than 1 after the loop,
that remaining value of \(n\) is also a prime factor.

-}

main :: IO ()
main = print (case f 600851475143 of
              [] -> "none"
              (biggest : _) -> show biggest
              )

f :: Integer -> [Integer]
f n =  go n 2 []
  where
  go n d factors
     | d*d > n = if n > 1 then n : factors else factors
     | n `mod` d == 0 = go (n`div`d) d (d : factors)
     | n `mod` d /= 0 = go n (d + 1) factors
