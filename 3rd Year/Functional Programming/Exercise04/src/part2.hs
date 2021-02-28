import System.IO
import Control.Monad

main = do
    handle <- readFile "files.txt"
    print . map readInt . words $ contents

readInt :: String -> Int
readInt = read