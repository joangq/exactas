type Polinomio = [Float]
type Monomio  = (Float, Int)

largo :: [a] -> Int
largo [] = 0
largo (_:xs) = 1 + (largo xs)

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
  g = grado (x:xs)
  evaluar' a x g = a*(x^g)

--
lista0 :: Int -> Polinomio
lista0 n | n == 0 = [ ]
         | otherwise = 0 : lista0 (n - 1)

mult :: Float -> Polinomio -> Polinomio
mult m [a] = [m*a]
mult m (x:xs) = l
 where l = (m * x) : (mult m xs)

--

productoPorMonomio :: Monomio -> Polinomio -> Polinomio
productoPorMonomio (a,0) xs = mult a xs
productoPorMonomio (a,n) xs = crearPolinomio (axs ++ offset)
    where
        axs = productoPorMonomio (a,0) xs
        offset = lista0 (n)

-- (4)

--
suma :: Polinomio -> Polinomio -> Polinomio
suma [] ys = ys
suma xs [] = xs
suma (x:xs) (y:ys) | lx > ly = suma p ((lista0 d)++q)
                   | ly > lx = suma q ((lista0 d)++p)
  where
  p = (x:xs)
  q = (y:ys)
  lx = largo p
  ly = largo q
  d = abs (lx-ly)
suma (x:xs) (y:ys) = (x+y):(suma xs ys)

monomios :: Polinomio -> [Monomio]
monomios [] = []
monomios (x:xs) = (x,g):(monomios xs)
 where
 g = grado (x:xs)

sumaListaPol :: [Polinomio] -> Polinomio
sumaListaPol [] = undefined
sumaListaPol [p1] = p1
sumaListaPol [p1,p2] = suma p1 p2
sumaListaPol (p1:p2:pn) = suma (suma p1 p2) (sumaListaPol pn)

distributiva :: [Monomio] -> Polinomio -> [Polinomio]
distributiva [] _ = undefined
distributiva [m] q = [productoPorMonomio m q]
distributiva (m:ms) q = (productoPorMonomio m q):(distributiva ms q)

-- (5)
producto :: Polinomio -> Polinomio -> Polinomio
producto [] _ = []
producto _ [] = []
producto p q = sumaListaPol (distributiva (monomios p) q)

-- (6)
esPar :: Int -> Bool
esPar n = n `mod` 2 == 0

evaluacionMultiple :: [Float] -> Polinomio -> Polinomio -> [Float]
evaluacionMultiple [] p q = []
evaluacionMultiple (x:xs) p q | esPar i   = (evaluar q x):(evaluacionMultiple xs p q) 
                              | otherwise = (evaluar p x):(evaluacionMultiple xs p q) 
                              where
                                l = (x:xs)
                                i = largo l
