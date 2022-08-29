maximo :: Integer -> Integer -> Integer
maximo a b | a >= b = a
           | otherwise = b

esPar :: Integer -> Bool
esPar n = mod n 2 == 0

-- Dado un n natural, genera el próximo número en la secuencia
proximoCollatz :: Integer -> Integer
proximoCollatz n | n <= 0 = undefined
                 | esPar n   = div n 2
                 | otherwise = (3 * n) + 1

-- Dados n, i enteros, aplica proximoCollatz n, hasta el i-ésimo número de la secuencia.
nEsimoCollatz :: Integer -> Integer -> Integer
nEsimoCollatz n i | i == 0 = proximoCollatz n
                  | otherwise = nEsimoCollatz (proximoCollatz n) (i-1)

-- Dado un entero n, aplica proximoCollatz exhaustivamente, hasta llegar a 1.
collatz :: Integer -> Integer
collatz n | n == 1 = 1
          | otherwise = collatz(proximoCollatz n)
          
{-
-- Dado n entero, decide si su secuencia de Collatz converge a 1.
satisfaceCollatzInf :: Integer -> Bool
satisfaceCollatzInf n = collatz n == 1

satisfaceCollatz :: Integer -> Integer -> Bool
satisfaceCollatz n m = nEsimoCollatz n m == 1 
-}

{- Dado n entero, calcula la cantidad de pasos hasta llegar a 1.
 - Caso base, si n = 1, entonces necesita 0 pasos para llegar a 1.
 - Ejemplo con n = 4:
 - n != 1 -> (largoSecuencia 2) + 1
 - n != 1 -> (largoSecuencia 1) + 1
 - n == 1 -> 0

 - Como (largoSecuencia 1) = 0
 - Entonces (largoSecuencia 2) = 1 + 1 = 2
 - Y por ende, (largoSecuencia 4) = 2 + 1 = 3 
 -}
largoSecuencia :: Integer -> Integer
largoSecuencia n | n == 1 = 0
                 | otherwise = (largoSecuencia c) + 1
                 where c = proximoCollatz n

cantidadTerminosPares :: Integer -> Integer
cantidadTerminosPares n | n == 1 = 0
                        | esPar n = (cantidadTerminosPares c) + 1
                        | otherwise = (cantidadTerminosPares c)
                        where c = proximoCollatz n

{- Dados n, p naturales determina si n satisface la conjetura de Collatz en menos de p pasos
 - Casos base: 
 -- n = 1 -> 1 seguro satisface Collatz en al menos 0 pasos. Como pedimos p > 0, siempre es verdadero.
 -- p = 0 -> Preguntar que n satisfaga Collatz en 0 pasos es lo mismo que preguntar si es 1. 
 
 - Ejemplo con n = 13, p = 10
 - Como n != 1 y p != 0, y sabiendo que (proximoCollatz 13) = 40
 -> satisfaceCollatz 40 9 
 -> satisfaceCollatz 20 8 
 -> satisfaceCollatz 10 7 
 -> satisfaceCollatz 5 6
 -> satisfaceCollatz 16 4
 -> satisfaceCollatz 8 3
 -> satisfaceCollatz 4 2
 -> satisfaceCollatz 2 1
 -> satisfaceCollatz 1 0 -> True

 - Ejemplo con n = 12, p = 5
 -> satisfaceCollatz 6 4 
 -> satisfaceCollatz 3 3 
 -> satisfaceCollatz 10 2 
 -> satisfaceCollatz 5 1 
 -> satisfaceCollatz 4 0 -> 4 != 1 -> False 
 -}
satisfaceCollatz :: Integer -> Integer -> Bool
satisfaceCollatz 1 _ = True
satisfaceCollatz n 0 = n == 1
satisfaceCollatz n p = satisfaceCollatz (proximoCollatz n) (p-1)

{- Dados n,m,k naturales donde m > n, determina si todos los i (n <= i <= m) satisfacen Collatz en menos de k pasos.
 - Caso base: n = m. Si el n-ésimo i es m, significa que llegó al final del intervalo. Por ende sólo es necesario chequear que satisface Collatz en k pasos.
 - Si n != m, entonces "añade" los valores de verdad del i-ésimo natural y el próximo, hasta que n == m.

 - Ejemplo con n = 5, m = 7, k = 15
 - Como n < m y n != m, entonces:
 - (intervaloSatisfaceCollatz 6 7 15) && (satisfaceCollatz 5 15)
 - Por un lado, satisfaceCollatz 5 15 -> True
 - Luego, intervaloSatisfaceCollatz 6 7 15 
 -> intervaloSatisfaceCollatz 7 7 15 && satisfaceCollatz 6 15
    -> Por un lado, satisfaceCollatz 6 15 -> True
    -> Luego, intervaloSatisfaceCollatz 7 7 15 -> satisfaceCollatz 7 15 -> False
    -> Entonces, True && False -> False
 -> Por ende, intervaloSatisfaceCollatz 5 7 15 -> False

 - Ahora bien, probemos con n = 5, m = 7, k = 16.
 - Luego, basta con ver que satisfaceCollatz 7 16 es verdadero.
 -> satisfaceCollatz 7 16 -> True
 -> Luego, True && True -> True
 - Por ende intervaloSatisfaceCollatz 5 7 16 -> True -}
