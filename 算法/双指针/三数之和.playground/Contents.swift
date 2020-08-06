import UIKit

var arr = [-1, 0, 1, 2, -1, -4]

func threeSum(_ nums: [Int]) -> [[Int]] {
    let numsArr = nums.sorted()
    var array = [Int]()
    var arrs = Set<[Int]>()
    var resultArr = [[Int]]()
    
    for i in 0..<numsArr.count {
        for j in i+1..<numsArr.count {
                for k in j+1..<numsArr.count {
                    if numsArr[i] + numsArr[j] + numsArr[k] == 0 {
                        array.append(numsArr[i])
                        array.append(numsArr[j])
                        array.append(numsArr[k])
                        arrs.insert(array)
                        array.removeAll()
                    }
            }
        }
    }

    for i in arrs {
        resultArr.append(i)
    }
    
    return resultArr
}

print(threeSum(arr))


