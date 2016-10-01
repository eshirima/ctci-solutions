// Question: Given two (singly) linked lists, determine if the two lists intersect. Return the inter­ secting node. Note that the intersection is de ned based on reference, not value.That is, if the kth node of the  rst linked list is the exact same node (by reference) as the jth node of the second linked list, then they are intersecting.

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
    
    // Two nodes are equal if they're pointing to the same memory location
    static func ==<T: Equatable>(lhs: ListNode<T>, rhs: ListNode<T>)-> Bool
    {
        let lhsMemoryLocation = unsafeBitCast(lhs, to: Int.self)
        let rhsMemoryLocation = unsafeBitCast(rhs, to: Int.self)
        
        return lhsMemoryLocation == rhsMemoryLocation
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
    private var length : Int = 0
    
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
    
    private func insertFront(node: ListNode<T>) // O(1)
    {
        if isEmpty()
        {
            head = node
            tail = head
            length += 1
        }
        else
        {
            let tempNode: Node? = node
            tempNode?.next = head
            head = tempNode
            length += 1
        }
    }
    
    private func insertBack(node: ListNode<T>) // O(1)
    {
        if isEmpty()
        {
            head = node
            tail = head
            length += 1
        }
        else
        {
            tail?.next = node
            tail = tail?.next
            length += 1
        }
    }
    
    func insert(back elements: ListNode<T> ...) // Best: O(1) Worst: O(N)
    {
        for element in elements
        {
            insertBack(node: element)
        }
    }
    
    func insert(front elements: ListNode<T> ...) // Best: O(1) Worst: O(N)
    {
        for element in elements
        {
            insertFront(node: element)
        }
    }
    
    func findIntersection(linkedList: LinkedList)->(isFound:Bool, location:Node?) // O(N+M)
    {
        if self.isEmpty() || linkedList.isEmpty()
        {
            print("No intersection with an empty list")
            return (false, nil)
        }
        
        var lengthDifference: Int = 0
        var tempIterator: Node? = head
        var linkIterator: Node? = linkedList.head
        
        if self.length > linkedList.length
        {
            lengthDifference = self.length - linkedList.length
            
            while lengthDifference != 0
            {
                tempIterator = tempIterator?.next
                lengthDifference -= 1
            }
        }
        else
        {
            lengthDifference = linkedList.length - self.length
            
            while lengthDifference != 0
            {
                linkIterator = linkIterator?.next
                lengthDifference -= 1
            }
        }
        
        while tempIterator != nil && linkIterator != nil
        {
            if tempIterator == linkIterator
            {
                return (true, tempIterator)
            }
            
            tempIterator = tempIterator?.next
            linkIterator = linkIterator?.next
        }
        
        return (false, nil)
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

let test0: LinkedList<Int> = LinkedList()
let test1: LinkedList<Int> = LinkedList()
let test2: LinkedList<Int> = LinkedList()
let test3: LinkedList<Int> = LinkedList()

var node0: ListNode<Int> = ListNode(data: 32)
var node1: ListNode<Int> = ListNode(data: 93)
var node2: ListNode<Int> = ListNode(data: 64)
var node3: ListNode<Int> = ListNode(data: 25)
var node4: ListNode<Int> = ListNode(data: 28)
var node5: ListNode<Int> = ListNode(data: 21)
var node6: ListNode<Int> = ListNode(data: 23)
var node7: ListNode<Int> = ListNode(data: 82)
var node8: ListNode<Int> = ListNode(data: 72)
var node9: ListNode<Int> = ListNode(data: 148)
var node10: ListNode<Int> = ListNode(data: 90)

test0.insert(back: node0,node1,node2,node3,node4)
test1.insert(back: node7,node3,node5)

let response = test0.findIntersection(linkedList: test1)

if response.isFound // true
{
    if let location = response.location
    {
        print("Intersection at node with value: \(location.data!)")
    }
}
else
{
    print(response)
}

test2.insert(back: node0,node2,node3,node7,node8,node6)
test3.insert(back: node4,node5,node7,node8,node6)

let response2 = test3.findIntersection(linkedList: test2)

if response2.isFound // true
{
    if let location = response2.location
    {
        print("Intersection at node with value: \(location.data!)")
    }
}
else
{
    print(response2)
}