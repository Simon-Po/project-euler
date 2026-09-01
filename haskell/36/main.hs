import Numeric (showIntAtBase)
import Data.Char (intToDigit)
{-
Project Euler 36
https://projecteuler.net/problem=36

The decimal number, $585 = 1001001001_2$ (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base $10$
and base $2$.

(Please note that the palindromic number, in either base, may not include leading zeros.)
-}

main :: IO ()
main = print $ foldl (\acc x -> if isPalindrom x then acc + x else acc ) 0 [1..999999]




isPalindrom :: Integer -> Bool
isPalindrom i = s == (reverse s) && binary == (reverse binary)
            where
            binary = showIntAtBase 2 intToDigit i ""
            s = show i
