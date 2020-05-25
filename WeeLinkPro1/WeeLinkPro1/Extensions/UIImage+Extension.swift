//
//  UIImage+Extension.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/25.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        
      let rect = CGRect(origin: .zero, size: size)
      UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
      color.setFill()
      UIRectFill(rect)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      guard let cgImage = image?.cgImage else { return nil }
      self.init(cgImage: cgImage)
    }
}
