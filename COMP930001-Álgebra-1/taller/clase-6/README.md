<div align='center'>
  <h1>Clase 6</h1>
  <h5>27/04/22</h5>
  <h2>Listas</h2>
</div>

Las _listas_ son arreglos de elementos ordenados. Los elementos de una lista tienen que ser de un mismo tipo, de forma tal que:

```haskell
[1,2,1] :: [Int]
[True, False, True] :: [Bool]
[[1],[1,2,1],[456,0],[],[1]] :: [[Int]]
```

## Operaciones de listas

Para acceder los últimos elementos de una lista, es decir, todo menos el primer elemento, usamos `tail :: [a] -> a`, y para acceder al primer elemento de una lista, usamos `head :: [a] -> a`.
Si queremos añadir elementos al comienzo de la lista, usamos el operador `:`, de forma tal que

```haskell
1 : 2 : [3,4]         -> [1,2,3,4]
[1,2,3] : [4,5] : []  -> [[1,2,3], [4,5]]
[1,2,3] : [4,5]       -> Error
```

## Recursión con listas

Supongamos que queremos implementar una función `sumatoria :: [Int] -> Int`, de forma tal que calcule la sumatoria de todos los elementos de una lista de enteros, de forma recursiva.

Si tuviéramos, por ejemplo, la siguiente lista: `[1,2,3,4,5,6,7]`, queremos calcular:

_sumatoria [1,2,3,4,5,6,7] = 1+2+3+4+5+6+7_

Podemos pensarlo como:

_sumatoria [1,2,3,4,5,6,7] = 1 + sumatoria [2,3,4,5,6,7]_

O, mejor expresado en un ejemplo más pequeño:

_sumatoria [1,2,3] = 1 + sumatoria [2,3] = 1 + 2 + sumatoria[3]_

Por ende, es fácil ver que el caso base de la recursión, será la sumatoria de la lista de un solo elemento. Luego, podemos escribir lo siguiente:

```haskell
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria xs = head xs + sumatoria (tail xs)
```

