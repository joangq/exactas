type Ecuacion = (Int, Int, Int)
type Solucion = (Int, Int)

-- 1 ---------------------          

coprimizar :: Ecuacion -> Ecuacion
coprimizar (a, b, m) | mod b d /= 0  = undefined
                     | otherwise = (a `div` d, b `div` d, m `div` d)
                     where d = mcd a m 

claseCongruencia :: Ecuacion -> Solucion
claseCongruencia (a, b, m) = (c, m)
                           where
                           (_,s,_) = emcd a m
                           c = (s*b) `mod` m 

solucion :: Ecuacion -> Solucion
solucion e = claseCongruencia (coprimizar e)


-- 2 --------------------

soluciones :: [Ecuacion] -> [Solucion]
soluciones [] = []
soluciones (e:es) = (solucion e):(soluciones es)


-- 3 --------------------

modulos :: [Solucion] -> [Int]
modulos [] = []
modulos ((_,m):es) = m:(modulos es)

cantidadMultiplos :: [Int] -> Int -> Int
cantidadMultiplos [] _ = 0
cantidadMultiplos (m:ms) n | mod m n == 0 = multiplos + 1
                           | otherwise    = multiplos
                           where
                           multiplos = cantidadMultiplos ms n

esPrimoMalo :: [Solucion] -> Int -> Bool
esPrimoMalo sist n = (esPrimo n) && (cantidadMultiplos (modulos sist) n >= 2)

todosLosPrimosMalosHasta :: [Solucion] -> Int -> [Int]
todosLosPrimosMalosHasta _ 0 = []
todosLosPrimosMalosHasta sist n | esPrimoMalo sist n = n:anteriores
                                | otherwise          =   anteriores
                                where
                                anteriores = todosLosPrimosMalosHasta sist (n-1)

todosLosPrimosMalos :: [Solucion] -> [Int]
todosLosPrimosMalos [] = []
todosLosPrimosMalos sist = todosLosPrimosMalosHasta sist (maximum (modulos sist))

-- 4 --------------------

resumirPk :: Solucion -> Solucion -> Solucion
resumirPk (r1, m1) (r2, m2) | (r2-r1) `mod` m1 == 0 = (r2, m2)
                                       | otherwise = undefined

solucionesParPk :: Solucion -> Solucion -> Solucion
solucionesParPk e1 e2 | m1 <= m2  = resumirPk e1 e2
                      | otherwise = resumirPk e2 e1
                      where
                      (_, m1) = e1
                      (_, m2) = e2

solucionesPk :: [Solucion] -> Solucion
solucionesPk [e] = e
solucionesPk (e1:e2:es) = solucionesPk ((solucionesParPk e1 e2):es)


-- 5 --------------------

desdoblar :: [Solucion] -> Int -> ([Solucion], [Solucion])
desdoblar [] _ = ([], [])
desdoblar ((r, m):es) p | k == 0 = (pri, (r, m):seg)
                        | m == pk = ((r, m):pri, seg)
                        | otherwise = ( (mod r pk, pk):pri, (mod r (div m pk), div m pk):seg )
                        where
                        (pri, seg) = desdoblar es p 
                        k = quePotenciaLoDivide m p
                        pk = p^k

quitarPrimosMalos' :: [Solucion] -> [Int] -> [Solucion]
quitarPrimosMalos' sist [] = sist
quitarPrimosMalos' sist (p:ps) = (solucionesPk pri):(quitarPrimosMalos' seg ps)  
                               where (pri, seg) = desdoblar sist p

quitarPrimosMalos :: [Solucion] -> [Solucion]
quitarPrimosMalos sist = quitarPrimosMalos' sist (todosLosPrimosMalos sist)


-- 6 -------------------

solucSistemaModCoprimos :: [Solucion] -> Solucion
solucSistemaModCoprimos [e] = e
solucSistemaModCoprimos ((r1, m1):(r2, m2):es) = solucSistemaModCoprimos ((r, m1*m2):es)
 where (d, s, t) = emcd m1 m2
       r = mod (r1*t*m2 + r2*s*m1) (m1*m2)

solucSistema :: [Ecuacion] -> Solucion
solucSistema sist = solucSistemaModCoprimos ( sistemaEquivSinPrimosMalos ( soluciones sist) )


-- Ejercicios ----------

cadaEcTieneSoluc :: [Ecuacion] -> Bool
cadaEcTieneSoluc [] = True
cadaEcTieneSoluc ((a, b, m):es) = (mod b d == 0) && cadaEcTieneSoluc es
 where d = mcd a m

tieneSolucDosEcPotenciasPrimoOrd :: Solucion -> Solucion -> Bool
tieneSolucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2) = mod (r2-r1) m1 == 0 

tieneSolucDosEcPotenciasPrimo :: Solucion -> Solucion -> Bool
tieneSolucDosEcPotenciasPrimo (r1, m1) (r2, m2) | m1 <= m2 = tieneSolucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2)
                                                | otherwise = tieneSolucDosEcPotenciasPrimoOrd (r2, m2) (r1, m1)

tieneSolucSistemaPotenciasPrimo :: [Solucion] -> Bool
tieneSolucSistemaPotenciasPrimo [e] = True
tieneSolucSistemaPotenciasPrimo (e1:e2:es) = tieneSolucDosEcPotenciasPrimo e1 e2 && tieneSolucSistemaPotenciasPrimo ((solucDosEcPotenciasPrimo e1 e2):es)


tieneSolucionSimplifUnPrimo :: [Solucion] -> Int -> Bool
tieneSolucionSimplifUnPrimo sist p = tieneSolucSistemaPotenciasPrimo pri
 where (pri, seg) = desdoblar sist p

tieneSolucionSimplifMuchosPrimos :: [Solucion] -> [Int] -> Bool
tieneSolucionSimplifMuchosPrimos _ [] = True
tieneSolucionSimplifMuchosPrimos sist (p:ps) = tieneSolucionSimplifUnPrimo sist p && tieneSolucionSimplifMuchosPrimos sist ps 

tieneSolucionSimplif :: [Solucion] -> Bool
tieneSolucionSimplif sist = tieneSolucionSimplifMuchosPrimos sist (todosLosPrimosMalos sist)

tieneSolucion :: [Ecuacion] -> Bool
tieneSolucion sist = cadaEcTieneSoluc sist && tieneSolucionSimplif (soluciones sist)

dirichletDesde :: Int -> Int -> Int -> Int
dirichletDesde r m k | esPrimo (r + k*m) = r + k*m
                     | otherwise = dirichletDesde r m (k+1)

dirichlet :: Int -> Int -> Int
dirichlet r m = dirichletDesde r m 0



menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = (menorDivisor n) == n

emcd :: Int -> Int -> Ecuacion
emcd a 0 = (a, 1, 0)
emcd a b = (g, s, t)
           where (g, s', t') = emcd b (mod a b)
                 s = t'
                 t = s' - t' * q
                 q = div a b

mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b (mod a b)

nEsimoPrimo :: Int -> Int
nEsimoPrimo 1 = 2
nEsimoPrimo n = minimoPrimoDesde (1 + nEsimoPrimo (n - 1))

minimoPrimoDesde :: Int -> Int
minimoPrimoDesde n | esPrimo n = n
                   | otherwise = minimoPrimoDesde (n + 1)

quePotenciaLoDivide :: Int -> Int -> Int
quePotenciaLoDivide n p
  | n `mod` p == 0 = 1 + (quePotenciaLoDivide (n `div` p) p)
  | otherwise = 0
