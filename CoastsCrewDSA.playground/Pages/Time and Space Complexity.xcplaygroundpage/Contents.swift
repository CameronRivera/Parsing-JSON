// Time and Space Complexity
import Foundation

func som(_ n: Int) -> Int {
    var partialSum = 0
    
    for i in 0..<n{
        partialSum += i
    }
    
    return partialSum
} // O(n) -> Linear
// We give this function n input, it takes n seconds.
// We give this same function 2n input, it takes 2n seconds.

func sum(_ x: Int, _ y: Int, _ z: Int) -> Int {
  let r = x + y + z
  return r
} // O(1)

// Where n is the count of the array.
func some(_ a: [Int], _ n: Int) -> Int {
  var r = 0
    
  for i in 0..<n{
    r += a[i]
  }
    
  return r
}

func matrixAdd(_ a: [Int], _ b: [Int], _ c: inout [Int], _ n: Int, _ m: Int){

    var j = n + m // O(1)
    
    if j > n {
        j = j * 2 // O(1)
    } else {
        j = j * 4 // O(1)
        j = j * 8 // O(1)
    }

    // This is also O(1) time complexity
} // O(n)

// Where n is the size of arrays a and b, and a and b are the same size.
func matrixMultiply(_ a: [Int], _ b: [Int], _ c: inout [[Int]], _ n: Int) {
  for i in 0..<n {
    for j in 0..<n {
      c[i][j] = a[i] + b[j]
    }
  }
   // b.removeFirst() O(N)
   // b.popLast() O(1)
    
} // O(n^2)

// [9,234,6,13,843,2,96,34]
// [234,6,13,843,2,96,34]
// [9] [234] [6] [13] [843] [2] [96] [34]
// [9,234], [6,13], [2,843] [34, 96]
// [6,9,13,234], [2,34,96,843]

// In order for some runtime to be O(log n), it must break the original input into fractional pieces.
// The space complexity would be O(n) because of the input array.
func binarySearch(_ arr: [Int]) -> Int {

    return 5
}
