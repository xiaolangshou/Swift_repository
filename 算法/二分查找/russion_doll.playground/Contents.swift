import UIKit

var envelopes = [[5,4],[6,4],[6,7],[2,3]]
typealias model = [Int]

func russionDoll(arr: [model]) {
    // w 升序排列, 相同w的h降序
    var tempArr: [model] = arr
    tempArr.sort { (s1, s2) -> Bool in
        if s1.first! == s2.first! {
            return s1.last! > s2.last!
        } else {
            return s1.first! < s2.first!
        }
    }
    
    print(tempArr)
}

russionDoll(arr: envelopes)
