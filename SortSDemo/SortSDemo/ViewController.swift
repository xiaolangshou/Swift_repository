//
//  ViewController.swift
//  SortSDemo
//
//  Created by mac on 2018/9/27.
//  Copyright © 2018年 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arr = [10, 13, 8, 2, 76, 32, 9, 15, 27, 88, 45, 41, 32, 19, 6, 22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SelectSort(arrs: &arr)
//        BubbleSort(arrs: &arr)
        MergeSort2(arrs: &arr)
        
       // bubbleSort()
        //BubbleSort(arrs: &arr)
    }
    
    func SelectSort(arrs: inout [Int]) {
        for i in 0..<arrs.count {
            let min = i
            for j in i+1..<arrs.count {
                if arrs[min] > arrs[j] {
                    let temp = arrs[min]
                    arrs[min] = arrs[j]
                    arrs[j] = temp
                }
            }
        }
        
        print("Select sorted arr = \(arrs)")
    }
    
    
    
    func BubbleSort(arrs: inout [Int]) {
        
        for i in 0..<arrs.count {
            for j in 0..<arrs.count - 1 - i {
                if arrs[j] > arrs[j+1] {
                    let temp = arrs[j]
                    arrs[j] = arrs[j+1]
                    arrs[j+1] = temp
                }
            }
        }
        
        print("bubble sortde array = \(arrs)")
    }
    
    func InsertionSort(arrs: inout [Int]) {
        
        
    }
    
    func MergeSort(arrs: inout [Int]) {
        
        // 对已排好序的两个数组合并
        func mergeArr(leftArr: [Int], rightArr: [Int]) -> [Int] {
            
            var tempArr = [Int]()
            var i = 0, j = 0
            
            while (i < leftArr.count && j < rightArr.count) {
                if leftArr[i] < rightArr[j] {
                    tempArr.append(leftArr[i])
                    
                    i += 1
                    
                } else if (leftArr[i] == rightArr[j]) {
                    tempArr.append(leftArr[i])
                    tempArr.append(rightArr[j])
                    
                    i += 1
                    j += 1
                    
                } else {
                    tempArr.append(rightArr[j])
                    
                    j += 1
                }
            }
            
            while (i < leftArr.count) {
                tempArr.append(leftArr[i])
                
                i += 1
            }
            
            while (j < rightArr.count) {
                tempArr.append(rightArr[j])
                
                j += 1
            }
            
            return tempArr
        }
        
        // 对未排序的数组进行分类，分为两两比较
        func divideArr(arr: [Int]) -> [Int] {
            guard arr.count > 1 else { return arr }
            
            let mid = arr.count / 2
            let leftArr = divideArr(arr: Array.init(arr[0..<mid]))
            let rightArr = divideArr(arr: Array.init(arr[mid..<arr.count]))
            
            return mergeArr(leftArr: leftArr, rightArr: rightArr)
        }
        
        print("merge sorted arr = \(divideArr(arr: arrs))")
    }
    

