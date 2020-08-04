import UIKit

var q:[Int] = [0,0,0,0,0,0,0,0]//存column
var count = 0

// 判断位置是否可取
func check(row: Int, column: Int) -> Bool {
    // 遍历之前的行
    for i in 0..<row {
        // 同一列
        if q[i] == column {
            return false
        }
        // 同一斜线（x,y坐标相同）
        if (i + q[i] == row + column) {
            return false
        }
        // 同一斜线 （x,-y坐标相同）
        if (i - q[i] == row - column) {
            return false
        }
    }
    
    return true
}

// 打印所有格子的位置
func prints() {
    for row in 0..<8 {
        for _ in 0..<q[row] {
            print("-", terminator: "")
        }
        print("#", terminator: "")
        for _ in q[row]+1..<8 {
            print("-", terminator: "")
        }
        print("\n", terminator: "")
    }
    print("=========================\n")
}

func eightQueen(row: Int) {
    
    for column in 0..<8 {
        if check(row: row, column: column) {
            q[row] = column
            if row == 7 {
                count+=1
                prints()
                q[row] = 0
                
                return
            }
            eightQueen(row: row + 1)
            q[row] = 0
        }
    }
}

eightQueen(row: 0)
print("摆放方式有\(count)种")

