import Data.Ord (comparing)
import Data.List (maximumBy)
{-
Project Euler 14
https://projecteuler.net/problem=14

The following iterative sequence is defined for the set of positive integers:

* $n \to n/2$ ($n$ is even)
* $n \to 3n + 1$ ($n$ is odd)

Using the rule above and starting with $13$, we generate the following sequence: $$13
\to 40 \to 20 \to 10 \to 5 \to 16 \to 8 \to 4 \to 2 \to 1.$$

It can be seen that this sequence (starting at $13$ and finishing at $1$) contains $10$
terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting
numbers finish at $1$.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
-}

main :: IO ()
main = print $ fst $ maximumBy (comparing snd) [ (x, length (collatz x [])) | x <- [1..1000000]]

-- if this never stops it disproves collatz
collatz :: Integer -> [Integer] -> [Integer]
collatz 1 seq = reverse $ 1 : seq
collatz n seq
        | even n = collatz (n`div`2) (n : seq)
        | otherwise = collatz (n*3+1) (n : seq)
