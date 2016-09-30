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

class LinkedList<T: Equatable>
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
    
    func getHead()->T?
    {
        if isEmpty()
        {
            print("List is empty")
            return nil
        }
        else
        {
            guard let headData = head?.data else { return nil }
            return headData
        }
    }
    
    func getTail()->T?
    {
        if isEmpty()
        {
            print("List is empty")
            return nil
        }
        else
        {
            guard let tailData = tail?.data else { return nil }
            return tailData
        }
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
    
    func insert(back elements: T ...) // Worst: O(N) Best: O(1)
    {
        for element in elements
        {
            insertBack(data: element)
        }
    }
    
    func insert(front elements: T...) // Worst: O(N) Best: O(1)
    {
        for element in elements
        {
            insertFront(data: element)
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
    
    func find(element: T) // Worst: O(N) Best: O(1)
    {
        if isEmpty()
        {
            print("Can't find in an empty list")
            return
        }
        
        guard let first: T = head?.data else { return }
        guard let last: T = tail?.data else { return }
        
        if first == element
        {
            print("Element found")
            return
        }
        else if last == element
        {
            print("Element found")
            return
        }
        else
        {
            var tempIterator = head?.next
            
            while tempIterator != nil
            {
                guard let currentData = tempIterator?.data else { return }
                
                if currentData == element
                {
                    print("Element found")
                    return
                }
                
                tempIterator = tempIterator?.next
            }
            
            print("Element not found")
        }
    }
    
    func deleteFront() // O(1)
    {
        if isEmpty()
        {
            print("Can't delete from an empty list")
            return
        }
        else if head?.next == nil
        {
            head = nil
            tail = nil
        }
        else
        {
            var tempHolder: Node? = head
            head = head?.next
            tempHolder = nil
        }
    }
    
    func deleteBack() // Worst: O(N) Best:  O(1)
    {
        if isEmpty()
        {
            print("Can't delete from an empty list")
            return
        }
        else if head?.next == nil
        {
            head = nil
            tail = nil
            return
        }
        
        var tempIterator: Node? = head
        
        while tempIterator?.next?.next != nil
        {
            tempIterator = tempIterator?.next
        }
        
        tail = nil
        tempIterator?.next = nil
        tail = tempIterator
    }
    
    private func isEmpty()-> Bool // O(1)
    {
        return head == nil ? true : false
    }
}