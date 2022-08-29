{- 20/04/2022
 - Trabajo práctico I - Taller de Álgebra
 - Grupo: Daugero, D'Ingiannia, Gonzalez
 -}

-- Dados dos enteros, devuelve el máximo entre ambos.
maximo :: Integer -> Integer -> Integer
maximo a b | a >= b = a
           | otherwise = b

-- Dado un entero, determina si es par.
esPar :: Integer -> Bool
esPar n = mod n 2 == 0
     
-- Dado un entero, computa el próximo número en la secuencia de Collatz.
proximoCollatz :: Integer -> Integer
proximoCollatz n | n <= 0 = undefined
                 | esPar n   = div n 2
                 | otherwise = (3 * n) + 1

-- Dados n,i enteros, calcula el i-ésimo término de la secuencia de Collatz de n.
nEsimoCollatz :: Integer -> Integer -> Integer
nEsimoCollatz n i | i == 0 = proximoCollatz n
                  | otherwise = nEsimoCollatz (proximoCollatz n) (i-1)

-- Dado un entero, calcula su secuencia de Collatz hasta que llegue a 1.
collatz :: Integer -> Integer
collatz n | n == 1 = 1
          | otherwise = collatz(proximoCollatz n)

-- Dado un entero, determina el largo de la secuencia de Collatz. (4)
largoSecuencia :: Integer -> Integer
largoSecuencia n | n == 1 = 0
                 | otherwise = (largoSecuencia c) + 1
                 where c = proximoCollatz n

-- Dado un entero, determina la cantidad de términos pares en la secuencia de Collatz. (3)
cantidadTerminosPares :: Integer -> Integer
cantidadTerminosPares n | n == 1 = 0
                        | esPar n = (cantidadTerminosPares c) + 1
                        | otherwise = (cantidadTerminosPares c)
                        where c = proximoCollatz n

-- Dado un entero, determina si satisface la conjetura en p pasos o menos. (1)
satisfaceCollatz :: Integer -> Integer -> Bool
satisfaceCollatz 1 _ = True
satisfaceCollatz n 0 = n == 1     
satisfaceCollatz n p = satisfaceCollatz (proximoCollatz n) (p-1)

-- Dados n,m,k enteros, determina si los números entre n y m satisfacen la conjetura en k pasos o menos.
intervaloSatisfaceCollatz :: Integer -> Integer -> Integer -> Bool
intervaloSatisfaceCollatz n m k | (n > m) = undefined
                                | n == m = c
                                | otherwise = (intervaloSatisfaceCollatz (n+1) m k) &&  c
                                where c = satisfaceCollatz n k

-- Dados n,k enteros, determina si los números entre 1 y n satisfacen la conjetura en k pasos o menos. (2)
satisfaceCollatzHasta :: Integer -> Integer -> Bool
satisfaceCollatzHasta n k = intervaloSatisfaceCollatz 1 n k

-- Dados n,m enteros determina la secuencia más larga comprendida entre n y m.
intervaloLargoSecuencias :: Integer -> Integer -> Integer
intervaloLargoSecuencias n m | (n > m) = undefined
                             | n == m = l
                             | otherwise = maximo (intervaloLargoSecuencias (n+1) m) (l)
                             where l = largoSecuencia n
                             
-- Dado un entero, determina la secuencia más larga comprendida entre 1 y n.
longitudMasLargaHasta :: Integer -> Integer
longitudMasLargaHasta n = intervaloLargoSecuencias 1 n

-- Dados n,m enteros determina el número más pequeño que generó la secuencia de largo m.
minimoNumeroConSecuenciaDesde :: Integer -> Integer -> Integer
minimoNumeroConSecuenciaDesde n m | l == m = n
                                  | otherwise = minimoNumeroConSecuenciaDesde (n+1) m
                                  where
                                    l = largoSecuencia n

-- Dado un entero, determina el número más pequeño que generó la secuencia más larga. (5)
secuenciaMasLargaHasta :: Integer -> Integer
secuenciaMasLargaHasta m = minimoNumeroConSecuenciaDesde 1 (longitudMasLargaHasta m)     

     

