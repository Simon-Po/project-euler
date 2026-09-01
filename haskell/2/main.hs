fib = sum $ filter even $ go [2,1]
  where
    go list@(first : second : rest)
      | first >= 4000000  = (second : rest )
      | otherwise = go ((first + second) : list)
