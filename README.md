# modified-haskell-autograder
This is created using the original forked from [danalizieors](https://github.com/danalizieors/haskell-autograder)

In this particular autograder, the autograder liminating the used of certain built-in haskell function to minimize the use of AI to assist student on creating functions.

```prolog
--Do Not Modify--
{-# LANGUAGE NoImplicitPrelude #-}
module Solution
 ( module Prelude
    , foldr
    , coloredPrint
    , myMod
    , toDigit
    , reverseList
    , sumList
    , toDigitRev
    , myDouble
    , doubleEveryOther
    , mySquare
    , sqSum
    , sepConcat
    , validate
    , splitHalf
    , mergeList
    , mergeSort
    , clone
    , padZero
    , removeZero
    , bigAdd
    , sumDigits
    , mulByDigit
    , bigMul

  ) where

import Prelude
  ( Int, Integer, String, Bool(..)
  , Num((+),(-),(*)), Eq(..), Ord(..), Integral(div)
  , error, otherwise
  , length, (++) , abs
  , map, take,drop
  )

import qualified Data.List (foldr)
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr = Data.List.foldr

-- command to run the autograder test:
-- ghc /home/cs/cs420/autograder/PA2/Test.hs -e main
--
-- command to run the individual test:
-- ghci Test.hs
--
-- colored printing enabled
coloredPrint = True
--DO NOT MODIFY--
``` 


