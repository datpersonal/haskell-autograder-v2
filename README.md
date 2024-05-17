# modified-haskell-autograder
This is created using the original forked from [danalizieors](https://github.com/danalizieors/haskell-autograder)

In this particular autograder, the autograder liminating the used of certain built-in haskell function to minimize the use of AI to assist student on creating functions, as the code below: the first part will be what to export from Solution

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

coloredPrint = True
--DO NOT MODIFY--
``` 

Then add the import in the Test.hs file as below to use only those that is imported from the Solution.hs:
```prolog
module Test where
import Text.Printf
import Solution
    ( coloredPrint
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
    , mulByDigit
    , bigMul
    , foldr
    , sumDigits
    )
```
