//
//  UIView+Extension.swift
//  PartCornerRadiusDemo
//
//  Created by Thomas Lau on 2020/12/30.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

extension UIView {
    
    /// 圆角设置
    ///
    /// - Parameters:
    ///   - view: 需要设置的控件
    ///   - corner: 哪些圆角
    ///   - radii: 圆角半径
    /// - Returns: layer图层
    static func configRectCorner(view: UIView, corner: UIRectCorner, radii: CGSize) -> CALayer {
        
        view.layoutIfNeeded()
        
        let maskPath = UIBezierPath.init(roundedRect: view.bounds, byRoundingCorners: corner, cornerRadii: radii)
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = view.bounds
        maskLayer.path = maskPath.cgPath
        
        return maskLayer
    }
}
