```haskell
type Complejo = (Float, Float)

modulo' :: Complejo -> Float
modulo' (a,b) = (a^2) + (b^2)

porEscalar :: Complejo -> Float -> Complejo
porEscalar (a,b) n = (a*n, b*n)

re :: Complejo -> Float
re (a,_) = a

im :: Complejo -> Float
im (_,b) = b

conjugado :: Complejo -> Complejo
conjugado (a,b) = (a,(-b))

suma :: Complejo -> Complejo -> Complejo
suma (a1,b1) (a2,b2) = (a1+a2,b1+b2)

{- (a,b) * (c,d) =
 - (a*c) + a*d*i + b*c*i + b*d*(i^2) -}
producto :: Complejo -> Complejo -> Complejo 
producto (a1,b1) (a2,b2) = ((a1*a2)-(b1*b2),(a1*b2)+(b1*a2))

inverso :: Complejo -> Complejo
inverso (0,0) = undefined
inverso z = (conjugado z) `porEscalar` (1 / (modulo' z)) 

cociente :: Complejo -> Complejo -> Complejo
cociente (0,0) _ = (0,0)
cociente _ (0,0) = undefined
cociente z w     = z `producto` inverso w

potencia :: Complejo -> Int -> Complejo
potencia z 0 = (1,0)
potencia z 1 = z
potencia z n = producto z (potencia z (n-1))

solucionesCuadratica :: Float -> Float -> Float -> (Complejo, Complejo)
solucionesCuadratica a b c | signum(d') == -1 = (x1i, x2i)
                           | otherwise = ((x1,0),(x2,0))
                           where
                            x1  = -b + d
                            x2  = -b - d
                            d'  = b*b - 4*a*c
                            d   = sqrt(d') / 2*a
                            di' = (0, d' * (-1)) `porEscalar` (1/(2*a))
                            x1i = suma (-b,0) di'
                            x2i = suma (-b,0) (di' `porEscalar` (-1))

                           
solucionesCuadratica' :: Float -> Float -> Float -> (Complejo, Complejo) 
solucionesCuadratica' a b c | d >= 0    = (z1,z2)
                            | otherwise = (z1, conjugado z1)
                            where
                              d' n | signum(n) == -1 = (0, sqrt(n * (-1)))
                                   | otherwise       = (sqrt(n), 0)  
                              di = d' d
                              d  = (b^2) - 4*a*c 
                              b' = (-b,0)
                              z1 = cociente (suma b' di) (2*a, 0)
                              z2 = cociente (suma b' (di `producto` (-1,0))) (2*a, 0)

--toDegrees :: Float -> Float
degrees r = r * 180/pi

--toRadians :: Float -> Float
radians r = r * pi/180

modulo :: Complejo -> Float
modulo z = sqrt (modulo' z)

argumento :: Complejo -> Float
argumento (a,b) = (atan2 a b) -- +pi

pasarACartesianas :: Float -> Float -> Complejo
pasarACartesianas t r = (r * cos (t), r * sin(t))
    
raizCuadrada :: Complejo -> (Complejo, Complejo)
raizCuadrada z = (w1,w2) 
  where
    s = sqrt (modulo z)
    fi = (argumento z) / 2
    fi' = fi+pi    
    w1 = pasarACartesianas fi s
    w2 = pasarACartesianas fi' s
    

solucionesCuadraticasCoefComplejos :: Complejo -> Complejo -> Complejo -> (Complejo, Complejo)
solucionesCuadraticasCoefComplejos a b c = (s1,s2)
  where
    b' = producto b (-1,0) 
    a2 = producto a (2,0)
    d = (potencia b' 2) `suma` (producto (-4,0) (producto a c))
    (rd1, rd2) = raizCuadrada d
    s1 = b' `suma` rd1 `cociente` a2
    s2 = b' `suma` rd2 `cociente` a2
    
kEsimaRaiz :: Int -> Int -> Complejo
kEsimaRaiz k n = (cos m, sin m)
  where
    m' = (2*k*pi)/n
    m  = fromIntegral m

raicesNEsimasDesde :: Int -> Int -> [Complejo]
raicesNEsimasDesde k n | k == n    = []
                       | otherwise = (kEsimaRaiz k n) : raicesNEsimasDesde (k+1) n

raicesNEsimas :: Int -> [Complejo]
raicesNEsimas n = undefined


potenciasRaizNEsima :: Int -> Int -> [Complejo]
potenciasRaizNEsima k n = undefined
```
