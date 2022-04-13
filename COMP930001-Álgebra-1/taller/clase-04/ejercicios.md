[@Joan-GQ](https://github.com/Joan-GQ)
```
-- Ejemplo de sumatoria
sumatoria :: Int -> Int
sumatoria 1 = 1
sumatoria n = n + sumatoria(n-1)

-- f1(n)
f1 :: Int -> Int
f1 0 = 1
f1 n = (2^n) + f1(n-1)

-- f2(n)
f2 0 _ = 0
f2 1 q = q
f2 _ 0 = 0
f2 n q = q**n + f2 (n-1) q

-- f3(n)
f3 0 _ = 1
f3 n q = q**(2*n-1) + q**(2*n) + f3 (n-1) q

-- f4(n)
f4 0 _ = 1
f4 n q = (f4 (n-1) q) + q**(2*n - 1) + q**(2*n) - q**(n-1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = factorial(n-1) * n

-- eAprox
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / fromIntegral (factorial(n))) + eAprox(n-1)

-- e
e :: Float
e = eAprox 10

-- Doble sumatoria

-- Suma auxiliar (igual a f2)
sumAux :: Float -> Float -> Float
sumAux n m | n == 1 = m
           | otherwise = m**n + sumAux(n-1) m

dobleSuma 0 0 = 1
dobleSuma n m = (sumAux n m) * n + sumAux n m
```
