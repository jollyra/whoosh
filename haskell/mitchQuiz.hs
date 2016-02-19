join :: [a] -> [a] -> [a]
join [] ys = ys
join xs ys = head xs : join (tail xs) ys

la = [2,2,2,1,2,4,7,8]
-- [[2,2,2],[2,4],[8]]
splitWith :: (a -> Bool) -> [a] -> [[a]]
-- splitWith :: (a -> Bool) -> [a] -> [a]
splitWith f [] = []
splitWith f xs = splitWith' f xs acc
    where splitWith' f xs [] 
        takeTo = undefined
