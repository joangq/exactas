<div align='center'>
  <h1>Clase 3</h1>
  <h5>06/04/22</h5>
</div>

# Recursión

## Factorial

```haskell
factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n-1)
            
-- factorial 4 -> 4 * factorial 3
-- factorial 3 -> 3 * factorial 2
-- factorial 2 -> 2 * factorial 1
-- factorial 1 -> 1 * factorial 0
-- factorial 0 -> 1
```
La misma función, pero usando pattern matching

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)
```
Lo importante es que el base case permita que la función termine a través de la reducción del parámetro inicial. Supongamos que tenemos la siguiente función:

```haskell
factorial n | n == 0 = 1
factorial n | otherwise = n * factorial (n-1)
```

En este caso, al utilizar el `otherwise`, la función acepta números negativos (lo cual no nos interesa) y, más importante, el caso donde se introduzca un número negativo, no permite que la función termine, ya que restará infinitamente al parámetro inicial.

Consideremos ahora la siguiente función:

```haskell
esPar :: Int -> Bool
esPar n | n == 0 = True
        | otherwise = esPar (n-2)
```

En este caso sucede algo similar, ya que si introducimos un número que es impar,  el programa no tiene una condición de salida. Podemos _corregir_ este comportamiento, reescribiendo la función.

```haskell
esPar n | n == 0 = True
        | n == 1 = False
        | otherwise = esPar (n-2)
```

O bien, podemos intentar usar un solo caso base:

```haskell
esPar 0 = True
esPar n = not (esPar (n-1))
```
De otra forma, podemos reescribirlo con guardas:

```haskell
esPar n | n == 0 = True
        | otherwise = not (esPar (n-1))
```

---

## ¿Cómo pensar recursivamente?

Necesitamos:
- El paso `recursivo`, donde asumimos que tenemos el resultado para el caso anterior, combinándolo con el resultado del caso actual para llegar al resultado final.
- Uno o varios casos base, para permitir que la función recursiva tenga un punto en el que termine de ejecutarse. 

Las llamadas recursivas tienen que acercarse al caso base.

---

## Ejercicios:

- `Fibonacci`: Si n == 0 = 0, si n == 1 = 1, sino `fib(n-1)+fib(n-2)`.
