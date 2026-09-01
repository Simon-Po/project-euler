import Data.Char (digitToInt)
{-
Project Euler 34
https://projecteuler.net/problem=34

$145$ is a curious number, as $1! + 4! + 5! = 1 + 24 + 120 = 145$.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: As $1! = 1$ and $2! = 2$ are not sums they are not included.


Notes:
since 8 * 9! < 10^7  is true we only have to check until 2540160 -- 7 * 9!

-}

main :: IO ()
main = print $ sum $ filter isTriangle [3..2540160]
     where
     isTriangle n = (sum $ map (fact . digitToInt) $ show n) == n
     fact n = product [1..n]
