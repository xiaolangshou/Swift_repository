//
//  ViewController.swift
//  WeexDemo
//
//  Created by lian shan on 2021/1/7.
//

import UIKit
import SnapKit
import WeexSDK

class ViewController: UIViewController {

    static let shared = ViewController()

    var sourceURL: URL?
    var params: [String: Any]?

    let instance = WXSDKInstance.init()
    var weexView = UIView()

    deinit {
        instance.destroy()
    }

    /// 需要完整的路径
    convenience init(server path: String, params: [String: Any]? = nil) {
        self.init(nibName: nil, bundle: nil)

        if let url = URL.init(string: path) {
            self.sourceURL = url
            self.params = params
        }
    }

    /// 加载本地 main bundle 里的 js
    convenience init(bundle fileName: String) {
        self.init(nibName: nil, bundle: nil)
        self.sourceURL = Bundle.main.url(forResource: fileName, withExtension: "js")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        WXSDKManager.bridgeMgr().fireEvent(instance.instanceId,
                                           ref: WX_SDK_ROOT_REF,
                                           type: "viewDidAppear",
                                           params: nil,
                                           domChanges: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        WXSDKManager.bridgeMgr().fireEvent(instance.instanceId,
                                           ref: WX_SDK_ROOT_REF,
                                           type: "viewDidDisappear",
                                           params: nil,
                                           domChanges: nil)
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
            self.weexView.snp.makeConstraints {
                $0.left.right.bottom.equalToSuperview()
                $0.top.equalTo(100)
            }
            self.weexView.backgroundColor = UIColor.cyan
        }

        instance.onFailed = { error in
            print("failed: \(error.localizedDescription)")
        }

        instance.renderFinish = { view in
            print("render finish!")
        }

        guard let url = sourceURL  else {
            assertionFailure("weex url is nil")
            return
        }
        let dict = url.urlParams
        let dic = NSDictionary.init(dictionary: ["fields" : ["alipayImage": "sss"]])
        _ = self.getJSONStringFromDictionary(dictionary: dic)

        instance.render(with: url, options: self.params ?? dict ?? [:], data: dic)
    }


    func getJSONStringFromDictionary(dictionary:NSDictionary) -> NSString {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString!
    }
}

extension URL {
    
    var urlParams: [String: Any]? {
        guard let query = self.query else { return nil }
        var dict: [String: Any] = [:]
        let params = query.split(separator: "&").map { String.init($0) }
        for p in params {
            let arr = p.split(separator: "=").map { String.init($0) }
            if arr.count == 2 {
                dict[arr[0]] = arr[1]
            }
        }
        return dict
    }
}
