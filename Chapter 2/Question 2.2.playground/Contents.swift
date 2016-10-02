//: Playground - noun: a place where people can play

import UIKit

/******************************************************************************************/
///////////////////////// Start LinkedList Implementation //////////////////////////////////
/******************************************************************************************/
// Source: Raywenderlich -- https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List
public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?

    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>

    fileprivate var head: Node?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node? {
        return head
    }

    public var last: Node? {
        if var node = head {
            while case let next? = node.next {
                node = next
            }
            return node
        } else {
            return nil
        }
    }

    public var count: Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                node = next
                c += 1
            }
            return c
        } else {
            return 0
        }
    }

    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}
/******************************************************************************************/
///////////////////////// End LinkedList Implementation ////////////////////////////////////
/******************************************************************************************/

//Return Kth to Last: Implement an algorithm to  nd the kth to last element of a singly linked list.
//Hints:#8, #25, #41, #67, #126

func kThElement( list: LinkedList<String>, k: Int ) -> LinkedListNode<String> {
    var current = list.head, final: LinkedListNode<String> = LinkedListNode(value: "nil") // LinkedListNode<String>
    if ( (list.head == nil) || (k < 1) ) {
        return final // return nil
    }


    for _ in 1..<(list.count - k) {
        // Loop through until reaching the k - 1 element
        if (current != nil) {
            current = current?.next
        } else {
            // return nil -- unable to reach element at k - 1
            return final
        }
    }

    // Return and assign the next element (kth element)
    if current?.next != nil {
        final = current!
        return final
    } else {
        return final // Should be un-reachable
    }
}

// Test Case:
let list = LinkedList<String>()
list.append(value: "Hello")
list.append(value: "World")
list.append(value: "This")
list.append(value: "is")
list.append(value: "Test")
list.append(value: "List")


print(kThElement(list: list, k: 5).value)
