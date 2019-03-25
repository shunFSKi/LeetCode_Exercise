/*
 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 ----------------------------------------------------------------------------
 Q: 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
    示例 1:
    输入: "abcabcbb"
    输出: 3
    解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 A: 思路是利用集合存储不同的字串，从0..char.cout遍历，有重复的清除掉重新计数。
    初始化最大长度maxLength = 0
    将字串转为数组
    从0开始遍历字串index
    从每个index位置向后遍历，获取当前index之后的每个字串
    如果不存在则存入集合中，这里只需要长度，所以不需要顺序，只要保证不同即可。存在则跳出当前循环，从index+1重新开始计算length
    不存在则将最大长度maxLength更新，当前长度currentLength+1，继续下次循环
    遍历到最后返回maxLength
 -----------------------------------------------------------------------------
 Date:2019-3-25 每日一刷💪
 Author:fengshun
 */

import UIKit

var str = "lengthOfLongestSubstring"

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        
        let chars = Array(s)
        guard chars.count > 1 else {
            return chars.count
        }
        
        for i in 0 ..< chars.count - 1 {
            var charSet = Set<Character>()
            var currentLength = 1
            while currentLength <= chars.count - i {
                let char = chars[i + currentLength - 1]
                if charSet.contains(char) {
                    break
                }
                charSet.insert(char)
                maxLength = max(maxLength, currentLength)
                currentLength += 1
            }
            
        }
        
        return maxLength
    }
}

Solution().lengthOfLongestSubstring("aaabcdrttqwer")
Solution().lengthOfLongestSubstring("")
