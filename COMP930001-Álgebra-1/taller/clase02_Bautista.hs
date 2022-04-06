
--Ejercicio 1:
estanRelacionados :: Float -> Float -> Bool
estanRelacionados x y | (x <= 3 && y <= 3) = True
                      | (x > 3 && y > 3) && (x <= 7 && y <= 7) = True
                      | (x > 7 && y >7) = True
                      | otherwise = False
                      
--Ejercicio 2:
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a,b) (c,d) = (fst (a,b)) * (fst(c,d)) + (snd (a,b)) * (snd(c,d))

--Ejercicio 3:
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a,b) (c,d) = (fst (a,b) < (snd(c,d)))

--Ejercicio 4:
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt((fst(a, b) - fst(c, d))**2 + (snd(a, b) - snd(c, d))**2)

--Ejercicio 5:
sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a, b, c) = a + b + c

--Ejercicio 6:
posicPrimerPar :: (Int, Int, Int) -> Int
posicPrimerPar (a, b, c) | mod a 2 == 0 = 1
                         | mod b 2 == 0 = 2
                         | mod c 2 == 0 = 3
                         | otherwise = 4
                         
--Ejercicio 7:
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

--Ejercicio 8: 
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)
