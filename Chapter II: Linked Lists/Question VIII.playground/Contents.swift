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
    
    private func insertFront(node: ListNode<T>) // O(1)
    {
        if isEmpty()
        {
            head = node
            tail = head
        }
        else
        {
            let tempNode: Node? = node
            tempNode?.next = head
            head = tempNode
        }
    }
    
    private func insertBack(node: ListNode<T>) // O(1)
    {
        if isEmpty()
        {
            head = node
            tail = head
        }
        else
        {
            tail?.next = node
            tail = tail?.next
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
    
    func findLoop()->(isFound:Bool, location:Node?)
    {
        var tempIterator: Node? = head
        var nodeSet: Set<Int> = Set<Int>()
        
        while tempIterator != nil
        {
            let nodeMemoryLocation = unsafeBitCast(tempIterator, to: Int.self)
            
            if nodeSet.contains(nodeMemoryLocation)
            {
                return (true, tempIterator)
            }
            nodeSet.insert(nodeMemoryLocation)
            tempIterator = tempIterator?.next
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

let temp0: LinkedList<Int> = LinkedList()
let temp1: LinkedList<Int> = LinkedList()

let node0: ListNode<Int> = ListNode(data: 5)
let node1: ListNode<Int> = ListNode(data: 13)
let node2: ListNode<Int> = ListNode(data: 78)
let node3: ListNode<Int> = ListNode(data: 50)
let node4: ListNode<Int> = ListNode(data: 12)
let node5: ListNode<Int> = ListNode(data: 5)
let node6: ListNode<Int> = ListNode(data: 344)
let node7: ListNode<Int> = ListNode(data: 59)
let node8: ListNode<Int> = ListNode(data: 0)

temp0.insert(back: node0,node1,node3,node4,node5,node6,node4)
temp1.insert(back: node0,node6,node2,node5,node7,node6)

let response0 = temp0.findLoop()

if response0.isFound
{
    if let location = response0.location
    {
        print("Loop starts at node with value: \(location.data!)")
    }
}
else
{
    print(response0)
}

let response1 = temp1.findLoop()

if response1.isFound
{
    if let location = response1.location
    {
        print("Loop starts at node with value: \(location.data!)")
    }
}
else
{
    print(response1)
}



