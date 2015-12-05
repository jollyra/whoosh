import Data.Char (digitToInt)

-- Exercise 4.1
-- Functions in Haskell can be classified as partial or total. Partial functions are defined
-- only for a subset of inputs whereas total functions are defined over the entire input domain.

-- Here are "safe" definitions of the standard partial list functions:
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast [x] = Just x
safeLast (x:xs) = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit (x:[]) = Just []
safeInit (xs) = Just (init xs)


-- Recursive definition of asInt
asIntRecursive :: String -> Int
asIntRecursive xs = loop 0 xs
    where loop acc [] = acc
          loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                            in loop acc' xs

type ErrorMessage = String

asIntFold :: String -> Either ErrorMessage Int
asIntFold [] = ErrorMessage "Empty string of digits"
asIntFold ('-':[]) = ErrorMessage "Cannot convert to Int"
asIntFold ('-':xs) = asIntFold (xs ++ "-")
asIntFold xs = foldl transform 0 xs
    where transform acc '-' = acc * (-1)
          transform acc d = acc * 10 + digitToInt d
