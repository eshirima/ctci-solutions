import UIKit

class ListNode<T: Comparable>
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

class LinkedList<T: Comparable>
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
    
    func insert(front data: T) // O(1)
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
    
    func insert(back data: T) // O(1)
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

let sample: LinkedList<Int> = LinkedList()
sample.insert(back: 3)
sample.insert(back: 5)
sample.insert(back: 10)
sample.insert(back: 78)
sample.printContents()

sample.deleteBack()
sample.printContents()

//sample.deleteBack()
//sample.printContents()

//let temp: LinkedList = LinkedList(linkedList: sample)

//sample.insertFront(data: 11)
//sample.insertFront(data: 45)
//sample.insertFront(data: 21)
//sample.printContents()
//print("Sample Head: \(sample.getHead())")
//print("Sample Tail: \(sample.getTail())")
//print("Temp Head: \(temp.getHead())")
//print("Temp Tail: \(temp.getTail())")

//sample.printContents()
//temp.printContents()

//let test: LinkedList<String> = LinkedList()
//test.insert(back: "awesome")

//temp.printContents()

//sample.find(element: 45)
//sample.find(element: 100)
