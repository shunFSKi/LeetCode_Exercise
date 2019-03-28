/*
 https://leetcode-cn.com/problems/roman-to-integer/
 ------------------------------------------------------------------------------
 Q: 罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。
    字符          数值
    I             1
    V             5
    X             10
    L             50
    C             100
    D             500
    M             1000
    例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
    通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
    I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
    X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
    C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
    给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。
 A: 先将罗马数字和阿拉伯数字的对应关系用hash存起来，然后通过从后往前遍历字符串，当前位值>上一位值就加，否则就减
 ------------------------------------------------------------------------------
 Date:2019-3-28 每日一刷💪
 Author:fengshun
 */

import UIKit

var str = "Roman to Integer"

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanDic = romanDict()
        let romanChars = [Character](Array(s).reversed())
        var res = 0
        
        for i in 0 ..< romanChars.count {
            guard let currentChar = romanDic[String(romanChars[i])] else {
                return res
            }
            if i > 0 && currentChar < romanDic[String(romanChars[i - 1])]! {
                res = res - currentChar
            } else {
                res = res + currentChar
            }
        }
        return res
    }
    
    private func romanDict() -> [String:Int] {
        var dict = [String:Int]()
        
        dict["I"] = 1
        dict["V"] = 5
        dict["X"] = 10
        dict["L"] = 50
        dict["C"] = 100
        dict["D"] = 500
        dict["M"] = 1000
        
        return dict
    }
}


Solution().romanToInt("LVIII")
Solution().romanToInt("MCMXCIV")
