import Foundation

/*
 Problem: Sum of something or another
 
 Given a non-negative integer num, return the number of steps to reduce it to zero. If the current number is even, you have to divide it by 2, otherwise, you have to subtract 1 from it.
 */

/*
 Clarifying Questions:
 1. How am I reducing this to zero? // Divide by 2 until the quotient is 0.
 2. Does subtracting 1 from a odd number count as a step? // Yes
 3. Is there a limit on how big it can be? // For all intents and purposes...no
 4. Can the number be less than 0? // No
 5. Can the number be 0? // Yes
 
 Sample input / output:
 1. input: 7, output: 5
 2. input: 10, output: 5
 3. input: 0, output: 0
 
 Approach:
 1. Guard against 0. If I get 0, I will immediately return 0.
 2. Create a variable to track of the number of steps.
 3. Create a second variable to keep track of the reducing integer.
 4. Begin a loop. Set the condition to continue for as long as the second variable is greater than 0.
 5. Check if the interger is odd. If it is odd, subtract one, increment the step counter, and continue to loop.
 6. Check if the interger is even. If it is even, divide by two, increment the step counter, and continue the loop.
 7. Return step counter.
 */

func numOfSteps(_ int: Int) -> Int {
    guard int > 0 else { return 0 }
    
    var reducingNumber = int
    var steps = 0
    
    while reducingNumber > 0 {
        if reducingNumber % 2 == 1 {
            reducingNumber -= 1
            steps += 1
        } else {
            reducingNumber = reducingNumber / 2
            steps += 1
        }
    }
    
    return steps
}

print(numOfSteps(7))
print(numOfSteps(10))
print(numOfSteps(0))

func recursiveNumOfSteps(_ int: Int) -> Int {
    guard int > 0 else { return 0 }
    
    if int % 2 == 0 {
        return recursiveNumOfSteps(int / 2) + 1
    } else {
        return recursiveNumOfSteps(int - 1) + 1
    }
    
}

print(recursiveNumOfSteps(7))
print(recursiveNumOfSteps(10))
print(recursiveNumOfSteps(0))
