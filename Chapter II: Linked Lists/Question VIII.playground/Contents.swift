/* Question: 
 Given a circular linked list, implement an algorithm that returns the node at the
 beginning of the loop.
 DEFINITION
 Circular linked list: A (corrupt) linked list in which a node's next pointer points to an earlier node, so as to make a loop in the linked list.
 EXAMPLE
 Input: A -> B -> C -> D -> E -> C[thesameCasearlier]
 Output: C
 */

// NOT FINISHED

import UIKit

class ListNode<T: Comparable & Hashable>
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
    
    static func ><T: Comparable>(lhs: ListNode<T>, rhs: ListNode<T>)-> Bool
    {
        return lhs.data! > rhs.data!
    }
    
    static func <<T: Comparable>(lhs: ListNode<T>, rhs: ListNode<T>)-> Bool
    {
        return lhs.data! < rhs.data!
    }
}

extension ListNode: Hashable
{
    var hashValue: Int{
        return ObjectIdentifier(self).hashValue
    }
}

class LinkedList<T: Comparable & Hashable>
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
    
    static func +(lhs: inout LinkedList, rhs: inout LinkedList)-> LinkedList // O(N)
    {
        let finalList: LinkedList = LinkedList()
        var lhsIterator: Node? = lhs.head
        var rhsIterator: Node? = rhs.head
        
        while lhsIterator != nil
        {
            finalList.insert(back: (lhsIterator?.data)!)
            lhsIterator = lhsIterator?.next
        }
        
        while rhsIterator != nil
        {
            finalList.insert(back: (rhsIterator?.data)!)
            rhsIterator = rhsIterator?.next
        }
        
        return finalList
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
            
            print(currentData)
            
            tempIterator = tempIterator?.next
        }
    }
    
    private func isEmpty()-> Bool // O(1)
    {
        return head == nil ? true : false
    }
}


let test: LinkedList<String> = LinkedList()


test.insert(back: "A","B","C","D","E","C")