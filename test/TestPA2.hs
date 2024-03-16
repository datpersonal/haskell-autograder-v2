--Improvised code from github: https://github.com/danalizieors/haskell-autograder


import Text.Printf
import SolutionPA2


-- colored printing functionality
data Color = Normal | Red | Green

codeFor Normal = 0
codeFor Red = 31
codeFor Green = 32

stringFor color = "\x1b[" ++ show (codeFor color) ++ "m"

paint color string
    | coloredPrint = stringFor color ++ string ++ stringFor Normal
    | otherwise = string


-- methods and data structures used for verifying the solutions and displaying the results
data Problem = Problem {
    title :: String,
    description :: String,
    score :: Double,
    tests :: [Test]
} deriving (Show)

data Test = Test {
    name :: String,   
    expected :: String,
    result :: String
} deriving (Show)


line = "--------------------------------------------------------------------------------"

displayExam exam =
    let solved = calculateSolved exam
        given = calculateGiven exam
        scored = calculateScored exam
        maximum = calculateMaximum exam
        result = displayResult scored maximum
    in intro ++ displayProblems exam ++ outro result

intro = let title = "--== Haskell Programming Assignment 2 ==--"
        in printf "\n\n%s\n                      %s\n%s\n\n\n" line title line

outro result = printf "%s\n    Results: %s\n%s\n\n\n" line result line

displayResult scored maximum =
    displayScore (resultColor scored maximum) scored maximum

displayProblems problems = mapConcat displayProblem problems

displayProblem problem@(Problem title description score tests) =
    let solved = solveTests tests
        label = displayLabel scored maximum 
        given = length tests               
        header = printf "    %s\n\n" title
        body = printf "%s\n\n%s\n%s\n\n" description (displayTests tests) label
        scored = scoreProblem problem
        maximum = score
    in header ++ body

displayLabel scored maximum =
    displayScore (labelColor scored maximum) scored maximum

displayTests :: [Test] -> String
displayTests tests = mapConcat displayTest tests

displayTest test@(Test name expected result) =
    let correct = solveTest test
        label = if correct then paint Green "PASS" else paint Red "FAIL"
        arrow = (paint Green "\n=> Expected Output: ")
        corrected = (paint Green expected)
        mistake = if correct then "" else printf "| Your Output: %s" (paint Red result)
        header = printf "    %s  %s" label name
        body = printf "           %s %s %s\n\n" arrow corrected mistake
    in header ++ body



labelColor solved given
    | solved == given = Green
    | otherwise = Red

resultColor scored maximum
    | maximum / 2 <= scored = Green
    | otherwise = Red

calculateSolved problems = sum $ map (solveTests . tests) problems
calculateGiven problems = sum $ map (length . tests) problems
calculateScored problems = sum $ map scoreProblem problems
calculateMaximum problems = sum $ map score problems

scoreProblem (Problem _ _ score tests) =
    let solved = fromIntegral $ solveTests tests
        given = fromIntegral $ length tests
    in score * solved / given
    
displayScore color scored maximum =
    paint color $ printf "[%.2f/%.2f] | [%.2f%%]" scored maximum ((scored / maximum) * 100)

solveTests = length . filter solveTest
solveTest (Test _ expected result) = expected == result

mapConcat f = foldr (++) [] . map f

main = putStr $ displayExam $ exam


