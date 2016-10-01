// Question: Implement an algorithm to find the kth to last element of a singly linked list.

import UIKit

class ListNode<T: Equatable & Hashable>
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
    
    static func ==<T: Equatable>(lhs: ListNode<T>, rhs: ListNode<T>)-> Bool
    {
        return lhs.data == rhs.data
    }
}

extension ListNode: Hashable
{
    var hashValue: Int{
        return ObjectIdentifier(self).hashValue
    }
}

class LinkedList<T: Equatable & Hashable>
{
    public typealias Node = ListNode<T>
    private var head: Node?, tail: Node?
    private var length: Int = 0
    
    init()
    {
        head = nil
        tail = nil
        length = 0
    }
    
    init(linkedList: LinkedList)
    {
        if linkedList.isEmpty()
        {
            head = nil
            tail = nil
            length = 0
            return
        }
        
        self.head = linkedList.head
        length += 1
        
        var headIterator: Node? = head, otherIterator: Node? = linkedList.head?.next
        
        while otherIterator?.next != nil
        {
            headIterator?.next = otherIterator
            
            otherIterator = otherIterator?.next
            
            length += 1
        }
        
        self.tail = otherIterator
        
        length += 1
    }
    
    private func insertFront(data: T) // O(1)
    {
        if isEmpty()
        {
            head = Node(data: data)
            tail = head
            
            length += 1
        }
        else
        {
            let tempNode: Node? = Node(data: data)
            
            tempNode?.next = head
            
            head = tempNode
            
            length += 1
        }
    }
    
    private func insertBack(data: T) // O(1)
    {
        if isEmpty()
        {
            head = Node(data: data)
            tail = head
            
            length += 1
        }
        else
        {
            tail?.next = Node(data: data)
            tail = tail?.next
            
            length += 1
        }
    }
    
    func insert(back elements: T ...) // Best: O(1) Worst: O(N)
    {
        for element in elements
        {
            insertBack(data: element)
        }
    }
    
    func insert(front elements: T ...) // Best: O(1) Worst: O(N)
    {
        for element in elements
        {
            insertFront(data: element)
        }
    }
    
    func findElement(fromLastToPosition position: Int)-> (isFound:Bool, value:T?) // Best: O(1) Worst: O(N)
    {
        if position > length
        {
            print("List too short")
            return (false, nil)
        }
        else if position <= 0
        {
            return (false, nil)
        }
        
        var tempIterator: Node? = head
        var elementLocation: Int = length - position
        
        while elementLocation > 0
        {
            tempIterator = tempIterator?.next
            elementLocation -= 1
        }
        
        return (true, tempIterator?.data)
    }
    
    func printContents() // Worst: O(N) Best: O(1)
    {
        if isEmpty()
        {
            print("Cannot print an empty LinkedList")
            return
        }
        
        var tempIterator: Node? = head
        
        while tempIterator != nil
        {
            guard let currentData: T = tempIterator?.data else { return }
            
            print("\(currentData)")
            
            tempIterator = tempIterator?.next
        }
    }
    
    private func isEmpty()-> Bool // O(1)
    {
        return head == nil ? true : false
    }
}

let temp: LinkedList<Int> = LinkedList()

temp.insert(back: 1,2,3,4,5,6,7)

print(temp.findElement(fromLastToPosition: 2)) // 6