//    func SelectSort(arrs: inout [Int]) {
//
//        for i in 0..<arrs.count {
//            let min = i
//            for j in i+1..<arrs.count {
//                if arrs[j] < arrs[min] {
//                    let temp = arrs[j]
//                    arrs[j] = arrs[min]
//                    arrs[min] = temp
//                }
//            }
//        }
//
//        print("select sorted array = \(arrs)")
//    }
//
//    func BubbleSort(arrs: [Int]) {
//
//        var array = arrs
//
//        for i in 0..<array.count - 1 {
//            for j in 0..<array.count - 1 - i {
//                if array[j] > array[j + 1] {
//                    let temp = array[j]
//                    array[j] = array[j + 1]
//                    array[j + 1] = temp
//                }
//            }
//        }
//
//        print("bubble sorted array = \(array)")
//    }
//
//    func MergeSort(arrs: [Int]) {
//
//        // 分
//        func mergeSort(arr: [Int]) -> [Int] {
//            guard arr.count > 1 else { return arr }
//
//            let mid = arr.count / 2
//
//            let leftArr = mergeSort(arr: Array(arr[0..<mid]))
//            let rightArr = mergeSort(arr: Array(arr[mid..<arr.count]))
//
//            return mergeArr(leftArr: leftArr, rightArr: rightArr)
//        }
//
//        // 合
//        func mergeArr(leftArr: [Int], rightArr: [Int]) -> [Int] {
//
//            var i = 0, j = 0
//            var tempArr: [Int] = []
//
//            while (i < leftArr.count && j < rightArr.count) {
//
//                if leftArr[i] < rightArr[j] {
//                    tempArr.append(leftArr[i])
//                    i += 1
//                } else if leftArr[i] > rightArr[j] {
//                    tempArr.append(rightArr[j])
//                    j += 1
//                } else {
//                    tempArr.append(leftArr[i])
//                    tempArr.append(rightArr[j])
//
//                    i += 1
//                    j += 1
//                }
//            }
//
//            while (i < leftArr.count) {
//                tempArr.append(leftArr[i])
//
//                i += 1
//            }
//
//            while (j < rightArr.count) {
//                tempArr.append(rightArr[j])
//
//                j += 1
//            }
//
//            return tempArr
//        }
//
//        print("merge sorted array = \(mergeSort(arr: arrs))")
//    }
//
//    func FastSort(array: [Int]) {
//
//    }
    
    func bubbleSort() {
        var arr = [10, 13, 8, 2, 76, 32, 9, 15, 27, 88, 45, 41, 32, 19, 6, 6, 22]
        
        for i in 0..<arr.count {
            for j in 0..<arr.count - i - 1 {
                if arr[j] > arr[j + 1] {
                    let temp = arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = temp
                }
            }
        }
        
        print(arr)
    }
    
    func MergeSort2(arrs: inout [Int]) {
    
        // [10, 13, 8, 2, 76, 32, 9, 15, 27, 88, 45, 41, 32, 19, 6, 22]
        
        // [10, 13] [8, 2] [76, 32] [9, 15] [27, 88] [45, 41] [32, 19] [6, 22]
        
        // [10, 13] [2, 8] [32, 76] [9, 15] [27, 88] [41, 45] [19, 32] [6, 22]
        
        // [2, 8, 10, 13] [9, 15, 32, 76] [27, 41, 45, 88] [6, 19, 22, 32]
        
        // [2, 8, 9, 10, 13, 15, 32, 76] [6, 19, 22, 27, 32, 41, 45, 88]
        
        // [2, 6, 8, 9, 10, 13, 15, 19, 22, 27, 32, 32, 41, 45, 76, 88]
        
        // 分
        func mergeSort(arr: [Int]) -> [Int] {
            
            guard arr.count > 1 else { return arr }
            
            let mid = arr.count / 2
            let leftArr = mergeSort(arr: Array.init(arr[0..<mid]))
            let rightArr = mergeSort(arr: Array.init(arr[mid..<arr.count]))
            
            
            return mergeArr(leftArr: leftArr, rightArr: rightArr)
        }
        
        // 合
        func mergeArr(leftArr: [Int], rightArr: [Int]) -> [Int] {

            var tempArr = [Int]()
            var i = 0
            var j = 0
            
            while i < leftArr.count && j < rightArr.count {
                if leftArr[i] < rightArr[j] {
                    tempArr.append(leftArr[i])
                    i += 1
                } else if leftArr[i] > rightArr[j] {
                    tempArr.append(rightArr[j])
                    j += 1
                } else {
                    tempArr.append(leftArr[i])
                    tempArr.append(rightArr[j])
                    i += 1
                    j += 1
                }
            }
            
            while i < leftArr.count {
                tempArr.append(leftArr[i])
                i += 1
            }
            
            while j < rightArr.count {
                tempArr.append(rightArr[j])
                j += 1
            }
            
            return tempArr
        }
        
        print(mergeSort(arr: arrs))
    }
}

