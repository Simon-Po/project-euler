{-
Project Euler 13
https://projecteuler.net/problem=13

Work out the first ten digits of the sum of the following one-hundred $50$-digit numbers.

-}


main :: IO ()
main = do
     content <- readFile "input.txt"
     let numbers = map read (lines content) :: [Integer]
     print $ getFirstTenDigits numbers

getFirstTenDigits :: [Integer] -> String
getFirstTenDigits = take 10 . show . sum
