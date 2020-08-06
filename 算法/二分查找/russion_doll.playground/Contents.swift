import UIKit

var envelopes = [[5,4],[6,4],[6,7],[2,3]]
typealias model = [Int]

func sortArray(_ envelopes: [[Int]]) -> [[Int]] {
    var tempEnvelopes = envelopes
    tempEnvelopes = tempEnvelopes.sorted { (s1, s2) -> Bool in
        if (s1.first ?? 0 == s2.first ?? 0) {
            return s1.last ?? 0 > s2.last ?? 0
        } else {
            return s1.first ?? 0 < s2.first ?? 0
        }
    }
    print("========envelopes==\(tempEnvelopes)")
    return tempEnvelopes
}

func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    guard envelopes.count > 1 else { return envelopes.count }
    let sortEnvelopes = sortArray(envelopes)

    var countArr = Array.init(repeating: 1, count: envelopes.count)
    for i in 0..<sortEnvelopes.count {
        for j in 0..<i {
            if sortEnvelopes[i][1] > sortEnvelopes[j][1] {
                print("\(countArr[i]),\(countArr[j]+1)")
                countArr[i] = max(countArr[i], countArr[j]+1)
            }
        }
    }
    
    print("\(countArr)")
    return countArr.max()!
}

print(maxEnvelopes(envelopes))
