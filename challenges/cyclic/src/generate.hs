module Main where

import System.Random
import Control.Monad
import Data.List
import Data.Maybe
import Data.Functor

alphabet :: String
alphabet = "abcdefghijklmnopqrstuvwxyz1234567890_{}"

-- The flag itself, must only use characters in the alphabet
flag :: String
flag = "he2022{sl0w_cycl1c_l00kup}"

index :: Char -> Maybe Int
index element = elemIndex element alphabet

indices :: [Integer]
indices = map (toInteger . fromJust . index) flag

alphabetLength :: Integer
alphabetLength = toInteger . length $ alphabet

-- The offsets will be randomly chosen from this range
getRandom :: IO Integer
getRandom = randomRIO (2^30, 2^40)

addMultipleOfAlphabetLength:: Integer -> IO ()
addMultipleOfAlphabetLength index = do
                                    rand <- getRandom
                                    putStrLn $ (show $ index + alphabetLength * rand) ++ (",")
test :: IO [Integer]
test = mapM (\e -> do rand <- getRandom
                      return (e + alphabetLength * rand)) indices

main :: IO ()
main = do 
         res <- test
         print $ drop 7 res -- Drop the first 7 elements i.e. he2022{ so that this part gets printed quickly
