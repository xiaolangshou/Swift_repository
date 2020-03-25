//
//  StringExT.swift
//  MarqueeView
//
//  Created by Thomas Lau on 2018/6/1.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

extension String {
    
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [kCTFontAttributeName as NSAttributedStringKey: font],
                                                       context: nil)
        return ceil(rect.width)
    }

}
