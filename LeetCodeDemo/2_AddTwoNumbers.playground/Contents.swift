/*
 https://leetcode-cn.com/problems/add-two-numbers/
 -------------------------------------------------------------------------
 Q: 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
    如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
    您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 A: 三种情况：两个链表位数相等；位数不相等；有进位；
    创建一个哑结点dummyHead，头结点插入到dummyHead后面，返回dummyHead.next
    初始化一个进位carrry = 0，p = l1头部，q = l2头部
    将对应位置的val和进位carry相加得出当前位的和sum
    sum > 10则进位carry > 0，留下sum余数在当前位
    当前节点向后进一位，继续下次循环直到到达尾节点
    进位carry > 0则在返回链表追加一个val为1的新节点
 
 遗留问题
 如果链表中的数字不是按逆序存储的呢？例如：(3→4→2)+(4→6→5)=8→0→7
 -------------------------------------------------------------------------
 Date:2019-3-22 每日一刷💪
 Author:fengshun
 */

import UIKit

var str = "Add Two Numbers"


//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, curr = dummyHead
        var carry = 0
        while(p != nil || q != nil) {
            let x = p?.val ?? 0
            let y = q?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if (p != nil) {
                p = p!.next
            }
            if (q != nil) {
                q = q!.next
            }
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        return dummyHead.next
    }
}

let n1 = ListNode(9)
let n2 = ListNode(5)
n1.next = n2
let n3 = ListNode(7)
n2.next = n3

let n4 = ListNode(4)
let n5 = ListNode(6)
n4.next = n5
let n6 = ListNode(4)
n5.next = n6

let solution = Solution();
let nr = solution.addTwoNumbers(n1, n4)


