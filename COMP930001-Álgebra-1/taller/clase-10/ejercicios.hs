

-- 1 ---------------------          

ecEquivalente :: (Int, Int, Int) -> (Int, Int, Int)
ecEquivalente (a, b, m) | mod b d /= 0  = undefined
                        | otherwise = (div a d, div b d, div m d)
 where d = mcd a m 

solucionEcConPropAdic :: (Int, Int, Int) -> (Int, Int)
solucionEcConPropAdic (a, b, m) = (mod (s*b) m, m)
 where (d, s, t) = emcd a m 

solucionEc :: (Int, Int, Int) -> (Int, Int)
solucionEc e = solucionEcConPropAdic (ecEquivalente e)


-- 2 --------------------

sistemaSimplifEquiv :: [(Int, Int, Int)] -> [(Int, Int)]
sistemaSimplifEquiv [] = []
sistemaSimplifEquiv (e:es) = (solucionEc e):(sistemaSimplifEquiv es)


-- 3 --------------------

modulos :: [(Int, Int)] -> [Int]
modulos [] = []
modulos ((r, m):es) = m:(modulos es)

cantidadMultiplos :: [Int] -> Int -> Int
cantidadMultiplos [] _ = 0
cantidadMultiplos (m:ms) n | mod m n == 0 = 1 + cantidadMultiplos ms n
                           | otherwise = cantidadMultiplos ms n 

esPrimoMalo :: [(Int, Int)] -> Int -> Bool
esPrimoMalo sist n = (esPrimo n) && cantidadMultiplos (modulos sist) n >= 2

todosLosPrimosMalosHasta :: [(Int, Int)] -> Int -> [Int]
todosLosPrimosMalosHasta _ 0 = []
todosLosPrimosMalosHasta sist n | esPrimoMalo sist n = n:(todosLosPrimosMalosHasta sist (n-1))
                                | otherwise = todosLosPrimosMalosHasta sist (n-1)

todosLosPrimosMalos :: [(Int, Int)] -> [Int]
todosLosPrimosMalos [] = []
todosLosPrimosMalos sist = todosLosPrimosMalosHasta sist (maximum (modulos sist))

-- 4 --------------------

solucDosEcPotenciasPrimoOrd :: (Int, Int) -> (Int, Int) -> (Int, Int)
solucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2) | mod (r2-r1) m1 == 0 = (r2, m2)
                                              | otherwise = undefined

solucDosEcPotenciasPrimo :: (Int, Int) -> (Int, Int) -> (Int, Int)
solucDosEcPotenciasPrimo (r1, m1) (r2, m2) | m1 <= m2 = solucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2)
                                           | otherwise = solucDosEcPotenciasPrimoOrd (r2, m2) (r1, m1)

solucSistemaPotenciasPrimo :: [(Int, Int)] -> (Int, Int)
solucSistemaPotenciasPrimo [e] = e
solucSistemaPotenciasPrimo (e1:e2:es) = solucSistemaPotenciasPrimo ((solucDosEcPotenciasPrimo e1 e2):es)


-- 5 --------------------

desdoblarSistemaEnFcionPrimo :: [(Int, Int)] -> Int -> ([(Int, Int)], [(Int, Int)])
desdoblarSistemaEnFcionPrimo [] _ = ([], [])
desdoblarSistemaEnFcionPrimo ((r, m):es) p | k == 0 = (pri, (r, m):seg)
                                           | m == p^k = ((r, m):pri, seg)
                                           | otherwise = ((mod r (p^k), p^k):pri, (mod r (div m (p^k)), div m (p^k)):seg)
 where (pri, seg) = desdoblarSistemaEnFcionPrimo es p 
       k = quePotenciaLoDivide m p

sistemaEquivSinPrimosMalosAux :: [(Int, Int)] -> [Int] -> [(Int, Int)]
sistemaEquivSinPrimosMalosAux sist [] = sist
sistemaEquivSinPrimosMalosAux sist (p:ps) = (solucSistemaPotenciasPrimo pri):(sistemaEquivSinPrimosMalosAux seg ps)  
 where (pri, seg) = desdoblarSistemaEnFcionPrimo sist p

sistemaEquivSinPrimosMalos :: [(Int, Int)] -> [(Int, Int)]
sistemaEquivSinPrimosMalos sist = sistemaEquivSinPrimosMalosAux sist (todosLosPrimosMalos sist)


-- 6 -------------------

solucSistemaModCoprimos :: [(Int, Int)] -> (Int, Int)
solucSistemaModCoprimos [e] = e
solucSistemaModCoprimos ((r1, m1):(r2, m2):es) = solucSistemaModCoprimos ((r, m1*m2):es)
 where (d, s, t) = emcd m1 m2
       r = mod (r1*t*m2 + r2*s*m1) (m1*m2)

solucSistema :: [(Int, Int, Int)] -> (Int, Int)
solucSistema sist = solucSistemaModCoprimos ( sistemaEquivSinPrimosMalos ( sistemaSimplifEquiv sist) )


-- Ejercicios ----------

cadaEcTieneSoluc :: [(Int, Int, Int)] -> Bool
cadaEcTieneSoluc [] = True
cadaEcTieneSoluc ((a, b, m):es) = (mod b d == 0) && cadaEcTieneSoluc es
 where d = mcd a m

tieneSolucDosEcPotenciasPrimoOrd :: (Int, Int) -> (Int, Int) -> Bool
tieneSolucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2) = mod (r2-r1) m1 == 0 

tieneSolucDosEcPotenciasPrimo :: (Int, Int) -> (Int, Int) -> Bool
tieneSolucDosEcPotenciasPrimo (r1, m1) (r2, m2) | m1 <= m2 = tieneSolucDosEcPotenciasPrimoOrd (r1, m1) (r2, m2)
                                                | otherwise = tieneSolucDosEcPotenciasPrimoOrd (r2, m2) (r1, m1)

tieneSolucSistemaPotenciasPrimo :: [(Int, Int)] -> Bool
tieneSolucSistemaPotenciasPrimo [e] = True
tieneSolucSistemaPotenciasPrimo (e1:e2:es) = tieneSolucDosEcPotenciasPrimo e1 e2 && tieneSolucSistemaPotenciasPrimo ((solucDosEcPotenciasPrimo e1 e2):es)


tieneSolucionSimplifUnPrimo :: [(Int, Int)] -> Int -> Bool
tieneSolucionSimplifUnPrimo sist p = tieneSolucSistemaPotenciasPrimo pri
 where (pri, seg) = desdoblarSistemaEnFcionPrimo sist p

tieneSolucionSimplifMuchosPrimos :: [(Int, Int)] -> [Int] -> Bool
tieneSolucionSimplifMuchosPrimos _ [] = True
tieneSolucionSimplifMuchosPrimos sist (p:ps) = tieneSolucionSimplifUnPrimo sist p && tieneSolucionSimplifMuchosPrimos sist ps 

tieneSolucionSimplif :: [(Int, Int)] -> Bool
tieneSolucionSimplif sist = tieneSolucionSimplifMuchosPrimos sist (todosLosPrimosMalos sist)

tieneSolucion :: [(Int, Int, Int)] -> Bool
tieneSolucion sist = cadaEcTieneSoluc sist && tieneSolucionSimplif (sistemaSimplifEquiv sist)

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

emcd :: Int -> Int -> (Int, Int, Int)
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
