factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n-1)
            
fib :: Int -> Int
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib (n-1) + fib (n-2)

--sumaDivisoresHasta
sumaDivisoresHasta :: Int -> Int -> Int
sumaDivisoresHasta n 1 = 1
sumaDivisoresHasta n k | mod n k == 0 = k + sumaDivisoresHasta n (k-1)
                       | otherwise = sumaDivisoresHasta n (k-1)
                       
--sumaDivisores
sumaDivisores n = sumaDivisoresHasta n n

--menorDivisorDesde
menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n k | n == k = n
                      | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)
                      
--menorDivisor
menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2

--esPrimo
esPrimo :: Int -> Bool
esPrimo n = menorDivisor n == n

proximoPrimo :: Int -> Int
proximoPrimo n | esPrimo (n+1) = (n+1)
               | otherwise = proximoPrimo (n+1)
               
nEsimoPrimo :: Int -> Int
nEsimoPrimo 1 = 2
nEsimoPrimo n = proximoPrimo (nEsimoPrimo (n-1))

--menorFactDesde
menorFactDesdeDesde :: Int -> Int -> Int
menorFactDesdeDesde n k | (factorial k) >= n = factorial k
                        | otherwise = menorFactDesdeDesde n (k+1)

menorFactDesde :: Int -> Int
menorFactDesde n = menorFactDesdeDesde n 1

mayorFactHastaHasta :: Int -> Int -> Int
mayorFactHastaHasta n k | (factorial k) >= n = factorial (k-1)
                        | otherwise = mayorFactHastaHasta n (k+1)

mayorFactHasta :: Int -> Int
mayorFactHasta n = mayorFactHastaHasta n 1

esFact :: Int -> Bool
esFact n = menorFactDesdeDesde n 1 == n


esFibonacciAux :: Int -> Int -> Int
esFibonacciAux n k | (fib k) >= n = (fib k)
                   | otherwise = esFibonacciAux n (k+1)
                   
esFibonacci :: Int -> Bool
esFibonacci n = esFibonacciAux n 1 == n
