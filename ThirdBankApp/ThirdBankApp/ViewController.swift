//
//  ViewController.swift
//  ThirdBankApp
//
//  Created by lian shan on 2021/6/22.
//

import UIKit

class ViewController: UIViewController {

    var urlStr = "lazada://th/web?url=https://checkout-m.lazada.co.th/cashier-polaris-result?hybrid=1&&from_cashier=1&cashierRequestNo=80fca479-ed4a-4ec5-9d29-ceb3606390d9&checkoutOrderId=20990591103210622568000064006&errorCode=&pmntId=20990591211210622264210064006&resultContext=&subServiceOption=VIRTUAL_ACCOUNT_DEEPLINK_SICOTH&wxvNoHistory=true&wxvBackURL=https%3A%2F%2Fmy-p.lazada.co.th%2Forder%2Forder-detail%3Fwh_weex%3Dtrue%26tradeOrderId%3D404835502434006%26cashierRequestNo%3D80fca479-ed4a-4ec5-9d29-ceb3606390d9"
    var urlStr2 = "https://checkout-m.lazada.co.th/cashier-polaris-result?wh_weex=true&hybrid=1&redirected=true&CASHIER=GC&checkoutOrderId=20990591103210628653160072221&pmntId=20990591211210628290760112221"
    let btn = UIButton.init(frame: CGRect.init(x: 100, y: 200, width: 200, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 6.0
        btn.layer.masksToBounds = true
        btn.setTitle("打开Lazada APP", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }

    @objc func btnTapped() {

        let url = URL.init(string: urlStr2)!
//        let url = URL.init(string: urlStr2)!
//        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
//        } else {
//            let alert = UIAlertController.init(title: "没有安装应用", message: nil, preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//                print("close")
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
    }
}

