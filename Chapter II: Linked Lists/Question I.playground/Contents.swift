/*Question: Write code to remove duplicates from an unsorted linked list.
            FOLLOW UP
            How would you solve this problem if a temporary buffer is not allowed? */

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
    
    func removeDuplicates()
    {
        if isEmpty()
        {
            print("No duplicates in empty LinkedList")
            return
        }
        
        var elementSet: Set<T> = Set<T>()
        
        var previousIterator: Node? = head
        var currentIterator: Node? = head?.next
        
        elementSet.insert((head?.data)!)
        
        while currentIterator != nil
        {
            if elementSet.contains((currentIterator?.data)!)
            {
                previousIterator?.next = currentIterator?.next
                currentIterator?.next = nil
                currentIterator = nil
                currentIterator = previousIterator?.next
            }
            else
            {
                elementSet.insert((currentIterator?.data)!)
                previousIterator = currentIterator
                currentIterator = currentIterator?.next
            }
        }
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
let stringList: LinkedList<String> = LinkedList()
stringList.insert(back: "TQPyH0vcI3", "BpxYoazqSE", "1oG0bPUlli", "x8bm9tAmyD", "u8DDZBYIgi")
stringList.insert(front: "mpO4l9vSYV", "dPCVrYzxMb", "1oG0bPUlli", "BpxYoazqSE", "1re4RKjgwA")
integerList.insert(front: 503, 108, 34, 666, 228)
integerList.insert(back: 228, 316, 108, 228, 933)

stringList.removeDuplicates()
integerList.removeDuplicates()

/* Before String Removal */
//1re4RKjgwA
//BpxYoazqSE
//1oG0bPUlli
//dPCVrYzxMb
//mpO4l9vSYV
//TQPyH0vcI3
//BpxYoazqSE
//1oG0bPUlli
//x8bm9tAmyD
//u8DDZBYIgi

/* After String Removal */
//1re4RKjgwA
//BpxYoazqSE
//1oG0bPUlli
//dPCVrYzxMb
//mpO4l9vSYV
//TQPyH0vcI3
//x8bm9tAmyD
//u8DDZBYIgi

/* Before Integer Removal */
//228
//666
//34
//108
//503
//228
//316
//108
//228
//933

/* After Integer Removal */
//228
//666
//34
//108
//503
//316
//933
