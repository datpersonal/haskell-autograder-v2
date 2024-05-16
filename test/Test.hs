--Improvised code from github: https://github.com/danalizieors/haskell-autograder
--Do Not Modify--
{-# LANGUAGE NoImplicitPrelude #-}
module SolutionPA2
 ( module Prelude
  ,foldr
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

--Write your solution below--
--Write your solutions after Function Type, the sentence after that is just a placeholder

-- Part A: Basic Haskell Prelude
-- In this part of the assignment you will create your own prelude libraries

--myMod
--Write your own modulus function that is calculate the remainder
--
-- myMod 12 4
-- >>> 0
--
-- myMod 12 5
-- >>> 2
--
-- myMod 12 12
-- >>> 0

myMod :: Int -> Int -> Int
myMod x y = if x < y then x else myMod (x -y) y
--toDigit
--The function is to convert a positive number to a list of number, if it is negative or 0 then return empty list
--
-- toDigit 13
-- >>> [1,3]
--
-- toDigit 0
-- >>> []
--
-- toDigit (-13)
-- >>> []

--toDigit :: Int -> [Int]
toDigit _ = "not implemented"


--reverseList (10 pts)
--The function is used to reverse a list of arbitrary type
-- reverseList ['a','b','c']
-- >>> "cba"
-- reverseList [1,2,3,4]
-- >>> [4,3,2,1]
-- reverseList "racecar"
-- >>> "racecar"

--reverseList :: [a] -> [a]
reverseList _ = "not implemented"

--sumList
--The function is used to get the sum of a list of number
-- sumList [1,2,3,4]
-- >>> 10
--
-- sumList [1,2,3,(-2)]
-- >>> 4
--
-- sumList []
-- >>> 0

--sumList :: [Int] -> Int
sumList _ = "not implemented"



--toDigitRev is used to reverse toDigit list
--
-- toDigitRev 34
-- >>> [4,3]
--
-- toDigitRev 53
-- >>> [3,5]
--
-- toDigitRev 10
-- >>> [0,1]

--toDigitRev :: Int -> [Int]
toDigitRev _ = "not implemented"

-- Part B: Folding Function
-- In this part of the problems, you have to use foldr. Every function will be check for the foldr unless specified otherwise such as doubleEveryOther
-- Without using foldr, your function will be mark 0 even if the output is correct

--myDouble
--Write your own double function that is using foldr
--without using fold it will be 0 even the output is right
--
-- myDouble 2
-- >>> 4
--
-- myDouble 4
-- >>> 8
--
-- myDouble 0
-- >>> 0

--myDouble :: Int -> Int
myDouble x = foldr (*) 2 [x]


-- doubleEveryOther will double the value of every other digit from left to right, beginning with the second digit
-- NOTE: You do not have to use foldr for this particular function.
--
-- doubleEveryOther [1,2,3,4]
-- >>> [1,4,3,8]
--
-- doubleEveryOther [1,2,3]
-- >>> [1,4,3]

--doubleEveryOther :: [Int] -> [Int]
doubleEveryOther _ = " not implemented"
--mySquare
--Write your own my square function using foldr
--
-- mySquare 0
-- >>> 0
--
-- mySquare 1
-- >>> 1
--
-- mySquare (-5)
-- >>> 25

--mySquare :: Int -> Int
mySquare _ = "not implemented"


-- Write sqSum function such that sqSum [x1, ... , xn] should return (x1^2 + ... + xn^2)
--
-- >>> sqSum []
-- 0
--
-- >>> sqSum [1,2,3,4]
-- 30
--
-- >>> sqSum [(-1), (-2), (-3), (-4)]
-- 30

--sqSum :: [Int] -> Int
sqSum _ = "not implemented"


--sumDigits is to add the sum of all the number inside the list that is already turn into single digit (10 pts)
--
-- sumDigits [1,10,12] which is 1 + 1 + 0 + 1 + 2
-- >>> 5
--
-- sumDigits [23,32,(-45)] which is 2 + 3 + 3 + 2 + 0
-- >>> 10

--sumDigits :: [Int] -> Int
sumDigits _ = "not implemented"

-- sepConcat will concatenate the defined seperator to a list of string. If the list is empty despite the defined seperator return empty string.
--
-- sepConcat ", " []
-- >>> ""
--
-- sepConcat ", " ["foo", "bar", "baz"]
-- >>> "foo, bar, baz"
--
-- sepConcat "#" ["a","b","c","d","e"]
-- >>> "a#b#c#d#e"

--sepConcat :: String -> [String] -> String
sepConcat _ _ = "not implemented"


-- Part C: Credit Card problem

-- Using the above written functions, create a validate function will decide if a number is legal to use as credit card using Luhn algorithm
-- Luhn algorithm:
--  1) Double the value of every other digit from right to left, beginning with the second to last digit.
--  2) Add the digits of the results of Step 1 to the remaining digits in the credit card number.
--  3) If the result mod 10 is equal to 0, the number is valid. If the result mod 10 is not equal to 0, the validation fails.
-- source: https://www.ibm.com/docs/en/order-management-sw/9.3.0?topic=cpms-handling-credit-cards
--To validate the credit card using this website
--https://dnschecker.org/credit-card-validator.php
--To generate using same website above or this
--https://www.lambdatest.com/free-online-tools/credit-card-number-generator

