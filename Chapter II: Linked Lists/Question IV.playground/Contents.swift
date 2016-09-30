/* Question: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
 EXAMPLE
 Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1[partition=5] 
 Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8
 */

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
    
    static func +(lhs: LinkedList, rhs: LinkedList)-> LinkedList
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
    
    func partition(around element: T)-> LinkedList
    {
        if isEmpty()
        {
            print("Can't partion an empty LinkedList")
            return LinkedList()
        }
        var tempIterator: Node? = head
        
        let lessThanList: LinkedList = LinkedList()
        let largerThanList: LinkedList = LinkedList()
        
        while tempIterator != nil
        {
            if (tempIterator?.data)! < element
            {
                lessThanList.insert(back: (tempIterator?.data)!)
            }
            else
            {
                largerThanList.insert(back: (tempIterator?.data)!)
            }
            
            tempIterator = tempIterator?.next
        }
        
        return lessThanList + largerThanList
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

var example: LinkedList<Int> = LinkedList()
example.insert(back: 3,5,8,5,10,2,1)


example = example.partition(around: 5)
example.printContents() // 3,2,1,5,8,5,10


var integerList: LinkedList<Int> = LinkedList()
integerList.insert(back: 6378,5490,5637,3278,2937)
integerList.insert(front: 702,7145,8616,5423,751)

//751,5423,8616,7145,702,6378,5490,5637,3278,2937

integerList = integerList.partition(around: 3500)

integerList.printContents() //751,702,3278,2937,5423,8616,7145,6378,5490,5637