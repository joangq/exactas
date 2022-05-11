<div align='center'>
  <h1>Clase 8</h1>
  <h5>11/05/22</h5>
  <h2>Combinatoria</h2>
</div>

```haskell
type Set a = [a]

pertenece e c = elem e c

vacio :: Set Int
vacio = []

agregar :: Int -> Set Int -> Set Int
agregar e c | c == vacio = [e]
            | pertenece e c = c
            | otherwise = e:c
           
```
---

```haskell

comb :: Int -> Int -> Int
comb n m | m == 0 = 1
         | m == n = 1
         | otherwise = (comb (n-1) m) + (comb (n-1) (m-1))
         
ponerEnTodos :: Int -> Set [Int] -> Set [Int]  
ponerEnTodos x [] = []
ponerEnTodos x (l:ls) = agregar (x:l) (ponerEnTodos)
         
agregarTodosATodos :: Set Int -> Set [Int] -> Set [Int]
agregarTodosATodos [] ls = []
agregarTodosATodos (x:xs) ls = union (ponerEnTodos x ls) (agregarTodosATodos xs ls)       
         
variaciones :: Set Int -> Int -> Set [Int]
variaciones c 0 = [[]] 
variaciones c l = agregarTodosATodos c (variaciones c (l-1))
```
