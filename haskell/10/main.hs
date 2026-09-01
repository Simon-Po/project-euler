import Control.Monad.ST
import Data.Array.Base
{-
Project Euler 10
https://projecteuler.net/problem=10

The sum of the primes below $10$ is $2 + 3 + 5 + 7 = 17$.

Find the sum of all the primes below two million.
-}

main :: IO ()
main = print (sum $ primes 2000000)





-- for p from 2 while p*p <= N:
--     if isPrime[p]:
--         for multiple from p*p to N, stepping by p:
--             isPrime[multiple] = false
-- finally:
--     every index whose value is true is a prime

primes :: Int -> [Int]
primes n
  | n < 2 = []
  | otherwise = runST $ do
        arr <- newArray (0, n) True :: ST s (STUArray s Int Bool)
        writeArray arr 0 False
        writeArray arr 1 False
        mapM_ (\x -> writeArray arr x False) [4,6..n]
        mapM_ (\x -> do
            isPrime <- readArray arr x
            if isPrime
            then
                mapM_ (\y -> writeArray arr y False) [(x*x),((x*x)+(2*x)).. n]
            else pure ()) [3,5..floor (sqrt (fromIntegral n))]
        elems <- getElems arr
        pure [index | (isPrime,index) <- zip elems [0..n],isPrime ]
