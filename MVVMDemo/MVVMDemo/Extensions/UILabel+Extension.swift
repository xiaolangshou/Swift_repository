//
//  UILabel+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UILabel {
    
    func addAttributesText(_ text: String, with dict: [NSAttributedString.Key: Any]) {
        let newAttrText = NSAttributedString.init(string: text, attributes: dict)
        // 如果有
        if let oldAttrText = self.attributedText {
            let mOldAttrText = NSMutableAttributedString.init(attributedString: oldAttrText)
            mOldAttrText.append(newAttrText)
            self.attributedText = mOldAttrText
        }
            // 没有
        else {
            self.attributedText = newAttrText
        }
    }
    
    func addAttrText(_ text: String, textColor: UIColor, font: UIFont) {
        let attrDict = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: font
        ]
        let newAttrText = NSAttributedString.init(string: text, attributes: attrDict)
        if let oldAttrText = self.attributedText {
            let mOldAttrText = NSMutableAttributedString.init(attributedString: oldAttrText)
            mOldAttrText.append(newAttrText)
            self.attributedText = mOldAttrText
        } else {
            self.attributedText = newAttrText
        }
    }
    
    func addAttrImage(img: UIImage, bounds: CGRect) {
        
        let imgAttachment = NSTextAttachment.init()
        imgAttachment.bounds = bounds
        imgAttachment.image = img
        let imgAttr = NSAttributedString.init(attachment: imgAttachment)
        
        if let oldAttrText = self.attributedText {
            let mOldAttrText = NSMutableAttributedString.init(attributedString: oldAttrText)
            mOldAttrText.append(imgAttr)
            self.attributedText = mOldAttrText
        } else {
            self.attributedText = imgAttr
        }
    }
    
    func setImage(_ img: UIImage, bounds: CGRect) {
        let imgAttachment = NSTextAttachment.init()
        imgAttachment.bounds = bounds
        imgAttachment.image = img
        let imgAttr = NSAttributedString.init(attachment: imgAttachment)
        self.attributedText = imgAttr
    }
}

extension UILabel {
    
    convenience init(_ text: String, color: UIColor, align: NSTextAlignment, font: UIFont) {
        self.init()
        self.text = text
        self.textColor = color
        self.textAlignment = align
        self.font = font
    }
    
    var attributedTextColor: UIColor? {
        set {
            guard let attrText = self.attributedText else {
                return
            }
            var attributes = attrText.attributes(at: 0, effectiveRange: nil)
            attributes[.foregroundColor] = newValue
            let string = attrText.string
            self.attributedText = NSAttributedString.init(string: string, attributes: attributes)
        }
        get {
            guard let attrText = self.attributedText else {
                return nil
            }
            var attributes = attrText.attributes(at: 0, effectiveRange: nil)
            return attributes[.foregroundColor] as? UIColor
        }
    }
}
