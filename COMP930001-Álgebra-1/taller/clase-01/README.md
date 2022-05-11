<div align='center'>
  <h1>Clase 1</h1>
  <h5>23/03/22</h5>
</div>


```diff
! Usando GHCi
Ubuntu - sudo apt install ghc
```

`clase1.hs`
```haskell
f x y = x * x + y * y -- Primer ejemplo de una función en Haskell
```

Cargar `:l clase1.hs`. Una vez cargado el programa, Haskell crea automáticamente el ambiente Main para ejecutarse.

----

```haskell
g x y z  = x + y + z * z
```

Para recargar `:r` y para cerrar el programa `:q`

----

Con negativos, es importante usar paréntesis

```haskell
g -1 2 3 -- Error

g (-1) 2 3 -- -> 10
```

----

## Ejercicios 

Resolver:

doble(x) = 2x

suma(x,y) = x+y

|(x1,x2)| = sqrt(x1^2 + x2^2)

f(x) = 8

----

## Resolución de los ejercicios

```haskell
doble x = 2 * x
suma x y = x + y
normaVectorial x1 x2  = sqrt(x1**2 + x2**2)
funcionConstante8 x = 8
```

##### Nota:
`^` (Potencia en enteros) es mejor que `**` (Potencia en decimales), ya que el último es más computacionalmente caro que el primero.

----

## Funciones partidas o funciones por casos

![equation](./assets/piecewise.png)

```haskell
f n | n == 0 0 
    | n /= 0 = 0

f n | n == 0 0 
    | otherwise = 0
```

Las guardas `|` siempre definen su propio scope.

### Funcion signo (sign)

```haskell
signo n | n > 0 = 1
        | n == 0 = 0
        | n < 0 = -1
```

Que también se puede hacer 

```haskell
signo 0 = 0
signo n | n > 0 = 1
        | otherwise = -1
```

### Funcion max(x, y)

----

## Keywords

`otherwise` siempre se evalúa a `True`.

`undefined`

`where` asigna un nombre a una expresión dentro del scope determinado.

----

## Pattern matching

```haskell
f n | n == 0 0 
    | n /= 0 = 0
```

También se puede hacer:

```haskell
f 0 = 1
f n = 0
```

Donde ambas expresiones son equivalentes.

----

## Tipos de datos

`Int: {+, -, *, div, mod}`

`Float: {+, -, *, /}`

`Bool: {&&, ||, not}`

```haskell
maximo :: Int -> Int -> Int
maximo x y | x >= y = x
           | otherwise = y
```


```haskell
esPar :: Int -> Bool
esPar n | mod n 2 == 0 = True
        | otherwise = False

esImpar :: Int -> Bool
esImpar n = not (esPar n)
```

```haskell
funcionRara Float -> Float -> Bool -> Bool
funcionRara x y True = True
funcionRara x y False = x >= y

-- O, tambien

funcionRara Float -> Float -> Bool -> Bool
funcionRara _ _ True = True
funcionRara x y False = x >= y
```

----

## Ejercicios

- [`absoluto`](./ejercicios.hs): Absoluto de un número

- [`maximoabsoluto`](./ejercicios.hs): El máximo entre el valor absoluto de dos números

- [`maximo3`](./ejercicios.hs): El máximo de tres enteros

- [`algunoEs0`](./ejercicios.hs): Dados dos racionales, decidir si alguno es igual a cero. Hacerlo una vez con y otra vez sin pattern matching.

- [`ambosSon0`](./ejercicios.hs): Dados dos racionales, decidir si ambos son cero. Ídem `algunoEs0`.

- [`esMultiploDe`](./ejercicios.hs): Dados dos naturales, decidir si el primero es múltiplo del segundo. 

- [`digitoUnidades`](./ejercicios.hs): Dado un natural, extraer el dígito de las unidades.

- [`digitoDecenas`](./ejercicios.hs): Dado un natural, extraer el dígito de las decenas.

