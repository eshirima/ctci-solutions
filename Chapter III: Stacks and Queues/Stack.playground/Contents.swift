//: STACK IMPLEMENTATION

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

class Stack<T: Equatable>
{
    public typealias Node = ListNode<T>
    private var top: Node?
    
    init() // O(1)
    {
        top = nil
    }
    
    init(stack: Stack) // O(N)
    {
        if stack.isEmpty()
        {
            top = nil
            return
        }
        
        self.top = stack.top
        
        var topIterator: Node? = top, otherIterator: Node? = stack.top?.next
        
        while otherIterator != nil
        {
            topIterator?.next = otherIterator
            
            otherIterator = otherIterator?.next
        }
    }
    
    func peek()->T? // O(1)
    {
        if isEmpty()
        {
            print("Can't peek an empty stack")
            return nil
        }
        
        guard let topData = top?.data else { return nil }
        
        return topData
    }
    
    private func push(data: T) // O(1)
    {
        if isEmpty()
        {
            top = Node(data: data)
        }
        else
        {
            let tempNode: Node? = Node(data: data)
            
            tempNode?.next = top
            
            top = tempNode
        }
    }
    
    func push(elements: T...) // Worst: O(N) Best: O(1)
    {
        for element in elements
        {
            push(data: element)
        }
    }
    
    func pop() -> T? // O(1)
    {
        if isEmpty()
        {
            print("Can't delete from an empty stack")
            return nil
        }
        
        let tempHolder: Node? = top
        
        top = top?.next
        
        return tempHolder?.data
    }
    
    private func isEmpty()-> Bool // O(1)
    {
        return top == nil ? true : false
    }
    
    func printContents() // Worst: O(N) Best: O(1)
    {
        if isEmpty()
        {
            print("Cannot print an empty LinkedList")
            return
        }
        
        var tempIterator: Node? = top
        
        while tempIterator != nil
        {
            guard let currentData: T = tempIterator?.data else { return }
            
            print("\(currentData)")
            
            tempIterator = tempIterator?.next
        }
    }
}