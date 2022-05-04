<div align='center'>
  <h1>Clase 7</h1>
  <h5>04/05/22</h5>
  <h2>Conjuntos</h2>
</div>

|       Listas          |      Conjuntos      |
|-----------------------|---------------------|
|  El orden importa     | El orden no importa |
| Puede haber repetidos | No hay repetidos    |

Vamos a usar `[Int]` para representar conjunto usando un **renombre de tipos.**

```haskell
type Set a = [a]
```

Donde `type` es una palabra reservada, y `Set` es el nombre que le pusimos nosotros. Internamente va a ser una lista, pero vamos a tratarlo como si fuera un conjunto.

Así, por ejemplo, podemos definir el conjunto vacío:

```haskell
vacio :: Set Int
vacio = []
```

Además, podemos definir una operación, `agregar`, para poder añadir elementos al conjunto, de forma _segura_ es decir, sin repetir elementos en el conjunto.

```haskell
agregar :: Int -> Set Int -> Set Int
agregar e c | c == vacio = [e]
            | pertenece e c = c
            | otherwise = e:c
```

---
### Ejercicios

```haskell
type Set a = [a]

pertenece e c = elem e c

vacio :: Set Int
vacio = []

agregar :: Int -> Set Int -> Set Int
agregar e c | c == vacio = [e]
            | pertenece e c = c
            | otherwise = e:c
            
-- Determina si el primer conjunto está incluido en el segundo
incluido :: Set Int -> Set Int -> Bool
incluido [] _ = True
incluido _ [] = False
incluido (x:xs) b = (x `pertenece` b) && (incluido xs b)

iguales :: Set Int -> Set Int -> Bool
iguales a b = (incluido a b) && (incluido b a)
```
