//
//  UIImage+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 绘制导航栏渐变色背景
    static func drawNavBarImg(colorTop: UIColor, colorBottom: UIColor) -> UIImage {
        
        let height: CGFloat = (UIDevice.isPhoneX || UIDevice.isPhoneXR || UIDevice.isPhoneXMax) ? 88 : 64
        let rect = CGRect(x: 0, y: 0, width: 100, height: height)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        let colorSpace = CGColorSpace.init(name: CGColorSpace.sRGB)
        let colors = [colorTop.cgColor,
                      colorBottom.cgColor]
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colors as CFArray, locations: nil)
        ctx.drawLinearGradient(gradient!,
                               start: CGPoint.init(x: 0, y: 0),
                               end: CGPoint.init(x: 0, y: height),
                               options: .drawsAfterEndLocation)
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
    
    /// 根据颜色生成图片
    static func createImgForColor(_ color: UIColor, rect: CGRect = CGRect.init(x: 0, y: 0, width: 1, height: 1)) -> UIImage {
        let rect = rect
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        color.setFill()
        ctx.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
    
    /// 重设图片大小
    func resizeImage(size: CGSize, fromY: CGFloat) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        self.draw(in: CGRect(x: 0, y: 480, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? UIImage()
    }
    
    /// 裁剪边框
    func clipRect(_ rect: CGRect) -> UIImage? {
        
        guard let cgImg = self.cgImage else { return nil }
        guard let part = cgImg.cropping(to: rect) else { return nil }
        
        let newImage = UIImage(cgImage: part)
        
        return newImage
    }
}
