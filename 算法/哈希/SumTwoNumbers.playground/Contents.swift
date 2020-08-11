import UIKit

// 求数组中两数之和为目标值的下标
var num = [2,7,11,15]
var target = 13

// 哈希
func sumTwo(arr: [Int], target: Int) -> [Int] {

    var dict: [Int: Int] = [:] //key: num  value: index
    var result: [Int] = []

    for (i,v) in arr.enumerated() {
        if let lastIndex = dict[target - v] {
            result.append(lastIndex)
            result.append(i)
        }

        dict[v] = i
    }

    return result
}

print(sumTwo(arr: num, target: target))

// 遍历
func towSum(arr: [Int], target: Int) -> [Int] {
    
    var result = [Int]()
    
    for i in 0..<arr.count-1 {
        for j in i+1..<arr.count {
            if arr[i] + arr[j] == target {
                result.append(i)
                result.append(j)
            }
        }
    }
    
    return result
}

print(towSum(arr: num, target: target))
