//
//  Toast.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class Toast: UIView {
    
    var autoHide = true
    var duration: TimeInterval = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(white: 0, alpha: 0.85)
        layer.cornerRadius = 8
    }
    
    func show() {
        if let topView = UIApplication.shared.keyWindow?.topVC?.view {
            topView.subviews.forEach { v in
                if v is Toast && v != self {
                    v.removeFromSuperview()
                }
            }
        }
        if autoHide {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.hide()
            }
        }
    }
    
    func hide() {
        self.removeFromSuperview()
    }
}

class MessageToast: Toast {
    let messageLabel = UILabel()
    
    convenience init(message: String) {
        self.init(frame: CGRect.zero)
        
        self.addSubview(messageLabel)
        self.duration += floor(message.count.double / 20)
        self.messageLabel.text = message
        self.messageLabel.numberOfLines = 0
        let size = self.messageLabel.sizeThatFits(CGSize.init(width: UIScreen.width / 2,
                                                              height: UIScreen.height - 200))
        let newSize = size.add(20, 20)
        self.size = newSize
        self.messageLabel.size = size
        self.messageLabel.center = self.center
    }
}

class LoadingToast: Toast {
    let indicator = UIActivityIndicatorView.init(style: .whiteLarge)
    convenience init() {
        self.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        
        self.autoHide = false
        indicator.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        self.addSubview(indicator)
    }
    
    override func show() {
        super.show()
        self.indicator.startAnimating()
        
    }
    
    override func hide() {
        super.hide()
        self.indicator.stopAnimating()
    }
}

extension CGSize {
    func add(_ w: CGFloat, _ h: CGFloat) -> CGSize {
        return CGSize.init(width: self.width + w, height: self.height + h)
    }
}

extension Toast {
    static func show(message: String) {
        guard let view = UIWindow.keyWindow?.topVC?.view else { return }
        let toast = MessageToast.init(message: message)
        toast.center = CGPoint.init(x: view.width / 2, y: view.height / 2)
        view.addSubview(toast)
        toast.show()
    }
    
    static func showLoading() {
        guard let view = UIWindow.keyWindow?.topVC?.view else { return }
        let toast = LoadingToast.init()
        view.addSubview(toast)
        toast.center = CGPoint.init(x: view.width / 2, y: view.height / 2)
        toast.show()
    }
    
    static func hideLoading() {
        guard let view = UIWindow.keyWindow?.topVC?.view else { return }
        view.subviews.forEach {
            if let t = $0 as? Toast {
                t.hide()
            }
        }
    }
}

extension UIWindow {
    
    var topVC: UIViewController? {
        if let tabVC = self.rootViewController as? UITabBarController,
            let navVC = tabVC.selectedViewController as? UINavigationController,
            let topVC = navVC.topViewController {
            return topVC
        }
        return nil
    }
}
