//
//  HPSolutionDetailShareView.swift
//  DRAlertView
//
//  Created by Thomas Lau on 2018/5/16.
//  Copyright © 2018年 dengrui. All rights reserved.
//

import UIKit

let viewHeight = CGFloat(235)

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

let kSCREEN_HEIGHT_RATIO: CGFloat = kScreenHeight < 667 ? 1 : kScreenHeight / 667.0

func kAutoHEX(h: CGFloat) -> CGFloat {
    return h * kSCREEN_HEIGHT_RATIO
}

let kModelViewCellHeight = CGFloat(55)
let kViewHeight = kAutoHEX(h: viewHeight)

class HPSolutionDetailShareView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        
        self.frame = CGRect(x: 0,
                            y: kScreenHeight,
                            width: kScreenWidth,
                            height: kViewHeight)
        
        backgroundColor = UIColor.green
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("取消", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.frame = CGRect(x: 0,
                           y: kViewHeight - kModelViewCellHeight,
                           width: kScreenWidth,
                           height: kModelViewCellHeight)
        btn.addTarget(self, action: #selector(clickBtns(sender:)), for: .touchUpInside)
        addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickBtns(sender: UIButton) {

        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.frame.origin.y = kScreenHeight
        }, completion: { (finish) -> Void in
            self.isHidden = true
            self.removeFromSuperview()
        })
    }
    
    func show() {
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(self)
        
        isHidden = false
        
        UIView.animate(withDuration: 0.2) {
            () -> Void in
            self.frame.origin.y = kScreenHeight - kViewHeight
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

