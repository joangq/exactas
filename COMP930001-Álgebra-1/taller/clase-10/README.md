<div align='center'>
  <h1>Clase 10</h1>
  <h5>08/06/22</h5>
  <h2>Sistemas lineales de Congruencia</h2>
</div>

```haskell
mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b r
 where
    (_,r) = division a b

dv :: Int -> Int -> (Int, Int)
dv a d = (q',r')
 where
  q' = q a d 0
  r' = r a d q'

-- Cociente
q :: Int -> Int -> Int -> Int
q a d n | a < d = n
        | otherwise = q (a-d) d (n+1)
        
qn :: Int -> Int -> Int -> Int
qn a d n | a > 0 = n
         | otherwise = qn (a+d) d (n-1)

rn :: Int -> Int -> Int -> Int
rn a d q = r a d q

dn :: Int -> Int -> (Int,Int)
dn a d = (qn', rn')
 where
   qn' = qn a d 0
   rn' = rn a d qn'
   
-- Resto
r :: Int -> Int -> Int -> Int
r a d q = a - (q*d)

division :: Int -> Int -> (Int, Int)
division a d    | (a > 0) && (d > 0) = dv a d
                | (a < 0) && (d > 0) = dn a d
                | otherwise = undefined

emcd :: Int -> Int -> (Int, Int, Int)
emcd a 0 = (a,1,0)
emcd a b = (g,s,t)
 where
   g = mcd a b
   (g',s',t') = emcd b r
   (q,r) = division a b
   s = t'
   t = (s' - t' * q)
   
-- aX === b (mod m) -> (a,b,m)
--  X === r (mod m) -> (r,m) con 0 <= r < m   

coprimos :: Int -> Int -> Bool
coprimos a b = (mcd a b) == 1

coprimizar :: (Int, Int, Int) -> (Int, Int, Int)
coprimizar (a,b,m) | mod b d /= 0 = undefined  -- d no divide a b
                   | otherwise = (div a d, div b d, div m d)
                   where
                   d = mcd a m
                                      
solucionConPropAdic :: (Int, Int, Int) -> (Int, Int)
solucionConPropAdic (a,b,m) = (mod (s*b) m, m)
 where
  (d,s,t) = (emcd a m)

-- aX === b (m) -> X === r (m)
solucionEc :: (Int, Int, Int) -> (Int, Int)
solucionEc (a,b,m) = solucionConPropAdic (coprimizar (a,b,m))

sistemaSimplifEquiv :: [(Int, Int, Int)] -> [(Int, Int)]
sistemaSimplifEquiv [] = []
sistemaSimplifEquiv (e:es) = (solucionEc e) : (sistemaSimplifEquiv es)

menorDivisor :: Int -> Int
menorDivisor n = menorDivisorDesde n 2

menorDivisorDesde :: Int -> Int -> Int
menorDivisorDesde n k | mod n k == 0 = k
                      | otherwise = menorDivisorDesde n (k+1)

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = (menorDivisor n) == n

modulos [] = []
modulos ((r,m):es) = m:(modulos es)

cantidadMultiplos :: [Int] -> Int -> Int
cantidadMultiplos [] _ = 0
cantidadMultiplos (m:ms) n | mod m n == 0 = 1 + cantidadMultiplos ms n
                           | otherwise = cantidadMultiplos ms n

esPrimoMalo sist n = (esPrimo n) && cantidadMultiplos (modulos sist) n >= 2

todosLosPrimosMalosHasta _ 0 = []
todosLosPrimosMalosHasta sist n | esPrimoMalo sist n = n:(todosLosPrimosMalosHasta sist (n-1))
                                | otherwise = todosLosPrimosMalosHasta sist (n-1)

todosLosPrimosMalos [] = []
todosLosPrimosMalos sist = todosLosPrimosMalosHasta sist (maximum (modulos sist))

solucDosEcPotenciasPrimoOrd (r1,m1) (r2,m2) | mod (r2-r1) m1 == 0 = (r2, m2)
                                            | otherwise = undefined
                                          
solucDosEcPotenciasPrimo (r1,m1) (r2,m2) | m1 <= m2 = solucDosEcPotenciasPrimoOrd (r1,m1) (r2,m2)
                                         | otherwise = solucDosEcPotenciasPrimoOrd (r2,m2) (r1,m1)

solucSistemaPotenciasPrimo :: [(Int, Int)] -> (Int, Int)
solucSistemaPotenciasPrimo [e] = e
solucSistemaPotenciasPrimo (e1:e2:es) = solucSistemaPotenciasPrimo ((solucDosEcPotenciasPrimo e1 e2):es)

quePotenciaLoDivide n p | n `mod` p == 0 = 1 + (quePotenciaLoDivide (div n p) p)
                        | otherwise = 0

desdoblarSistemaEnFcionPrimo [] _ = ([],[])
desdoblarSistemaEnFcionPrimo ((r,m):es) p | k == 0 = (pri, (r,m):seg)
                                          | m == pk = ((r,m):pri, seg)
                                          | otherwise = ((mod r pk, pk):pri, (mod r (div m pk), div m pk):seg)
                                          where
                                          (pri,seg) = desdoblarSistemaEnFcionPrimo es p
                                          k  = quePotenciaLoDivide m p
                                          pk = p^k
                                          
sistemaEquivSinPrimosMalosAux sist []     = sist
sistemaEquivSinPrimosMalosAux sist (p:ps) = (solucSistemaPotenciasPrimo pri):(sistemaEquivSinPrimosMalosAux seg ps)
 where
 (pri,seg) = desdoblarSistemaEnFcionPrimo sist p       
                                          
sistemaEquivSinPrimosMalos sist = sistemaEquivSinPrimosMalosAux sist (todosLosPrimosMalos sist)
                                          
solucSistemaModCoproimos [e] = e
solucSistemaModCoprimos ((r1,m1):(r2,m2):es) = solucSistemaModCoprimos ((r,m1*m2):es)
 where
 (d,s,t) = emcd m1 m2
 r = mod (r1*t*m2 + r2*s*m1) (m1*m2)
 
solucSistema sist = solucSistemaModCoprimos (sistemaEquivSinPrimosMalos (sistemaSimplifEquiv sist))
                                          


```