-- define the problems and the solutions
exam =
    [
        Problem 
        {
            title = "Part A: Haskell Prelude Library",
            description = "You will create your own version of prelude functions",
            score = 10,
            tests = 
            [
                Test {
                    name = "myMod 12 4",                   
                    result = show $ myMod 12 4,
                    expected = "0"
                },
                Test {
                    name = "myMod 13 4",                    
                    result = show $ myMod 13 4, 
                    expected = "1"
                },              
                Test {
                    name = "myMod 12 12",                 
                    result = show $ myMod 12 12,
                    expected = "0"
                },
                Test {
                    name = "toDigit 13",                   
                    result = show $ toDigit 13,
                    expected = "[1,3]"
                },
                Test {
                    name = "toDigit 0",                  
                    result = show $ toDigit 0 , 
                    expected = "[]"
                },              
                Test {
                    name = "toDigit (-13)",                   
                    result = show $ toDigit (-13),
                    expected = "[]"
                },
                Test {
                    name = "reverseList ['a','b','c']",                  
                    result = show $ reverseList ['a','b','c'],
                    expected = "\"cba\""
                },
                Test {
                    name = "reverseList [1,2,3,4]",                   
                    result = show $ reverseList [1,2,3,4], 
                    expected = "[4,3,2,1]"
                },              
                Test {
                    name = "reverseList \"racecar\"",                   
                    result = show $ reverseList "racecar",
                    expected = "\"racecar\""
                },
                Test {
                    name = "sumList [1,2,3,4]",                   
                    result = show $ sumList [1,2,3,4],
                    expected = "10"
                },
                Test {
                    name = "sumList [1,2,3,(-2)]",
                    result = show $ sumList [1,2,3,(-2)], 
                    expected = "4"
                },              
                Test {
                    name = "sumList []",               
                    result = show $ sumList [],
                    expected = "0"
                },
                Test {
                    name = "toDigitRev 34",                   
                    result = show $ toDigitRev 34,
                    expected = "[4,3]"
                },
                Test {
                    name = "toDigitRev 53",
                    result = show $ toDigitRev 53, 
                    expected = "[3,5]"
                },              
                Test {
                    name = "toDigitRev 10",               
                    result = show $ toDigitRev 10,
                    expected = "[0,1]"
                }
            ]
        },
        Problem 
        {
            title = "Part B: Folding Function",
            description = "In this part of the problems, you have to use foldr unless specifies otherwise",
            score = 12,
            tests = 
            [
                Test {
                    name = "myDouble 2",                   
                    result = show $ myDouble 2,
                    expected = "4"
                },
                Test {
                    name = "myDouble 4",                  
                    result = show $ myDouble 4, 
                    expected = "8"
                },              
                Test {
                    name = "myDouble 0",                   
                    result = show $ myDouble 0,
                    expected = "0"
                },                
                Test {
                    name = "doubleEveryOther [1,2,3,4]",                   
                    result = show $ doubleEveryOther [1,2,3,4],
                    expected = "[1,4,3,8]"
                },
                Test {
                    name = "doubleEveryOther [1,2,3] ",                  
                    result = show $ doubleEveryOther [1,2,3], 
                    expected = "[1,4,3]"
                },              
                Test {
                    name = "doubleEveryOther []",                   
                    result = show $ doubleEveryOther [],
                    expected = "[]"
                },
                Test {
                    name = "mySquare 0",                   
                    result = show $ mySquare 0,
                    expected = "0"
                },
                Test {
                    name = "mySquare 1 ",                  
                    result = show $ mySquare 1, 
                    expected = "1"
                },              
                Test {
                    name = "mySquare (-5)",                   
                    result = show $ mySquare (-5),
                    expected = "25"
                },
                Test {
                    name = "sqSum []",                   
                    result = show $ sqSum [],
                    expected = "0"
                },
                Test {
                    name = "sqSum [1,2,3,4] ",                  
                    result = show $ sqSum [1,2,3,4], 
                    expected = "30"
                },              
                Test {
                    name = "sqSum [(-1), (-2), (-3), (-4)]",                   
                    result = show $ sqSum [(-1), (-2), (-3), (-4)],
                    expected = "30"
                },
                Test {
                    name = "sepConcat \", \" []",                   
                    result = show $ sepConcat ", " [],
                    expected = "\"\""
                },
                Test {
                    name = "sepConcat \", \" [\"foo\", \"bar\", \"baz\"]",                  
                    result = show $ sepConcat ", " ["foo", "bar", "baz"], 
                    expected = "\"foo, bar, baz\""
                },              
                Test {
                    name = "sepConcat \"#\" [\"a\",\"b\",\"c\",\"d\",\"e\"]",                   
                    result = show $ sepConcat "#" ["a","b","c","d","e"],
                    expected = "\"a#b#c#d#e\""
                }
            ]
        },
        Problem 
        {
            title = "Part C: Credit Card problem",
            description = "Using the above written functions, create a validate function to decide if a number is legal to use as credit card using Luhn algorithm",
            score = 18,
            tests = 
            [
                Test {
                    name = "validate 4723304884813",                  
                    result = show $ validate 4723304884813,
                    expected = "True"
                },
                Test {
                    name = "validate 4012888888881881",                   
                    result = show $ validate 4012888888881881, 
                    expected = "True"
                },              
                Test {
                    name = "validate 4012888888881882",                   
                    result = show $ validate 4012888888881882,
                    expected = "False"
                }

            ]
        },
        Problem 
        {
            title = "Part D: Sorts Algorithm",
            description = "You will create helper functions for merge Sort and then create mergeSort itself",
            score = 30,
            tests = 
            [
                Test {
                    name = "splitHalf [1,2,3,4,5]",                   
                    result = show $ splitHalf [1,2,3,4,5],
                    expected = "([1,2],[3,4,5])"
                },
                Test {
                    name = "splitHalf [1,2,3,4,5,6]",
                    result = show $ splitHalf [1,2,3,4,5,6], 
                    expected = "([1,2,3],[4,5,6])"
                },              
                Test {
                    name = "splitHalf [1]",               
                    result = show $ splitHalf [1],
                    expected = "([],[1])"
                },
                Test {
                    name = "mergeList [(\"dat\",1),(\"scott\",5)] [(\"dat2\",3),(\"scott\",4)]",                   
                    result = show $ mergeList [("dat",1),("scott",5)] [("dan",3),("scott",4)],
                    expected = "[(\"dat\",1),(\"dan\",3),(\"scott\",4),(\"scott\",5)]"
                },
                Test {
                    name = "mergeList [(\"danny\",5),(\"scott\",35)] [(\"dan\",3),(\"scott\",4)]",
                    result = show $ mergeList [("danny",5),("scott",35)] [("dan",3),("scott",4)], 
                    expected = "[(\"dan\",3),(\"scott\",4),(\"danny\",5),(\"scott\",35)]"
                },         
                Test {
                    name = "mergeSort [(\"dat\",1),(\"scott\",5),(\"Tim\",2)]",                   
                    result = show $ mergeSort [("dat",1),("scott",5),("Tim",2)],
                    expected = "[(\"dat\",1),(\"Tim\",2),(\"scott\",5)]"
                },
                Test {
                    name = "mergeSort [(\"dat\",1),(\"dan\",5),(\"scott\",4),(\"scottish\",3)]",
                    result = show $ mergeSort [("dat",1),("dan",5),("scott",4),("scottish",3)], 
                    expected = "[(\"dat\",1),(\"scottish\",3),(\"scott\",4),(\"dan\",5)]"

                }              

            ]                         
        },
        Problem 
        {
            title = "Part E: New Type",
            description = "You will create functions that work with integer that is bigger than Max int size",
            score = 30,
            tests = 
            [
                Test {
                    name = "clone 3 5",                   
                    result = show $ clone 3 5,
                    expected = "[3,3,3,3,3]"
                },
                Test {
                    name = "clone \"foo\" 2",
                    result = show $ clone "foo" 2, 
                    expected = "[\"foo\",\"foo\"]"
                },              
                Test {
                    name = "clone \"foo\" 0",               
                    result = show $ clone "foo" 0,
                    expected = "[]"
                },
                Test {
                    name = "padZero [9,9] [1,0,0,2]",                   
                    result = show $ padZero [9,9] [1,0,0,2],
                    expected = "([0,0,9,9],[1,0,0,2])"
                },
                Test {
                    name = "padZero [1,2,3] [1,2,3]",
                    result = show $  padZero [1,2,3] [1,2,3], 
                    expected = "([1,2,3],[1,2,3])"

                },
                Test {
                    name = "padZero [1,2,3,0,0] [1.2]",
                    result = show $  padZero [1,2,3] [1,2,3], 
                    expected = "([1,2,3],[1,2,3])"

                },                          
                Test {
                    name = "removeZero [0,0,0,1,0,0,2]",               
                    result = show $ removeZero [0,0,0,1,0,0,2],
                    expected = "[1,0,0,2]"
                },
                Test {
                    name = "removeZero [9,9]",                   
                    result = show $ removeZero [9,9],
                    expected = "[9,9]"
                },
                Test {
                    name = "removeZero [0,0,0,0]",
                    result = show $ removeZero [0,0,0,0], 
                    expected = "[]"
                },              
                Test {
                    name = "bigAdd [9,9] [1,0,0,2]",               
                    result = show $ bigAdd [9,9] [1,0,0,2],
                    expected = "[1,1,0,1]"
                },
                Test {
                    name = "bigAdd [9,9,9,9] [9,9,9]",                   
                    result = show $ bigAdd [9,9,9,9] [9,9,9],
                    expected = "[1,0,9,9,8]"
                },
                Test {
                    name = "mulByDigit 9 [9,9,9,9]",
                    result = show $ mulByDigit 9 [9,9,9,9], 
                    expected = "[8,9,9,9,1]"

                },              
                Test {
                    name = "mulByDigit 0 [9,9,9,9]",               
                    result = show $ mulByDigit 0 [9,9,9,9],
                    expected = "[]"
                },
                 Test {
                    name = " mulByDigit 1 [9,9,9,9]",               
                    result = show $  mulByDigit 1 [9,9,9,9],
                    expected = "[9,9,9,9]"
                },
                Test {
                    name = "bigMul [9,9,9,9] [9,9,9,9]",                   
                    result = show $ bigMul [9,9,9,9] [9,9,9,9],
                    expected = "[9,9,9,8,0,0,0,1]"
                },
                Test {
                    name = "bigMul [9,9,9,9,9] [9,9,9,9,9]",
                    result = show $ bigMul [9,9,9,9,9] [9,9,9,9,9], 
                    expected = "[9,9,9,9,8,0,0,0,0,1]"

                },              
                Test {
                    name = "bigMul [9,9,9,9,9] [9,9,9,9,9,0,0,0,0]",               
                    result = show $ bigMul [9,9,9,9,9] [9,9,9,9,9,0,0,0,0],
                    expected = "[9,9,9,9,8,0,0,0,0,1,0,0,0,0]"
                }

            ]
                         
        }      

    ]