--
-- validate 4723304884813
-- >>> True
--
-- validate 4012888888881881
-- >>> True
--
-- validate 4012888888881882
-- >>> False

--validate :: Int -> Bool
validate _ = "not implemented"


-- PartD: Sorts algorithms

-- splitHalf will split a list of number to 2 half
--
-- splitHalf [1,2,3,4,5]
-- >>> ([1,2],[3,4,5])
--
-- splitHalf [1,2,3,4,5,6]
-- >>> ([1,2,3],[4,5,6])

--splitHalf :: [a] -> ([a], [a])
splitHalf _ = "not implemented"


-- mergeList will merge 2 list that is sorted by the key value b
--
-- mergeList [("dat",1),("scott",5)] [("dan",3),("scott",4)]
-- >>> [("dat",1),("dan",3),("scott",4),("scott",5)]
--
-- mergeList [("danny",35),("scott",5)] [("dan",3),("scott",4)]
-- >>> [("dan",3),("scott",4),("danny",35),("scott",5)]

--mergeList :: Ord b => [(a, b)] -> [(a, b)] -> [(a, b)]
mergeList _ _= "not implemented"



-- mergeSort will sort using mergeList function
--
-- mergeSort [("dat",1),("scott",5),("Tim",2)]
-- >>> [("dat",1),("Tim",2),("scott",5)]
--
-- mergeSort [("dat",1),("dan",5),("scott",4),("scottish",3)]
-- >>> [("dat",1),("dat2",3),("scott",4),("scott",5)]

--mergeSort :: Ord b => [(a,b)] -> [(a,b)]
mergeSort _ = "not implemented"


-- Part E - working with new type
-- Note: You should not use fold anywhere in this part of the assignment
type BigInt = [Int]
--
-- You will be writing three helper functions to solve bigAdd, mulByDigit, bigMul

-- `clone x n` returns a `[x,x,...,x]` containing `n` copies of `x`
--
-- clone 3 5
-- >>> [3,3,3,3,3]
--
-- clone "foo" 2
-- >>> ["foo", "foo"]

--clone :: a -> Int -> [a]
clone _ x = "not implemented"


-- `padZero l1 l2` returns a pair (l1', l2') which are the input lists,
--  padded with extra `0` on the left such that the lengths of `l1'`
--  and `l2'` are equal.
--
-- padZero [9,9] [1,0,0,2]
-- >>> ([0,0,9,9], [1,0,0,2])
--
-- padZero [1,0,0,2] [9,9]
-- >>> ([1,0,0,2], [0,0,9,9])

--padZero :: BigInt -> BigInt -> (BigInt, BigInt)
padZero _ _ = "not implemented"


-- `removeZero ls` strips out all leading `0` from the left-side of `ls`.
--
-- removeZero [0,0,0,1,0,0,2]
-- >>> [1,0,0,2]
--
-- removeZero [9,9]
-- >>> [9,9]
--
-- removeZero [0,0,0,0]
-- >>> []

--removeZero :: BigInt -> BigInt
removeZero xs = "not implemented"


-- `bigAdd n1 n2` returns the `BigInt` representing the sum of `n1` and `n2`
--
-- bigAdd [9, 9] [1, 0, 0, 2]
-- >>> [1, 1, 0, 1]
--
-- bigAdd [9, 9, 9, 9] [9, 9, 9]
-- >>> [1, 0, 9, 9, 8]

--bigAdd :: BigInt -> BigInt -> BigInt
bigAdd _ _ = "not implemented"


-- `mulByDigit i n` returns the result of multiplying
--  the digit `i` (between 0..9) with `BigInt` `n`.
--
-- mulByDigit 9 [9,9,9,9]
-- >>> [8,9,9,9,1]

--mulByDigit :: Int -> BigInt -> BigInt
mulByDigit _ _ = "not implemented"


-- `bigMul n1 n2` returns the `BigInt` representing the
--  product of `n1` and `n2`.
--
-- bigMul [9,9,9,9] [9,9,9,9]
-- >>> [9,9,9,8,0,0,0,1]
--
-- bigMul [9,9,9,9,9] [9,9,9,9,9]
-- >>> [9,9,9,9,8,0,0,0,0,1]

--bigMul :: BigInt -> BigInt -> BigInt
bigMul _ _ = "not implemented"
