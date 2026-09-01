import Data.List
 {-
Project Euler 4
https://projecteuler.net/problem=4

A palindromic number reads the same both ways. The largest palindrome made from the
product of two $2$-digit numbers is $9009 = 91 \times 99$.

Find the largest palindrome made from the product of two $3$-digit numbers.
-}

main :: IO ()
main = print (maximum p)

p = [ x * y| x <- [100..999], y <- [100..999], isPalindrom (x * y)]
               where
               isPalindrom x =
                           let s = show x in
                           s == (reverse s)
