import UIKit

var nums = [-1,0,3,5,9,12]
var target = 9

func binarySearch(_ arr: [Int], target: Int) -> Int? {
    var l = 0
    var r = arr.count - 1

    while l < r {
        let mid = l + (r - l)/2
        
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            l = mid + 1
        } else {
            r = mid
        }
    }
    
    return nil
}


print(binarySearch(nums, target: target)!)
