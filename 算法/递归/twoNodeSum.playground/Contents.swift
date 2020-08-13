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
1.遍历两个表node

2.计算新表node点sum value

3.由于第一个节点不需要计算carry值，导致逻辑不一致，故先默认创建一个初始node

4.最后添加进位产生的新node

5.返回新建node.next指向的表（不包含初始node）*/

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result: ListNode = ListNode(0) // 初始节点(无用节点)
        
        var p: ListNode? = l1
        var q: ListNode? = l2
        var head = result
        
        var carry = 0
        while (p != nil)||(q != nil) {
            
            let sum = (p?.val ?? 0) + (q?.val ?? 0) + carry
            
            carry = sum / 10
            head.next = ListNode(sum%10)
            head = head.next!
            p = p?.next
            q = q?.next
        }
        
        if carry > 0 {
            head.next = ListNode(carry)
        }
        
        return result.next
    }

addTwoNumbers(ListNode.init(342), ListNode.init(465))
