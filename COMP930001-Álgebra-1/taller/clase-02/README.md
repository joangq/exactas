<div align='center'>
  <h1>Clase 2</h1>
  <h5>30/03/22</h5>
</div>

## Variables de tipo

```haskell
identidad x = x

:t identidad
-- -> identidad :: p -> p
-- Donde 'p' representa una variable de tipo

primero x y = x

:t primero
-- -> primero :: p1 -> p2 -> p1

segundo x y = y
:t segundo
-- -> segundo :: p1 -> p2 -> p2

constante5 x y z = 5
:t constante5
-- -> constante5 :: p1 -> p2 -> p3 -> Int

:t primero True 5
-- -> primero True 5 :: Bool
```

## Funciones con variables de tipo

```haskell
identidad :: t -> t
identidad x = x

primero :: tx -> ty -> tx
primero x y = x

mismoTipo :: t -> t -> Bool
mismoTipo x y = True
```
```haskell
triple x = 3*x
:t triple

maximo x y | x >= y = x
           | otherwise = y

distintos x y = x /= y

-- -> triple :: Num a => a -> a

:t triple 2
-- -> triple 2 :: Num a => a

:t triple 2.4
-- -> triple 2.4 :: Fractional a => a

:t maximo
-- -> maximo :: Ord p => p -> p -> p

:t maximo True False
-- -> maximo True False :: Bool

:t maximo 2 2.4
-- -> maximo 2 2.4 :: (Ord p, Fractional p) => p

:t maximo 2.5 2.4
-- -> maximo 2.5 2.4 :: (Ord p, Fractional p) => p

:t maximo 2 4
-- -> maximo 2 4 :: (Ord p, Num p) => p

:t maximo 4 4
-- -> maximo 4 4 :: (Ord p, Num p) => p

:t maximo True 4
-- -> No instance for (Num Bool) arising from the literal ‘4’
```

### Clases de tipos:

`Integral`, `Fractional`, `Floating`, `Num`, `Ord`, `Eq`, entre otros.
Están definidos en función de las operaciones que se pueden hacer con ellos.

La flecha `=>` implica una _restricción_ de la clase del tipo.

```haskell
triple :: (Num t) => t -> t
triple x = 3*x

maximo :: (Ord t) => t -> t -> t
maximo x y | x >= y = x
           | otherwise = y
           
cantidadDeSoluciones :: (Num t, Ord t) => t -> t -> Int
cantidadDeSoluciones b c | d > 0 = 2
                         | d == 0 = 1
                         | otherwise = 0
                         where d = b^2 - 4*c
```

```haskell
f1 x y z = x ** y + z <= (x+y**z)

f2 x y = (sqrt x) / (sqrt y)

f3 x y = div (sqrt x) (sqrt y)

f4 x y z | x == y = z
         | x ** y == y = x
         | otherwise = y
         
f5 x y z | x == y = z
         | x ** y == y = z
         | otherwise = z
```

```haskell
f4 5 5 True
-- -> No instance for (Num Bool) arising from the literal ‘2’

:t f4
-- -> f4 :: (Eq p, Floating p) => p -> p -> p -> p
```

```haskell
f5 5 5 True
-- -> True

:t f5
-- -> f5 :: (Eq a, Floating a) => a -> a -> p -> p
```
## Tuplas

```haskell
(True, (1,2)) :: (Bool, (Int, Int))
```
### Funciones de acceso en `Prelude`

- `fst :: (a,b) -> a`
- `snd :: (a,b) -> b`

```haskell
suma :: (Float, Float) -> (Float, Float) -> (Float, Float)
suma v w = ((fst v) + (fst w) , (snd v) + (snd w))
```
Otra forma de reescribir lo anterior puede ser la siguiente, usando pattern matching:

```haskell
suma (vx, vy) (wx, wy) = (vx + wx, vy+wy)
```

[Ejercicios:](./clase-02.md)

- [`estanRelacionados`](./clase-02.md): Dados dos numeros reales, decidir si estan relacionados considerando la relacion de equivalencia en R, cuyas clases de equivalencia son: (-inf, 3], (3,7), (7,+inf).
- [`prodInt`](./clase-02.md): calcula el producto interno entre dos vectores de R2
- [`todoMenor`](./clase-02.md): dados dos vectores de R2 decide si es cierto que cada coordenada del primer vector es menor a la coordenada correspondiente del segundo vector
- [`distanciaPuntos`](./clase-02.md): calcula l aidstancia entre dos puntos de R2
- [`sumaTerna`](./clase-02.md): dada una terna de numeros enteros, calcula la suma de sus tres elementos
- [`posicPrimerPar`](./clase-02.md): dada una terna de enteros, devuelve la posición del primer númer par si es que hay alguno, y devuelve 4 si son todos impares
- [`crearPar :: a -> b (a,b)`](./clase-02.md): crea un par a partir de sus dos componentes dadas por separado (debe funcionar para elementos de cualquier tipo)
- [`invertir :: (a,b) -> (b,a)`](./clase-02.md): invierte los elementos del par pasado como par{ametro (debe funconar para elementos de cualquier tipo)