intervaloSatisfaceCollatz :: Integer -> Integer -> Integer -> Bool
intervaloSatisfaceCollatz n m k | (n > m) = undefined
                                | n == m = c
                                | otherwise = (intervaloSatisfaceCollatz (n+1) m k) &&  c
                                where c = satisfaceCollatz n k

{- Dados n,k naturales, determina si todos los i (1 <= i <= n) satisfacen Collatz en menos de k pasos -}
satisfaceCollatzHasta :: Integer -> Integer -> Bool
satisfaceCollatzHasta n k = intervaloSatisfaceCollatz 1 n k

{- Dados n,m naturales, donde m > n, da la secuencia mas larga de entre todos los i (n <= i <= m).
 - Caso base: n = m. Si el n-ésimo i es m, significa que llegó al final del intervalo. Por ende sólo es necesario devolver el largo de la secuencia de n.
 - Si n != m, entonces toma el máximo entre las secuencias del i-ésimo natural y el próximo, hasta que n == m.

 - Ejemplo con n = 2, m = 4.
 - n != m -> maximo (intervaloLargoSecuencias 3 4) 1
 - Luego, intervaloLargoSecuencias 3 4 -> maximo (intervaloLargoSecuencias 4 4) 7
 - Luego, como en intervaloLargoSecuencias 4 4, n = m -> 2
 - Luego, intervaloLargoSecuencias 3 4 -> maximo 2 7 -> 7
 -}
intervaloLargoSecuencias :: Integer -> Integer -> Integer
intervaloLargoSecuencias n m | (n > m) = undefined
                             | n == m = l
                             | otherwise = maximo (intervaloLargoSecuencias (n+1) m) (l)
                             where l = largoSecuencia n

-- Dado n natural, devuelve la secuencia más larga de entre todos los i (1 <= i <= m).
longitudMasLargaHasta :: Integer -> Integer
longitudMasLargaHasta n = intervaloLargoSecuencias 1 n

{- 
secuenciaMasLargaEntre :: Integer -> Integer -> Integer
secuenciaMasLargaEntre a b |   i > j   = a 
                           | otherwise = b
                           where
                            i = largoSecuencia a
                            j = largoSecuencia b
                            -- Dados dos numeros, devuelve el que tenga la secuencia de Collatz con mayor longitud.

numeroCollatz :: Integer -> (Integer, Integer)
numeroCollatz n = (n, largoSecuencia n)

secuenciaMasLarga n m | n > m = undefined
                      | n == m = secuenciaMasLargaEntre n m
                      | otherwise = minimo (secuenciaMasLargaEntre n m) (secuenciaMasLarga (n+1) m)
                      -- Esta función agarra el mínimo i entre n y m que cumple largoSecuencia i > largoSecuencia m
-}

{- Dados n,m naturales, devuelve el i más chico tal que largoSecuencia i = m
 - Recorre todos los i desde n, hasta que el largo de la secuencia de i sea igual a m,
 - Por ende, devuelve el menor (o el primer) i que tenga dicho largo de secuencia.
 -}
minimoNumeroConSecuenciaDesde :: Integer -> Integer -> Integer
minimoNumeroConSecuenciaDesde n m | l == m = n
                                  | otherwise = minimoNumeroConSecuenciaDesde (n+1) m
                                  where
                                    l = largoSecuencia n

-- Dado m natural, devuelve un n natural, tal que el largo de n sea menor al máximo largo de todos los i (1 <= i <= m).
{- Básicamente, primero recorre todos los i (1 <= i <= m) y busca la longitud más larga de ese intervalo. 
 - Luego, recorre todos los i y devuelve el i más chico tal que largoSecuencia i = longitudMasLargaHasta m
 - Por ende, devuelve el i más chico que alcance el largo más alto de todos los numeros entre 1 y m.
 -}
secuenciaMasLargaHasta :: Integer -> Integer
secuenciaMasLargaHasta m = minimoNumeroConSecuenciaDesde 1 (longitudMasLargaHasta m)

