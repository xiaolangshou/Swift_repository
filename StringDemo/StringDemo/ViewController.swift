//
//  ViewController.swift
//  StringDemo
//
//  Created by lian shan on 2020/10/19.
//

import UIKit

class ViewController: UIViewController {

    var str = "By clicking \"Verify Mobile Number\" I agree to {termLinkTip} and {privacyPolicyLinkTip}"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var l = [String]()
        l = str.components(separatedBy: "{termLinkTip}")
        
        var m = [String]()
        m = l.last!.components(separatedBy: "{privacyPolicyLinkTip}")
        
        let str1 = l.first
        let str2 = m.first
    }


}

