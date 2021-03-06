{-# LANGUAGE OverloadedStrings #-}

module Day2 where

import qualified Data.Text as T
import Protolude
import Util (splitTwoOn)

data Constraints = Constraints Char Int Int

isValidA :: Text -> Constraints -> Bool
isValidA password (Constraints ch minE maxE) = entries >= minE && entries <= maxE
  where
    entries = length $ filter (== ch) (toS password)

parseLine :: Text -> Maybe (Text, Constraints)
parseLine x = do
  (constraintDef, password) <- splitTwoOn ": " x
  (minMax, chT) <- splitTwoOn " " constraintDef
  (minET, maxET) <- splitTwoOn "-" minMax
  ch <- if T.length chT == 1 then Just (T.head chT) else Nothing
  minE <- readMaybe $ toS minET
  maxE <- readMaybe $ toS maxET
  pure (password, Constraints ch minE maxE)

solve :: (Text -> Constraints -> Bool) -> Text -> Text
solve validatorFn input = show . length $ filter (uncurry validatorFn) params
  where
    params = mapMaybe parseLine (lines input)

solveA :: Text -> Text
solveA = solve isValidA

isValidB :: Text -> Constraints -> Bool
isValidB password (Constraints ch minE maxE) =
  T.length password >= maxE && ((ch == ch1) `xor` (ch == ch2))
  where
    ch1 = T.index password (minE - 1)
    ch2 = T.index password (maxE - 1)

solveB :: Text -> Text
solveB = solve isValidB
