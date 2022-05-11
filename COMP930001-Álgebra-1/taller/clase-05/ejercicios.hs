factorial :: Int -> Int
factorial n | n == 0 = 1
            | n > 0 = n * factorial (n-1)
            
fib :: Int -> Integer
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = fib (n-1) + fib (n-2)

sdh :: Int -> Int -> Int
sdh _ 1 = 1
sdh n k | mod n k == 0 = k + d
        | otherwise = d
        where d = sdh n (k-1)
        

sd :: Int -> Int
sd n = sdh n n

mdd :: Int -> Int -> Int
mdd n k | n == k = n
        | mod n k == 0 = k
        | otherwise = mdd n (k+1)
        
md :: Int -> Int
md n = mdd n 2


esPrimo :: Int -> Bool
esPrimo n = md n == n 
          

proximoPrimo :: Int -> Int
proximoPrimo n | esPrimo (n+1) = (n+1)
               | otherwise = proximoPrimo (n+1)
                   
nEsimoPrimo :: Int -> Int
nEsimoPrimo n | n == 1 = 2
              | otherwise = proximoPrimo(nEsimoPrimo(n-1))


-- mfdk n k = minimo j! tal que j es mayor o igual k y j! mayor o igual a n 
mfdk n k | (factorial k) >= n = factorial k
         | otherwise = (mfdk n (k+1))
        

mfd :: Int -> Int
mfd n = mfdk n 1 


mfhk n k | (factorial k) >= n = factorial (k-1)
         | otherwise = (mfhk n (k+1))

mfh :: Int -> Int
mfh n = mfhk n 1
         
esFact :: Int -> Bool
esFact n = mfd n == n

esFibK n k | fib k >= n = n == fib k
           | otherwise = esFibK n (k+1)
           
esFib :: Int -> Int
esFib n = esFibK n 1
