//
//  UIView+Frame.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension CGPoint {
    
    public init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
}

extension CGSize {
    
    public init(_ w: CGFloat, _ h: CGFloat) {
        
        self.init(width: w, height: h)
    }
    
    static func * (l: CGSize, r: CGFloat) -> CGSize {
        
        return CGSize(width: l.width * r, height: l.height * r)
    }
}

extension CGRect {
    
    public init(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }
    
    public init(_ w: CGFloat, _ h: CGFloat) {
        self.init(0, 0, w, h)
    }
    
    public init(x: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(x, 0, w, h)
    }
    
    public init(y: CGFloat, _ w: CGFloat, _ h: CGFloat) {
        self.init(0, y, w, h)
    }
}

extension UIEdgeInsets {
    
    public init(_ t: CGFloat, _ l: CGFloat, _ b: CGFloat, _ r: CGFloat) {
        
        self.init(top: t, left: l, bottom: b, right: r)
    }
}

extension UIImage {
    
    public convenience init?(_ imageName: String) {
        self.init(named: imageName)
    }
    
    // pure color view
    static func from(color: UIColor) -> UIImage {
        
        let rect = CGRect(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
    
    func cutCircleImage() -> UIImage {
        
        let rect = CGRect(0, 0, size.width, size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        let context = UIGraphicsGetCurrentContext()!
        context.addEllipse(in: rect)
        context.clip()
        draw(in: rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img!
    }
}

extension UIImageView {
    
    public convenience init(_ imageName: String) {
        self.init(image: UIImage(imageName))
    }
}

extension UIView {
    
    public convenience init(_ x: CGFloat,
                            _ y: CGFloat,
                            _ width: CGFloat,
                            _ height: CGFloat)
    {
        self.init(frame: CGRect(x, y, width, height))
    }
    
    public convenience init(_ w: CGFloat, _ h: CGFloat) {
        self.init(0, 0, w, h)
    }
    
    public convenience init(x: CGFloat,
                            _ w: CGFloat,
                            _ h: CGFloat)
    {
        self.init(0, 0, w, h)
    }
    
    public convenience init(y: CGFloat,
                            _ w: CGFloat,
                            _ h: CGFloat)
    {
        self.init(0, y, w, h)
    }
}

extension UILabel {
    public convenience init(_ title: String) {
        self.init(frame: .zero)
        text = title
        sizeToFit()
    }
}

extension UILabel {
    
    @discardableResult func Text(_ text: String?) -> Self {
        self.text = text
        sizeToFit()
        return self
    }
    
    @discardableResult func Font(_ font: UIFont?) -> Self {
        self.font = font
        sizeToFit()
        return self
    }
    
    @discardableResult func TextColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult func TextFont(_ text: String?, _ font: UIFont) -> Self {
        self.text = text
        self.font = font
        sizeToFit()
        return self
    }
    
    @discardableResult func FontColor(_ font: UIFont, _ textColor: UIColor) -> Self {
        self.font = font
        self.textColor = textColor
        return self
    }
    
    @discardableResult func TextAndColor(_ text: String?, _ textColor: UIColor) -> Self {
        self.text = text
        self.textColor = textColor
        sizeToFit()
        return self
    }
    
    @discardableResult func TextFontColor(_ text: String?, _ font: UIFont, _ textColor: UIColor) -> Self {
        self.text = text
        self.font = font
        self.textColor = textColor
        sizeToFit()
        return self
    }
    
    @discardableResult func TextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
}

extension UIButton {
    @discardableResult func Image(_ string: String) -> Self {
        
        self.setImage(UIImage(string), for: .normal)
        
        return self
    }
    
    @discardableResult func Image(_ image: String, _ selectedImage: String) -> Self {
        
        self.setImage(UIImage(image), for: .normal)
        self.setImage(UIImage(selectedImage), for: .selected)
        
        return self
    }
    
    @discardableResult func Text(_ text: String) -> Self {
        
        self.setTitle(text, for: .normal)
        
        return self
    }
    
    @discardableResult func TitleColor(_ color: UIColor) -> Self {
        
        self.setTitleColor(color, for: .normal)
        
        return self
    }
    
    @discardableResult func TitleColor(_ color: UIColor, _ selectedColor: UIColor) -> Self {
        
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(selectedColor, for: .selected)
        
        return self
    }
}

extension UIView {
    
    open func TagView   (_ tag: Int) -> UIView      {
        return viewWithTag(tag)!
    }
    
    open func TagLabel  (_ tag: Int) -> UILabel     {
        return viewWithTag(tag) as! UILabel
    }
    
    open func TagButton (_ tag: Int) -> UIButton    {
        return viewWithTag(tag) as! UIButton
    }
    
    open func TagImgView(_ tag: Int) -> UIImageView {
        return viewWithTag(tag) as! UIImageView
    }
}


extension UIImageView {
    
    @discardableResult func ImageName(_ imageName: String) -> Self {
        
        self.image = UIImage(imageName)
        self.sizeToFit()
        
        return self
    }
}


extension UIView {
    
    @discardableResult func added(into superView: UIView) -> Self {
        superView.addSubview(self)
        
        return self
    }
    
    @discardableResult func BgColor(_ bgColor: UIColor) -> Self {
        self.backgroundColor = bgColor
        
        return self
    }
    
    @discardableResult func Tag(_ tag: Int) -> Self {
        self.tag = tag
        
        return self
    }
    
    @discardableResult func IsHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        
        return self
    }
}

extension CGSize {
    
    var w : CGFloat {
        set {
            self.width  = newValue
        }
        get {
            return self.width
        }
    }
    
    var h : CGFloat {
        set {
            self.height = newValue
        }
        get {
            return self.height
        }
    }
    
}

extension CGRect {
    
    var left : CGFloat {
        set {
            self.origin.x = newValue
        }
        get {
            return self.origin.x
        }
    }
    
    var top : CGFloat {
        set {
            self.origin.y = newValue
        }
        get {
            return self.origin.y
        }
    }
    
    var width : CGFloat {
        set {
            self.size.width = newValue
        }
        get {
            return self.size.width
        }
    }
    
    var height: CGFloat {
        set {
            self.size.height = newValue
        }
        get {
            return self.size.height
        }
    }
}

extension UIView {
    
    var origin : CGPoint {
        set {
            self.frame.origin = newValue
        }
        get {
            return self.frame.origin
        }
    }
    
    var width : CGFloat {
        set {
            self.frame.width = newValue
        }
        get {
            return self.frame.width
        }
    }
    
    var height : CGFloat {
        set {
            self.frame.height = newValue
        }
        get {
            return self.frame.height
        }
    }
    
    var left : CGFloat {
        set {
            self.frame.left = newValue
        }
        get {
            return self.frame.left
        }
    }
    
    var top : CGFloat {
        set {
            self.frame.top = newValue
        }
        get {
            return self.frame.top
        }
    }
    
    var right : CGFloat {
        set {
            self.left = newValue - width
        }
        get {
            return self.left + self.width
        }
    }
    
    var bottom : CGFloat {
        set {
            self.top = newValue - height
        }
        get {
            return self.top + self.height
        }
    }
    
    var size : CGSize {
        set {
            self.frame = .init(newValue.w, newValue.h)
        }
        get {
            return self.frame.size
        }
    }
    
    var centerX : CGFloat {
        set {
            self.center.x = newValue
        }
        get {
            return self.center.x
        }
    }
    
    var centerY : CGFloat {
        set {
            self.center.y = newValue
        }
        get {
            return self.center.y
        }
    }
    
    var tCenter : CGPoint {
        set {
            self.centerX = newValue.x
            self.top = newValue.y
        }
        get {
            return .init(x: self.centerX, y: self.top)
        }
    }
    
    var lCenter : CGPoint {
        set {
            self.left = newValue.x
            self.centerY = newValue.y
        }
        get {
            return .init(x: self.left, y: self.centerY)
        }
    }
    
    var rCenter : CGPoint {
        set {
            self.right = newValue.x
            self.centerY = newValue.y
        }
        get {
            return .init(x: self.right, y: self.centerY)
        }
    }
    
    var bCenter : CGPoint {
        set {
            self.centerX = newValue.x
            self.bottom  = newValue.y
        }
        get {
            return .init(x: self.centerX, y: self.bottom)
        }
    }
    var rTop : CGPoint {
        set {
            self.right = newValue.x
            self.top = newValue.y
        }
        get {
            return .init(x: self.right, y: self.top)
        }
    }
    
    var lBottom : CGPoint {
        set {
            self.left = newValue.x
            self.bottom  = newValue.y
        }
        get {
            return .init(x: self.left, y: self.bottom)
        }
    }
    
    var rBottom : CGPoint {
        set {
            self.right = newValue.x
            self.bottom = newValue.y
        }
        get {
            return .init(x: self.right, y: self.bottom)
        }
    }
    
}


