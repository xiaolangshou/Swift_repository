import UIKit

var num = 0
// x -- y -- z
func Hanoi(n: Int, _ x: Character, _ y: Character, _ z: Character) {
    
    if n == 1 {
        print("\(n): \(x) --> \(z)")
        
        return
    }
    Hanoi(n: n - 1, x, z, y)
    
    print("\(n): \(x) --> \(z)")
    
    Hanoi(n: n - 1, y, x, z)
    
    num += 1
    print(num)
    return
}

Hanoi(n: 10, "A", "B", "C")
