-- Tarea de la clase 23/03/22

--maximo: recibe dos numeros y devuelve el mayor.
maximo :: Int -> Int -> Int
maximo x y | x >= y = x
           | otherwise = y

--absoluto: calcula el valor absoluto de un numero entero.
absoluto :: Int -> Int
absoluto x | x > 0 = x
           | x == 0 = 0
           | x < 0 = -x

--maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.
maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y | absoluto x > absoluto y = x
                   | otherwise = y

--maximo3: devuelve el maximo entre tres numeros enteros.
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z = maximo (maximo x y) (maximo y z)
            
--algunoEs0: dados dos n´umeros racionales, decide si alguno de los dos es igual a 0 (hacerlo
--dos veces, una sin usar y otra usando pattern matching).
algunoEs0 :: Int -> Int -> Bool
algunoEs0 x y = x * y == 0
     
              
-- Ahora con patter matching:
algunoEs0PM :: Int -> Int -> Bool
algunoEs0PM _ 0 = True
algunoEs0PM 0 _ = True
algunoEs0PM _ _ = False
              
-- ambosSon0: dados dos n´umeros racionales, decide si ambos son iguales a 0 (hacerlo dos
--veces, una sin usar y otra usando pattern matching).
ambosSon0 :: Int -> Int -> Bool
ambosSon0 x y = (x == 0) && (y == 0)
       

-- Ahora con patter matching:
ambosSon0PM :: Int -> Int -> Bool
ambosSon0PM 0 0 = True
ambosSon0PM _ _ = False


--esMultiploDe: dados dos numeros naturales, decidir si el primero es multiplo del segundo.
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod x y == 0

--digitoUnidades: dado un numero natural, extrae su digito de las unidades.
digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

--digitoDecenas: dado un numero natural, extrae su digito de las decenas.
digitoDecenas :: Int -> Int
digitoDecenas x = mod x 100
