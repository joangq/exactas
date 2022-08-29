type Polinomio = [Float]
type Monomio  = (Float, Int)

-- (1)
crearPolinomio :: [Float] -> Polinomio
crearPolinomio (x:xs) | x /= 0    = (x:xs)
                      | otherwise = crearPolinomio (xs)


-- (2)
grado :: Polinomio -> Int
grado []     = undefined
grado [a]    = 0
grado (_:xs) = grado(xs) + 1

-- (3)

evaluar :: Polinomio -> Float -> Float
evaluar [a] n    = a
evaluar (x:xs) n = (evaluar' x n g) + (evaluar xs n)
 where
  g = grado p
  evaluar' a x g = a*(x^g)

--
lista0 :: Int -> Polinomio
lista0 n | n == 0 = [ ]
         | otherwise = 0 : lista0 (n - 1)

-- Esta función antes se llamaba 'producto'
-- pero ese es el nombre del punto 5
mult :: Float -> Polinomio -> Polinomio
mult m [a] = [m*a]
mult m (x:xs) = l
 where l = (m * x) : (mult m xs)


{-
polinomiotot :: Float -> Int -> Polinomio -> Polinomio
polinomiotot m l p = (producto m p) ++ (lista0 l)

polinomiotot2 :: (Float,Int) -> Polinomio -> Polinomio
polinomiotot2 (l,m) p = polinomiotot l m p

productoPorMonomio :: Monomio -> Polinomio -> Polinomio
productoPorMonomio (l,m) p = polinomiotot2 (l,m) p
-}

-- Junté todo en una misma funcion porque tenerlo por separado
-- no tenia ningun sentido, lol

-- (4)

productoPorMonomio :: Monomio -> Polinomio -> Polinomio
productoPorMonomio (l,m) p = (mult m p) ++ (lista0 l)


--

suma (x:xs) (y:ys) | lx > ly = suma p (lista0 q d)
                   | ly > lx = suma q (lista0 p d)
suma (x:xs (y:ys) = (x+y):(suma xs ys)
 where
 p = (x:xs)
 q = (y:ys)
 lx = largo p
 ly = largo q
 d = abs (lx-ly)

monomios :: Polinomio -> [Monomio]
monomios [] = []
monomios (x:xs) = (x,g):(monomios xs)
 where
 g = grado (x:xs)

sumaListaPol :: [Polinomio] -> Polinomio
sumaListaPol (p1:p2:pn) = suma (suma p1 p2) (sumaListaPol pn)


distributiva :: [Monomio] -> Polinomio -> [Polinomio]
distributiva (m:ms) (x:xs) = (productoPorMonomio m x):(distributiva ms xs)

-- (5)
producto p q = sumaListaPol (distributiva (monomios p) q)

-- (6)
evaluacionMultiple :: [Float] -> Polinomio -> Polinomio -> [Float]
evaluacionMultiple [] p q = []
evaluacionMultiple (x:xs) p q | esPar i   = evaluarP:(evaluacionMultiple xs p q) 
                              | otherwise = evaluarQ:(evaluacionMultiple xs p q) 
                              where
                                l = (x:xs)
                                i = largo l
                                evaluarP = evaluar P x
                                evaluarQ = evaluar Q x