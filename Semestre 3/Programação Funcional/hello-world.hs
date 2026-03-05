main = do
    putStrLn "HW"

    la <- getLine
    let x = read la
    putStrLn (show (x + 1))
    putStrLn (show (qs nums))

nums = [4, 5, 2, -2, 7, 2, 3]

-- Quick Sort
qs [] = []
qs [x] = [x]
qs l = (qs  [x | x <- l, x < (head l)])
        ++ [x | x <- l, x == (head l)] 
        ++ (qs [x | x <- l, x > (head l)])