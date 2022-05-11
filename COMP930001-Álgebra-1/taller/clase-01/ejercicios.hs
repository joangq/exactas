-- absoluto: Valor absoluto de un número entero
absoluto :: Int -> Int
absoluto x | x >= 0 = x
           | otherwise = (-x)


-- maximoabsoluto: El máximo entre el valor absoluto de dos números enteros
maximoabsoluto :: Int -> Int -> Int
maximoabsoluto a b = max (absoluto a) (absoluto b)

-- maximo3: El máximo de tres enteros
maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c = max (max a b) (max b c)

-- algunoEs0: Dados dos Float, decidir si uno es cero.
algunoEs0 :: Float -> Float -> Bool
algunoEs0 a b = a * b == 0

-- algunoEs0 usando pattern matching
algunoEs0_2 :: Float -> Float -> Bool
algunoEs0_2 _ 0 = True
algunoEs0_2 0 _ = True
algunoEs0_2 _ _ = False

-- ambosSon0: Dados dos Float, decidir si ambos son cero.
ambosSon0 :: Float -> Float -> Bool
ambosSon0 a b = (a == 0) && (a == b)

-- ambosSon0 usando pattern matching
ambosSon0_2 :: Float -> Float -> Bool
ambosSon0_2 0 0 = True
ambosSon0_2 _ _ = False

-- esMultiploDe: Dados dos Int, decidir si el 1ro es multiplo del 2do
esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b = mod a b == 0

-- digitoUnidades: Dado un Int, extraer el dígito de las unidades.
digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

-- digitoDecenas: Dado un Int, extraer el dígito de las decenas.
digitoDecenas :: Int -> Int
digitoDecenas x  = (((abs x) - digitoUnidades (abs x)) `mod` 100) `div` 10
