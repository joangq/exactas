--Clase 6 listas--

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria xs = head xs + sumatoria (tail xs)  

longitud :: [Int] -> Int
longitud [] = 0
longitud xs = 1 + longitud (tail xs)

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece n xs | n == head xs = True
               | otherwise = pertenece n (tail xs)

primerMultiplode45345 :: [Int] -> Int
primerMultiplode45345 xs | mod (head xs) 45345 == 0 = head xs
                         | otherwise = primerMultiplode45345 (tail xs)

sumatoriaPM :: [Int] -> Int
sumatoriaPM [] = 0
sumatoriaPM (x:xs) = x + sumatoriaPM xs


longitudPM :: [Int] -> Int
longitudPM [] = 0
longitudPM (x:xs) = 1 + longitudPM xs

pertenecePM :: Int -> [Int] -> Bool
pertenecePM _ [] = False
pertenecePM n (x:xs) | n == x = True
                     | otherwise = pertenecePM n xs
                     
--Ejercicios de tarea--
productoriaPM :: [Int] -> Int
productoriaPM [] = 1
productoriaPM (x:xs) = x * productoriaPM xs

sumarN :: Int -> [Int] -> [Int]
sumarN n [] = []
sumarN n (x:xs) = (n + x) : sumarN n xs 

sumarElPrimero :: [Int] -> [Int]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Int] -> [Int]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (ultimo xs) (x:xs) 

ultimo :: [Int] -> Int
ultimo [x] = x
ultimo (x:xs) = ultimo (tail xs) 

pares :: [Int] -> [Int]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs
             

multiplosDeN :: Int -> [Int] -> [Int]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : (multiplosDeN n (tail xs))
                      | otherwise = multiplosDeN x xs
