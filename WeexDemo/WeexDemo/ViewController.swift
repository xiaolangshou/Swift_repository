//
//  ViewController.swift
//  WeexDemo
//
//  Created by lian shan on 2021/1/7.
//

import UIKit
import WeexSDK

class ViewController: UIViewController {

    static let shared = ViewController()

    var urlStr = ""
    let instance = WXSDKInstance.init()
    var weexView = UIView()

    deinit {
        instance.destroy()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        instance.viewController = self
        instance.frame = self.view.frame

        instance.onCreate = { [weak self] view in
            guard let self = self else { return }
            self.weexView.removeFromSuperview()
            self.weexView = view
            self.view.addSubview(self.weexView)
        }

        instance.onFailed = { error in
            print("failed......\(error.localizedDescription)")
        }

        instance.renderFinish = { view in
            print("render finish......")
        }

        let url: URL? = URL.init(string: self.urlStr)
        guard url != nil else { return }
        instance.render(with: url!, options: ["bundleUrl": String.init(format: "file://%@/bundlejs/", Bundle.main.bundlePath)], data: nil)
    }

}

