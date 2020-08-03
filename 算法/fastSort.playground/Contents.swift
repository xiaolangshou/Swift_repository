import UIKit

var arr = [10, 2, 8, 6, 12, 62, 4, 12, 1, 88]

func quickSort(arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    
    var leftArr: [Int] = []
    var rightArr: [Int] = []
    var resultArr: [Int] = []
    let pivit: Int = arr[arr.count - 1]
    
    for i in 0..<arr.count - 1 {
        if arr[i] > pivit {
            rightArr.append(arr[i])
        } else {
            leftArr.append(arr[i])
        }
    }
    
    resultArr = quickSort(arr: leftArr) + [pivit] + quickSort(arr: rightArr)

    return resultArr
}

print(quickSort(arr: arr))
