-- Clase 03 --

-- Recursion --

factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n-1)


                
-- Implementar la funcion fibonacci.
fib :: Int -> Int
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib (n-1) + fib (n-2)


parteEntera :: Float -> Integer
parteEntera n | n >= 0 && n < 1 = 0
              | n >= 1 = parteEntera (n-1) + 1


esMultiplode3 :: Int -> Bool
esMultiplode3 n | n == 0 = True
                | n == 1 || n == 2 = False
                | otherwise = esMultiplode3 (n-3)

sumaImpares :: Int -> Int
sumaImpares n | n == 1 = 1
              | otherwise = (2*n-1) + sumaImpares(n-1)

medioFact :: Int -> Int
medioFact n | n == 0 = 1
            | n == 1 = 1
            | n > 0 = n * medioFact (n-2) 
            
sumaDeDigitos :: Int -> Int
sumaDeDigitos n | n >= 0 || n <= 9 = n
                | n > 9 = (mod n 10) + sumaDeDigitos (div n 10)


digitosIguales :: Int -> Bool
digitosIguales n | n < 10 = True
                 | otherwise = digitosIguales (div n 10) && mod n 10 == mod (div n 10) 10
                 


