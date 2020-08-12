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


/*
 0.遍历两个节点
 1.进位
 2.两个临时变量，计算新表node点sum value
 3.头节点独立逻辑
 4.添加进位产生的新node
 5.返回新建node.next指向的表（不包含初始node）
 */
func addTwoNums(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var a: ListNode? = l1
    var b: ListNode? = l2
    
    var carry = 0
    let result = ListNode.init(0)
    var head = result
    
    // 遍历
    while a != nil || b != nil {
        
        let sum = (a?.val ?? 0) + (b?.val ?? 0) + carry
        carry = sum/10
        
        // 添加进位产生的新node
        head.next = ListNode.init(sum % 10)
        head = head.next!
        
        // 返回新建节点next指向的表
        a = a?.next
        b = b?.next
    }
    
    // 头节点独立
    if carry > 0 {
        head.next = ListNode.init(carry)
    }
    
    return result.next
}

addTwoNums(ListNode.init(342), ListNode.init(465))
