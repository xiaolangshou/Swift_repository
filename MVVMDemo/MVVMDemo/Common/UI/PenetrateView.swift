
//
//  PenetrateView.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/3.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

open class PenetrateView: UIView {

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // 让用户可以点击到该view的下方
        guard let view = super.hitTest(point, with: event), view != self else {
            return nil
        }
        
        return view
    }
}
