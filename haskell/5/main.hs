import Data.List (find)
{-
Project Euler 5
https://projecteuler.net/problem=5

$2520$ is the smallest number that can be divided by each of the numbers
from $1$ to
$10$ without any remainder.

What is the smallest positive number that is evenly divisible
(divisible with no remainder) by all of the numbers from $1$ to $20$?
-}

main :: IO ()
main = print (case find (\n -> all (\x -> n `mod` x == 0) [1..20]) [20,40..] of
              Just x -> x
              _ -> 0
             )
main2 :: IO ()
main2 = print (foldr1 lcm [1..20])
