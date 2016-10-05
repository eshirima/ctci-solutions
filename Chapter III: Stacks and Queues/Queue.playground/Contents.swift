// QUEUE IMPLEMENTATION

import UIKit

class ListNode<T: Equatable>
{
    var data: T?
    var next: ListNode?
    
    init()
    {
        data = nil
        next = nil
    }
    
    init(data: T)
    {
        self.data = data
        self.next = nil
    }
    
    static func ==<T: Comparable>(lhs: ListNode<T>, rhs: ListNode<T>)-> Bool
    {
        return lhs.data == rhs.data
    }
}

class Queue<T: Equatable>
{
    public typealias Node = ListNode<T>
    private var front: Node?, back: Node?
    
    init()
    {
        front = nil
        back = nil
    }
    
    init(queue: Queue)
    {
        if queue.isEmpty()
        {
            front = nil
            back = nil
            return
        }
        
        self.front = queue.front
        
        var topIterator: Node? = front, otherIterator: Node? = queue.front?.next
        
        while otherIterator?.next != nil
        {
            topIterator?.next = otherIterator
            
            otherIterator = otherIterator?.next
        }
        
        back = otherIterator
    }
    
    func peek()->T?
    {
        if isEmpty()
        {
            print("Can't peek an empty stack")
            return nil
        }
        
        guard let topData = front?.data else { return nil }
        
        return topData
    }
    
    private func enqueue(data: T) // O(1)
    {
        if isEmpty()
        {
            front = Node(data: data)
            back = front
        }
        else
        {
            back?.next = Node(data: data)
            back = back?.next
        }
    }
    
    func enqueue(elements: T...) // Worst: O(N) Best: O(1)
    {
        for element in elements
        {
            enqueue(data: element)
        }
    }
    
    func dequeue()
    {
        if isEmpty()
        {
            print("Can't remove from an empty queue")
            return
        }
        else
        {
            var tempHolder: Node? = front
            front = front?.next
            tempHolder = nil
        }
    }
    
    private func isEmpty()-> Bool // O(1)
    {
        return front == nil ? true : false
    }
    
    func printContents() // Worst: O(N) Best: O(1)
    {
        if isEmpty()
        {
            print("Cannot print an empty LinkedList")
            return
        }
        
        var tempIterator: Node? = front
        
        while tempIterator != nil
        {
            guard let currentData: T = tempIterator?.data else { return }
            
            print("\(currentData)")
            
            tempIterator = tempIterator?.next
        }
    }
}


let temp: Queue<Int> = Queue()

temp.enqueue(elements: 3,4,5,6,7,8,9,0,2,1,4,6,7)

temp.printContents()
print("*********************")

temp.dequeue()
temp.dequeue()
temp.dequeue()
temp.dequeue()
temp.dequeue()
temp.dequeue()
temp.dequeue()

temp.printContents()

