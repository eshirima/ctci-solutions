// Question: Implement an algorithm to delete a node in the middle (i.e., any node but the  rst and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.

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
    
    init()
    {
        head = nil
        tail = nil
    }
    
    init(linkedList: LinkedList)
    {
        if linkedList.isEmpty()
        {
            head = nil
            tail = nil
            return
        }
        
        self.head = linkedList.head
        
        var headIterator: Node? = head, otherIterator: Node? = linkedList.head?.next
        
        while otherIterator?.next != nil
        {
            headIterator?.next = otherIterator
            
            otherIterator = otherIterator?.next
        }
        
        self.tail = otherIterator
    }
    
    private func insertFront(data: T) // O(1)
    {
        if isEmpty()
        {
            head = Node(data: data)
            tail = head
        }
        else
        {
            let tempNode: Node? = Node(data: data)
            
            tempNode?.next = head
            
            head = tempNode
        }
    }
    
    private func insertBack(data: T) // O(1)
    {
        if isEmpty()
        {
            head = Node(data: data)
            tail = head
        }
        else
        {
            tail?.next = Node(data: data)
            tail = tail?.next
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
    
    func delete(middleElement element: T) // O(N)
    {
        if isEmpty()
        {
            print("Can't delete from an empty list")
            return
        }
        else if head?.data == element
        {
            print("Doesn't delete from the head")
            return
        }
        else if tail?.data == element
        {
            print("Doesn't delete from the back")
            return
        }
        
        var previousIterator: Node? = head
        var currentIterator: Node? = head?.next
        
        while currentIterator != nil
        {
            if currentIterator?.data == element
            {
                previousIterator?.next = currentIterator?.next
                currentIterator?.next = nil
                currentIterator = nil
                currentIterator = previousIterator?.next
                break
            }
            
            previousIterator = currentIterator
            currentIterator = currentIterator?.next
        }
        print("Element not found")
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

let integerList: LinkedList<Int> = LinkedList()

integerList.insert(back: 2,98,54,23,21,128,789)
integerList.delete(middleElement: 2) // Doesn't delete from the head
integerList.delete(middleElement: 100) // Element not found
integerList.delete(middleElement: 789) // Doesn't delete from the back
integerList.delete(middleElement: 21) // 2,98,54,23,128,789