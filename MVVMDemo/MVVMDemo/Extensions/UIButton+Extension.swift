//
//  UIButton+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import Kingfisher

extension UIButton {
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let img = UIImage.createImgForColor(color)
        self.setBackgroundImage(img, for: UIControl.State.normal)
    }
    
    convenience init(_ title: String, _ titleColor: UIColor, _ font: UIFont) {
        self.init(type: .custom)
        self.setTitle(title: title, color: titleColor, font: font, for: UIControl.State.normal)
    }
}


extension UIButton {
    
    func setAttributedTitleColor(_ color: UIColor, for state: UIControl.State) {
        
        guard let attrTitle = self.attributedTitle(for: state) else { return }
        
        let string = attrTitle.string
        var attributes = attrTitle.attributes(at: 0, effectiveRange: nil)
        attributes[.foregroundColor] = color
        let newAttrTitle = NSAttributedString.init(string: string, attributes: attributes)
        self.setAttributedTitle(newAttrTitle, for: state)
    }
    
    func getAttributedTitleColor(for state: UIControl.State) -> UIColor? {
        
        guard let attrTitle = self.attributedTitle(for: state) else { return nil }
        
        var attributes = attrTitle.attributes(at: 0, effectiveRange: nil)
        return attributes[.foregroundColor] as? UIColor
    }
    
    func setTitle(title: String, color: UIColor, font: UIFont, for state: UIControl.State) {
        
        let attr = NSAttributedString.init(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: font
            ])
        self.setAttributedTitle(attr, for: state)
    }
    
    func loadImage(with path: String?, placeImage: UIImage? = nil, for state: UIControl.State = .normal) {
        
        self.kf.setImage(with: path?.url,
                         for: state,
                         placeholder: placeImage,
                         options: nil,
                         progressBlock: nil)
        { (img, error, cache, url) in
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
}

extension String {
    var url: URL? {
        return URL.init(string: self)
    }
}
