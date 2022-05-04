type Set a = [a]

pertenece e c = elem e c

vacio :: Set Int
vacio = []

agregar :: Int -> Set Int -> Set Int
agregar e c | c == vacio = [e]
            | e `pertenece` c = c
            | otherwise = e : c
            
-- Determina si el primer conjunto está incluido en el segundo
incluido :: Set Int -> Set Int -> Bool
incluido [] _ = True
incluido _ [] = False
incluido (x:xs) b = (x `pertenece` b) && (xs `incluido` b)

iguales :: Set Int -> Set Int -> Bool
iguales a b = (a `incluido` b) && (b `incluido` a)


union :: Set Int -> Set Int -> Set Int
union a [] = a
union [] b = b
union (x:xs) b = union xs (x `agregar` b)

perteneC a b = elem a b

agregarC e c | c == [[]] = [e]
             | e `perteneC` c = c
             | otherwise = e : c

unionC :: Set (Set Int) -> Set (Set Int) -> Set (Set Int)
unionC a [] = a
unionC [] b = b
unionC [[]] [[b]] = [[], [b]]
unionC [[a]] [[]] = [[a], []]
unionC (x:xs) b = xs `unionC` (x `agregarC` b)

agregarAtodos :: Int -> Set (Set Int) -> Set (Set Int)
agregarAtodos a [] = []
agregarAtodos a (x:xs) = (a `agregar` x) `agregarC` (agregarAtodos a xs)

partes :: Int -> Set (Set Int)
partes 0 = [[]]
partes 1 = [[],[1]]
partes n = (agregarAtodos (n) anterior) `unionC` anterior
 where
   anterior = partes (n-1)

lpartes n = length (partes n)

---------------------------------------------------------------------------------------

perteneceT :: (Int, Int) -> Set (Int, Int) -> Bool
perteneceT p [] = False
perteneceT p (t:ts) = p == t || (perteneceT p ts)

agregarT :: (Int, Int) -> Set (Int, Int) -> Set (Int, Int)
agregarT a b | b == []          = [a]
             | a `perteneceT` b = b
             | otherwise        = a:b

unionT :: Set (Int, Int) -> Set (Int, Int) -> Set (Int, Int)
unionT a [] = a
unionT [] b = b
unionT (t:ts) b = ts `unionT` (t `agregarT` b)

prod :: Int -> Set Int -> Set (Int, Int)
prod n []     = []
prod n (x:xs) = (n,x) `agregarT` (prod n xs)


-- productoCartesiano [1,2,3] [3,4] --> [(1,3),(2,3),(3,3),(1,4),(2,4),(3,4)]
productoCartesiano :: Set Int -> Set Int -> Set (Int, Int)
productoCartesiano [] _ = []
productoCartesiano (x:xs) b = (prod x b) `unionT` (productoCartesiano xs b)

-- "Quiero estornudar pero no hay suficiente luz"
--                                  - Male, 2022






















