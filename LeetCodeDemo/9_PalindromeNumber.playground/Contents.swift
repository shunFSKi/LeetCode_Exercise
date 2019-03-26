/*
 https://leetcode-cn.com/problems/palindrome-number/
 ----------------------------------------------------------------------------------
 Q: 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
    示例 1:
    输入: 121
    输出: true
    示例 2:
    输入: -121
    输出: false
    解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 
 A: 思路就是从两端往中间判断是否相等。
    首先，回文数不能是负数，去除<0的情况
    得到当前x的位数
    分别得到最左边和最右边的数进行判等，!=就是false
    相等则去除两端数字，向中间缩进，位数去除两位，继续下次判断。直至所有数遍历完成
 ----------------------------------------------------------------------------------
 Date:2019-3-25 每日一刷💪
 Author:fengshun
 */

import UIKit

var str = "Palindrome Number"

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        
        var divider = 1
        while divider <= x / 10 {
            divider = divider * 10
        }
        
        var target = x
        while target > 0 {
            let left = target / divider
            let right = target % 10
            
            if left != right {
                return false
            }
            
            target = (target % divider) / 10
            divider = divider / 100
        }
        
        return true
    }
}

Solution().isPalindrome(123321)
Solution().isPalindrome(12345678)
