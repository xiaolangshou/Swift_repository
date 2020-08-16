import UIKit

// 无重复字符最长子串 (双指针)
/*
 1.数组保存所有子串
 2.左指针（初始为0，当右指针遇到重复字符时，右移到该位置）
 3.右指针（初始为1，当右指针遇到重复字符时，右移到左指针后一位置）
 4.临时字符串
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    if s.count == 1 { return 1 }
    
    var resultArr = [Int]()
    var l = 0
    var r = 0
    var tempStr = ""
    let arr = Array.init(s)
    
    for i in 0..<arr.count {
        if !tempStr.contains(arr[i]) {
            tempStr.append(arr[i])
            r += 1
            
            if i == arr.count - 1 {
                resultArr.append(r-l)
            }
        } else {
            resultArr.append(r-l)
            tempStr = ""
            tempStr.append(arr[i])
            l = i
            r = i
        }
    }
    
    return resultArr.max()!
}

print(lengthOfLongestSubstring("xxyzazcca"))
