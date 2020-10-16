//
//  ViewController.swift
//  RichTextDemo
//
//  Created by Thomas Lau on 2020/10/8.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allow_textView = UITextView(frame: CGRect(x: 20, y: 90, width: 200, height: 200))
        allow_textView.isEditable = true
        allow_textView.isScrollEnabled = false
        allow_textView.textContainerInset = .zero
        allow_textView.textContainer.lineFragmentPadding = 0
        allow_textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
        allow_textView.delegate = self
        view.addSubview(allow_textView)
        
        let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        let rangeStr = "《\(appName ?? "")隐私政策》"
        let protocolStr = "阅读并同意\(rangeStr)"
        let privacyRange = (protocolStr as NSString).range(of: rangeStr)
        var privacyMutableAttrStr: NSMutableAttributedString? = nil
        if let font = UIFont(name: "PingFangSC-Medium", size: 12.0) {
            privacyMutableAttrStr = NSMutableAttributedString(string: protocolStr, attributes: [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.cyan
            ])
        }
        
        //给需要 点击事件的部分添加链接
        privacyMutableAttrStr!.addAttribute(.link, value: "privacy://", range: privacyRange)
        allow_textView.attributedText = privacyMutableAttrStr
    }

}

extension ViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        
        // 这里调用方法跳到隐私政策页面
        if URL.scheme == "privacy" {
            print("\(#function) - 隐私跳转")
            return false
        }

        return true
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {

        return false
    }
}

