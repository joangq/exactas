-- Fibonacci
fib :: Float -> Integer
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib (n-1) + fib (n-2)
parteEntera :: Float -> Int
parteEntera n | n >= 0 && n < 1 = 0
              | n >= 1 = parteEntera(n-1) + 1      


multiploDeTres :: Int -> Bool
multiploDeTres n | x == 0 = True
                 | x == 1 = False
                 | otherwise = multiploDeTres (x - 3)
                 where x = abs n
 

sumaImpares :: Int -> Int
sumaImpares 1 = 1
sumaImpares n = x + sumaImpares(n-1)
            where x = (2*n)-1

medioFact :: Int -> Int
medioFact n | n == 0 || n ==1 = 1
            | otherwise = n * medioFact(n-2)
            
{-

*Main> div (mod 1234 10) 1
4
*Main> div (mod 1234 100) 10
3
*Main> div (mod 1234 1000) 100
2
*Main> div (mod 1234 10000) 1000
1

-}

-- sumaDigitos 1234 = 1+2+3+4 = 10
-- sumaDigitos 2001 = 2+0+0+1 = 3

-- No implementar las siguientes funciones --------------------
cantDigitos :: Float -> Int
cantDigitos n = parteEntera ((logBase 10 n)+1)

enesimoDigito :: Float -> Int -> Int
enesimoDigito n i | l == 1 = round n
                  | l > 1 = div (mod (round n) (10^i)) (10^(i-1))
                  where l = cantDigitos n

ultimoDigito :: Float -> Int
ultimoDigito n | l == 1 = round n
               | l > 1 = enesimoDigito n l
               where l = cantDigitos n
               
------------------------------------------------------------------

sumaDigitos :: Int -> Int
sumaDigitos n | (n > 0) && (n <= 9) = n
              | otherwise = (mod n 10) + sumaDigitos(div n 10)
              
------------------------------------------------------------------

digitosIguales :: Float -> Bool
digitosIguales n = (sumaDigitos r) == (mod r 10) * (cantDigitos n) 
               where r = round n
               
------------------------------------------------------------------
              
