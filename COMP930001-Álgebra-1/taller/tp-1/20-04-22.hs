cz n | (c == 4) || (c == 2) || (c == 1) = True
     | otherwise = cz c
     where c = collatz(n)

collatz :: Integer -> Integer
collatz n | mod n 2 == 0 = n `div` 2
          | otherwise = (3*n) + 1


satisfaceCollatz :: Integer -> Integer -> Bool
satisfaceCollatz n k | (c <= k) = (c == 1)
                     | otherwise = satisfaceCollatz c k
                     where c = collatz(n)



czk :: Integer -> Integer -> (Bool, Integer)
czk n h | (c == 4) = (True, h+3)
        | otherwise = czk c (h+1)
         where c = collatz(n)

cz n = czk n 1

largoSecuencia :: Integer -> Integer
largoSecuencia n = snd (cz n)
