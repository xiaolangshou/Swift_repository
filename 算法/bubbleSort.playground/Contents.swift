import UIKit

var arr = [10, 2, 8, 6, 12, 62, 4, 12, 1, 88]

func bubbleSort(arr: [Int]) -> [Int] {
    
    var resultArr: [Int] = arr
    
    for i in 0..<arr.count-1 {
        for j in 0..<arr.count-1-i {
            if resultArr[j] > resultArr[j+1] {
                resultArr.swapAt(j, j+1)
            }
        }
    }
    
    return resultArr
}

print(bubbleSort(arr: arr))

