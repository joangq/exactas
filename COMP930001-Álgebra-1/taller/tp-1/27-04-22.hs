maximo :: Integer -> Integer -> Integer
maximo a b | a >= b = a
           | otherwise = b

esPar :: Integer -> Bool
esPar n = mod n 2 == 0
     
proximoCollatz :: Integer -> Integer
proximoCollatz n | n <= 0 = undefined
                 | esPar n   = div n 2
                 | otherwise = (3 * n) + 1

nEsimoCollatz :: Integer -> Integer -> Integer
nEsimoCollatz n i | i == 0 = proximoCollatz n
                  | otherwise = nEsimoCollatz (proximoCollatz n) (i-1)

collatz :: Integer -> Integer
collatz n | n == 1 = 1
          | otherwise = collatz(proximoCollatz n)
          
largoSecuencia :: Integer -> Integer
largoSecuencia n | n == 1 = 0
                 | otherwise = (largoSecuencia c) + 1
                 where c = proximoCollatz n

cantidadTerminosPares :: Integer -> Integer
cantidadTerminosPares n | n == 1 = 0
                        | esPar n = (cantidadTerminosPares c) + 1
                        | otherwise = (cantidadTerminosPares c)
                        where c = proximoCollatz n

satisfaceCollatz :: Integer -> Integer -> Bool
satisfaceCollatz 1 _ = True
satisfaceCollatz n 0 = n == 1     

satisfaceCollatz n p = satisfaceCollatz (proximoCollatz n) (p-1)

intervaloSatisfaceCollatz :: Integer -> Integer -> Integer -> Bool
intervaloSatisfaceCollatz n m k | (n > m) = undefined
                                | n == m = c
                                | otherwise = (intervaloSatisfaceCollatz (n+1) m k) &&  c
                                where c = satisfaceCollatz n k

satisfaceCollatzHasta :: Integer -> Integer -> Bool
satisfaceCollatzHasta n k = intervaloSatisfaceCollatz 1 n k

intervaloLargoSecuencias :: Integer -> Integer -> Integer
intervaloLargoSecuencias n m | (n > m) = undefined
                             | n == m = l
                             | otherwise = maximo (intervaloLargoSecuencias (n+1) m) (l)
                             where l = largoSecuencia n
longitudMasLargaHasta :: Integer -> Integer
longitudMasLargaHasta n = intervaloLargoSecuencias 1 n

minimoNumeroConSecuenciaDesde :: Integer -> Integer -> Integer
minimoNumeroConSecuenciaDesde n m | l == m = n
                                  | otherwise = minimoNumeroConSecuenciaDesde (n+1) m
                                  where
                                    l = largoSecuencia n


secuenciaMasLargaHasta :: Integer -> Integer
secuenciaMasLargaHasta m = minimoNumeroConSecuenciaDesde 1 (longitudMasLargaHasta m)     

     

