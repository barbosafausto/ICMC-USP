main :: IO()
main = do
    print "HW"
    print $ g 0 s
    -- print $ (s + 1) - s
    -- print $ g s 5 (calcula s, porque dá 5 se s != 0, senão dá 42)
    print $ take 10 $ iteracao (*2) 1
    print $ take 10 $ p [2..]

    print $ takeWhile (<1000) $ iteracao (*3) 1

    print $ zipWith (*) [3, 4, 5] [9, 2, 1]

    print $ take 10 fibs

nums = [3, 5, 2, 1, 7, 8, 5]

a = [1..100000000000000000]
s = sum a

g 0 _ = 42
g _ x = x

iteracao f x = x:iteracao f (f x)

p (x:xs) = x:p [y | y <- xs, mod y x /= 0]

myZip _ [] _ = []
myZip _ _ [] = []
myZip f (x:xs) (y:ys) = f x y : myZip f xs ys

fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fibs = 1:1:zipWith (+) fibs (tail fibs) -- 1:1:2:3:5...

