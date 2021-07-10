//
//  ViewController.swift
//  OpenDeepLinkDemo
//
//  Created by lian shan on 2021/6/23.
//

import UIKit

class ViewController: UIViewController {

    let urlStr = "deeplinkdemo://com.lazada.deeplinkdemo"
    let btn = UIButton.init(frame: CGRect.init(x: 100, y: 200, width: 200, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 6.0
        btn.layer.masksToBounds = true
        btn.setTitle("打开deeplinkdemo", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }

    @objc func btnTapped() {

        let url = URL.init(string: urlStr)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        } else {
            let alert = UIAlertController.init(title: "没有安装deeplinkdemo", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                print("close")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

