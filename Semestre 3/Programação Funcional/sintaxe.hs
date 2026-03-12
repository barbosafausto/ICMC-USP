main :: IO()
main = do
    print "HW"
    print (sinal 6)
    print (baskara 2 4 1)
    print nums
    print nums2
    print (nums == nums2)

    print (myLen nums)
    print (mySum nums)

    print (myMap (^2) nums)
    print (myFilter (>4) nums)

sinal(x)
    | x < 0 = -1
    | x == 0 = 0
    | otherwise = 1

baskara a b c
    | delta < 0 = [] -- Temos 3 guardas
    | delta == 0 = [x]
    | otherwise = [x', x'']
    where
        delta= b^2 - 4*a*c
        x = (-b)/2*a
        x' = (-b + sqdelta)/(2*a)
        x'' = (-b - sqdelta)/(2*a)
        sqdelta = sqrt delta

nums = [4, 5, 2, 8, 7]
nums2 = (4:(5:(2:(8:(7:[]))))) -- Alusão a listas encadeadas: valor -> próxima lista

myLen [] = 0
myLen (_:xs) = 1 + myLen xs

myLen2 l
    | l == [] = 0
    | otherwise = 1 + myLen2 (tail l)

mySum [] = 0
mySum(x:xs) = x + mySum xs

myMap _ [] = []
myMap f (x:xs) = (f x):(myMap f xs)

myFilter _ [] = []
myFilter t (x:xs)
    | t x = x:(myFilter t xs)
    | otherwise = (myFilter t xs) 