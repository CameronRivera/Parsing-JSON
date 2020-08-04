import Foundation

/*
 Stacks
 
 A stack is a FILO data structure. This means that it operates in such a way that the first element placed in a stack is the last element to be retrieved from the stack.
 
 A stack has the following two methods:
 - push
    - Places an item on top of the stack.
 - pop
    - Removes an item from the top of the stack.
 
 Some implementations of a stack have the following methods / variables in addition to the two listed above:
 - peek
    - Returns, but does not remove, the item at the top of the stack
 - isEmpty
    - Returns true if the stack is empty, and false if it is not
 - count
    - Returns the number of items on the stack.
 */

// Implementation
struct Stack<T> {
    private var stack: [T]
    
    init(_ arr: [T] = []){
        self.stack = arr
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating public func push(_ element: T) {
        stack.append(element)
    }
    
    @discardableResult
    mutating public func pop() -> T? {
        return stack.popLast()
    }
    
    public func peek() -> T? {
        return stack.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        
        guard !isEmpty else { return "Stack is empty." }
        
        return stack.map{ "\($0)" }.reversed().joined(separator: "\n") + " ← Bottom"
    }
}


/*
 Queues
 
 Queues are FIFO data structures. This means the first item placed into the queue will be the first item to leaves the queue.
 
 A Queue has the following two methods:
 - Enqueue
    - Places an item into the queue
 - Dequeue
    - Removes an item from the queue
 
 Depending upon the implementation, you may see the following methods / variables as well:
 - front / peek / first...
    - Returns, but does not remove the first item in the queue.
 - isEmpty
    - Returns true if there are no items in the queue and false if there are.
 - count
    - Returns the number of items in the queue.
 
 Unlike stacks, there are a number of ways to implement a queue.
 - Array
 - Linked List
 - Stacks
 */

//Implementation using an array
class Queue<T> {
    private var queue: [T]
    
    init(_ arr: [T] = []){
        self.queue = arr
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public var front: T? {
        return queue.first
    }
    
    public func enqueue(_ element: T) {
        queue.append(element)
    }
    
    @discardableResult
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return queue.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    
    public var description: String {
        return queue.map{ "\($0)"}.joined(separator: " ")
    }
    
}

let newQueue = Queue<Int>([1,2,3,4,5])
//print(newQueue)


// Implement a Queue using a Stack

class StackQueue<T> {
    private var leftStack = Stack<T>()
    private var rightStack = Stack<T>()
    
    init(){}
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var front: T? {
        return leftStack.peek()
    }
    
    public func enqueue(_ element: T) {
        rightStack.push(element)
    }
    
    public func dequeue() -> T? {
        guard !leftStack.isEmpty || !rightStack.isEmpty else { return nil }
        
        if leftStack.isEmpty {
            while let poppedItem = rightStack.pop() {
                leftStack.push(poppedItem)
            }
        }
        return leftStack.pop()
    }
}

extension StackQueue: CustomStringConvertible {

    public var description: String {
        guard !isEmpty else { return "Queue is empty."}
        var leftCopy = leftStack
        var rightCopy = rightStack
        var returnArr: [T] = []
        
        while let poppedElement = rightCopy.pop() {
            leftCopy.push(poppedElement)
        }
        
        while let poppedElement = leftCopy.pop(){
            returnArr.append(poppedElement)
        }
        
        return returnArr.map{ "\($0)"}.joined(separator: " ")
    }

}

let newStackQueue = StackQueue<Int>()
newStackQueue.enqueue(5)
newStackQueue.enqueue(4)
newStackQueue.enqueue(3)
newStackQueue.enqueue(2)
newStackQueue.enqueue(1)
newStackQueue.dequeue()
print(newStackQueue)

