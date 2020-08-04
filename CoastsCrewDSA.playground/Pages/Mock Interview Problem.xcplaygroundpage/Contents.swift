import Foundation
/*

Remove adjacent duplicates

"bookkeeper" -> "bper"
"abbaca" -> "ca"

*/

/*
Clarifying Questions:
1. Can a string be empty? // Yes
2. In the event that no adjacent duplicates exist, do you return the original string? // yes

Sample input / output:
1. input: "bookkeeper", output: "bper"
2. input: "abccbaca", output: "ca"
3. input: "aab", output: "b"
4. input: "roar", output: "roar"

Approach:
1. Guard against a string that has a count of 1 or less. Simply return the string.
2. Make the string into an array.
3. Make a variable to keep track of the previous character encountered.
4. Loop through the array, checking the next index.
5. Remove duplicates if arr[index - 1] == arr[index].
6. Join the array, or make into a String.
7. Return the joined Array/ String.
*/

class Stack<T> {
    
    var stack:[T] = []
    
    init() {
        
    }
    
    var peek: T? {
        return stack.last
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    func push(_ element: T) {
        stack.append(element)
    }
    
    @discardableResult
    func pop() -> T? {
        return stack.popLast()
    }
}

func removeAdjcentDupes(_ str: String) -> String {
  guard str.count > 1 else { return str }
  
    let stack = Stack<String>()
    var resultString = ""
    
    for char in str {
        if let stackChar = stack.peek, stackChar == String(char) {
            stack.pop()
        } else {
            stack.push(String(char))
        }
    }
    
    while let poppedChar = stack.pop() {
        resultString = poppedChar + resultString
    }
    
  return resultString
}

print(removeAdjcentDupes("bookkeeper"))
print(removeAdjcentDupes("abccbaca"))
