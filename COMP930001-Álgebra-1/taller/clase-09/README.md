<div align='center'>
  <h1>Clase 9</h1>
  <h5>01/06/22</h5>
  <h2>Algoritmo de Euclides</h2>
</div>

```haskell
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

division' a d | a < d = (0,a)
              | otherwise = (q'+1, r')
              where 
               (q',r') = division' (a-d) d 
               
divisionn a d | a > 0 = (0,a)
              | otherwise = (q'-1,r')
              where
                 (q',r') = divisionn (a+d) d
               
               
division :: Int -> Int -> (Int, Int)
division a d    | (a > 0) && (d > 0) = dv a d
                | (a < 0) && (d > 0) = dn a d
                | otherwise = undefined

division'' a d | a >= 0    = division a d
               | r' == 0   = (-q', r')
               | otherwise = (-q'-1, d-r')
               where
                  (q',r') = division (abs a) d


division3 a d | a >= 0 = division a d
              | otherwise = (q'-1, r)
              where
                (q',r') = division' (a+d) d

```

```haskell
-- a positivo; b positivo (o cero)
mcd :: Int -> Int -> Int
mcd a 0 = a
mcd a b = mcd b r
 where
    (_,r) = division a b
    
    

emcd :: Int -> Int -> (Int, Int, Int)
emcd a 0 = (a,1,0)
emcd a b = (g,s,t)
 where
   g = mcd a b
   (g',s',t') = emcd b r
   (q,r) = division a b
   s = t'
   t = (s' - t' * q)
```
