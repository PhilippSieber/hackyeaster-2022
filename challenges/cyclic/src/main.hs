module Main where

import System.IO
import Control.Monad
import Data.List

alphabet :: [Char]
alphabet = cycle "abcdefghijklmnopqrstuvwxyz1234567890_{}"

convert :: Integer -> Char
convert i = genericIndex alphabet i

flag :: [Integer]
flag = [ 7, 4, 27, 35, 27, 27, 37, 18604515501954,9089503077614,34052138441993,21227909669131,39663104618160,16103958750284,16456688276676,15426709948652,35366249530142,30753312664451,34621244773091,16094279020284,25308844326686,10237817005295,16074542603063,13960368551308,20563985455787,25423361916669,36367841662112]

putFlush :: Char -> IO()
putFlush c = do
             putChar c
             hFlush stdout

main ::IO()
main = do
       putStrLn "[λ] I will now print your flag. Please be patient"
       mapM_ putFlush $ map convert flag
