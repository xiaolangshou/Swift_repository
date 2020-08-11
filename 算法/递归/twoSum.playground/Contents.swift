import UIKit

/*
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */
public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var carry = 0

func addTwoNums(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var v1 = 0
    var v2 = 0
    
    if l1 != nil {
        v1 = l1!.val
    }
    if l2 != nil {
        v2 = l2!.val
    }
    
    let temp = (v1 + v2 + carry) % 10
    carry = (v1 + v2 + carry) / 10
    
    let node = ListNode.init(temp)
    
    if l1 != nil || l2 != nil {
        if l1?.next != nil || l2?.next != nil {
            node.next = addTwoNums(l1!.next, l2!.next)
        }
    }
    
    return node
}

addTwoNums(ListNode.init(342), ListNode.init(465))
