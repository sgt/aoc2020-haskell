module Main where

-- day 6 is too trivial for testing

import qualified Day10Test
import qualified Day1Test
import qualified Day2Test
import qualified Day3Test
import qualified Day4Test
import qualified Day5Test
import qualified Day7Test
import qualified Day8Test
import qualified Day9Test
import Protolude
import Test.Tasty (TestTree, defaultMain, testGroup)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "aoc2020 tests"
    [ Day1Test.tests,
      Day2Test.tests,
      Day3Test.tests,
      Day4Test.tests,
      Day5Test.tests,
      Day7Test.tests,
      Day8Test.tests,
      Day9Test.tests,
      Day10Test.tests
    ]
