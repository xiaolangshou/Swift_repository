import UIKit

/*给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。*/

var nums = [1,2,9,4,6,0,7,-2,-1]
var target = 6

// 哈希
func sumTwo(arr: [Int], target: Int) {
    
    var dict = [Int: Int]() // key是num, value是index
    
    for (i, num) in nums.enumerated() {
        print("dict[\(target) - \(num)] = \(String(describing: dict[target - num]))")
        if let lastIndex = dict[target - num] {
            print([lastIndex, i])
        }
        
        dict[num] = i // index赋值给value
    }
}

sumTwo(arr: nums, target: target)







// 遍历
func twoSum(arr: [Int], target: Int) {
    
    for i in 0..<arr.count-1 {
        for j in i+1..<arr.count {
            if arr[i] + arr[j] == target {
                print("[\(i), \(j)]")
            }
        }
    }
    
}

//twoSum(arr: nums, target: target)
