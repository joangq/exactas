pertenece :: Integer -> [Integer] -> Bool
pertenece _ [] = False
pertenece n xs = n == head xs || pertenece n (tail xs)

{- Lista del 1 al -100
 - [1,0..(-100)]
 -}

pm :: [Integer] -> Integer
pm [] = undefined
pm (x:xs) | mod x 45345 == 0 = x
          | otherwise = pm xs
      
pertenecePM :: Integer -> [Integer] -> Bool
pertenecePM _ [] = False
pertenecePM n (x:xs) = (n == x) || (pertenecePM x xs)

maximo :: [Integer] -> Integer
maximo [] = undefined
maximo [a,b] = max a b
maximo (x:xs) = maximo xs 

--isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [a] = True
isSorted [a,b] = a < b
isSorted (x:xs) = x <= (head xs) && (isSorted xs)

{-bsort [a,b] = [(min a b), (max a b)]
bsort (x:xs) | isSorted (x:xs) = (x:xs)
             | otherwise = (head t) : (head (tail t)) : 
             where
                t = bsort [x, head xs]-}
                
                
