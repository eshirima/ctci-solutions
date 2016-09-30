// Question: Implement a function to check if a linked list is a palindrome.

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
    
    // This uses the array method
    func isPalindromeWithArray()-> Bool
    {
        var tempIterator: Node? = head
        var arrayOfElements: [T] = []
        
        while tempIterator != nil
        {
            arrayOfElements.append((tempIterator?.data)!)
            tempIterator = tempIterator?.next
        }
        
        var front: Int = 0, back: Int = arrayOfElements.count - 1
        
        while front <= back
        {
            if arrayOfElements[front] != arrayOfElements[back]
            {
                return false
            }
            
            front += 1; back -= 1
        }
        
        return true
    }
    
    func isPalindrome()-> Bool
    {
        var tempIterator: Node? = head
        let reversedList: LinkedList = LinkedList()
        
        while tempIterator != nil
        {
            reversedList.insert(front: (tempIterator?.data)!)
            
            tempIterator = tempIterator?.next
        }
        
        tempIterator = head
        
        var reverseTemp: Node? = reversedList.head
        
        while reverseTemp != nil
        {
            if !(reverseTemp?.data == tempIterator?.data)
            {
                return false
            }
            reverseTemp = reverseTemp?.next
            tempIterator = tempIterator?.next
        }
        
        return true
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

let test0: LinkedList<String> = LinkedList()
let test1: LinkedList<String> = LinkedList()
let test2: LinkedList<String> = LinkedList()
let test3: LinkedList<Int> = LinkedList()
let test4: LinkedList<Int> = LinkedList()
let test5: LinkedList<Int> = LinkedList()

test0.insert(front: "p","u","t","i","t","u","p")
test1.insert(front: "a","g","a","r","r","e","g","a","l","l","a","g","e","r")
test2.insert(back: "s","u","r","e","t","u","s","k","c","o","c","k","s","u","t","e","r","u","s")
test3.insert(back: 9,8,6,8,9)
test4.insert(back: 3,7,4,9,4,7,3)
test5.insert(front: 3,6,2,8,4,6,3)

print(test0.isPalindrome()) // True
print(test1.isPalindrome()) // False
print(test2.isPalindrome()) // True
print(test3.isPalindrome()) // True
print(test4.isPalindrome()) // True
print(test5.isPalindrome()) // False

print(test0.isPalindromeWithArray()) // True
print(test1.isPalindromeWithArray()) // False
print(test2.isPalindromeWithArray()) // True
print(test3.isPalindromeWithArray()) // True
print(test4.isPalindromeWithArray()) // True
print(test5.isPalindromeWithArray()) // False