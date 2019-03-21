/*
 https://leetcode-cn.com/problems/two-sum/
 -----------------------------------------------------------------------
 Q:给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 
 A:简单方法是两个for循环遍历，查找出符合条件的两个数，时间复杂度O(n^2)，看了答案，利用一个哈希表存储下标和值，如果哈希表内存在当前符合条件的值就返回，否则存入哈希表内继续下次循环。
 -----------------------------------------------------------------------
 Date:2019-3-21 每日一刷💪
 Author:fengshun
 */

import UIKit

var str = "two sum"

class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]()
        for (i, num) in nums.enumerated() {
            if let index = dic[target - num] {
                return [i, index]
            }
            dic[num] = i
        }
        return [-1, -1]
    }
}

let twoSum = TwoSum()
let arr = twoSum.twoSum([1, 2, 4, 3, 5], 9)

