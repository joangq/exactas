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
