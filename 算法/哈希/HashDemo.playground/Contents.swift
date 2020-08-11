import UIKit

// 给定一个字符串s，计算具有相同数量0和1的非空（连续）子字符串的数量，并且这个字字符串的所有0和所有1都是组合在一起的。
/* 输入: "00110011"  输出: 6  解释: 有6个子串具有相同数量的连续1和0：“0011”，“01”，“1100”，“10”，“0011” 和 “01”。*/

func countBinarySubstrings(_ s: String) -> Int {
    var counters = [Int]()
    var preEle:String.Element = s.first!
    var counter = 0
    var results = 0
    
    for e in s {
        if e == preEle {
            counter += 1
        } else {
            counters.append(counter)
            preEle = e
            counter = 1
        }
    }
    
    counters.append(counter)
    print(counters)
    
    for i in 0..<(counters.count - 1) {
        let m = counters[i]
        let n = counters[i+1]
        
        results += min(m,n)
    }
    
    print(results)
    return results
}

countBinarySubstrings("10111")
