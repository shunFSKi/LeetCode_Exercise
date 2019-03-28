/*
 https://leetcode-cn.com/problems/reverse-integer/solution/
 ----------------------------------------------------------------------------------
 Q: 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
    注意:
    假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 
 A: 这个就是通过取余的方式拿到每位数字再组合起来，唯一要注意的就是值的范围[2147483647, -2147483648]，也可以加上最后一位7和-8的判断条件
 ----------------------------------------------------------------------------------
 Date:  2019-3-28 每日一刷💪
 Author: fengshun
 */


import UIKit

var str = "Reverse Integer"

class Solution {
    func reverse(_ x: Int) -> Int {
        let max = Int(Int32.max)
        let min = Int(Int32.min)
        
        var val = x
        var res = 0
        
        while val != 0 {
            if res > max / 10 || res < min / 10 {
                return 0
            }
            
            res = res * 10 + val % 10
            val = val / 10
        }
        return res
    }
}


Solution().reverse(1234567)
Solution().reverse(-3456789)
Solution().reverse(2147483641)
Solution().reverse(-95678987654987654)
