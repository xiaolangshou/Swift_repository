//
//  ViewController.swift
//  TextViewDemo
//
//  Created by Thomas Lau on 2020/12/11.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textView = UITextView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        textView.backgroundColor = UIColor.cyan
        view.addSubview(textView)
        
        let str = "aaaaaaa bbb ccccccc"
        var l = [String]()
        l = str.components(separatedBy: "bbb")

        guard let str1 = l.first else { return }
        guard let str2 = l.last else { return }

        let rangeStrTerms = "thoams"
        let protocolStr = str1 + "\(rangeStrTerms)" + str2
        let font = UIFont.systemFont(ofSize: 15)

        let privacyRangeTerms = (protocolStr as NSString).range(of: rangeStrTerms)
        var privacyMutableAttrStr: NSMutableAttributedString? = nil
        privacyMutableAttrStr = NSMutableAttributedString(string: protocolStr, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])

        privacyMutableAttrStr!.addAttribute(.link,
                                            value: "thoams love you aaaaaaaaasjdflakjsdflksjdfkl",
                                            range: privacyRangeTerms)
        textView.attributedText = privacyMutableAttrStr
        
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.isEditable = false
    }
}

extension ViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange) -> Bool
    {
        print(URL.absoluteString)
        return true
    }
    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool
    {
        print(URL.absoluteString)
        return true
    }
}

