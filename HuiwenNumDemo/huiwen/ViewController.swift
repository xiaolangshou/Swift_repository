//
//  ViewController.swift
//  huiwen
//
//  Created by Thomas Lau on 2020/3/19.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(isHuiwen(num: 121))
    }

    /// 判断一串数字是不是回文
    func isHuiwen(num: Int) -> Bool {
        // 不为零，尾数不为零
        if num < 0 || (num % 10 == 0 && num != 0) {
           return false
        }
        var n = num // 121
        var midN = 0 // 0
        while midN < n {
            // 后半段反转
            midN = midN * 10 + n % 10 //1, 12,
            n /= 10 //12, 1
        }
        // 后半段和前半段一样， 或者去掉中间数字后和前半段一样
        return midN == n || midN / 10 == n
    }

}

