import Data.Sequence ((|>))
{-
Project Euler 48
https://projecteuler.net/problem=48

The series, $1^1 + 2^2 + 3^3 + \cdots + 10^{10} = 10405071317$.

Find the last ten digits of the series, $1^1 + 2^2 + 3^3 + \cdots + 1000^{1000}$.
-}

main :: IO ()
main = print $ lastTenDigits $ sum [x^x |x <- [1..1000]]
     where
     lastTenDigits i = reverse $ take 10 $ reverse $ show i
