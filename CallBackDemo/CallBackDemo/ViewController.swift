//
//  ViewController.swift
//  CallBackDemo
//
//  Created by lian shan on 2021/3/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


class Service {
    var count = 0
    static let retryCount = 3
    let completionHandler: (Bool) -> Void
    init(completionHandler: @escaping (Bool) -> Void) {
        self.completionHandler = completionHandler
    }

    func start() {
        tryRequest()
    }

    private func tryRequest() {
        count += 1

        guard count <= Self.retryCount else {
            completionHandler(false)
            return
        }

        let req = MtopExtRequest(apiName: "", apiVersion: "1.0")!
        req.succeedBlock = { [weak self] resp in
            guard let self = self else {return }

            if self.handleBiz(resp) {
                self.completionHandler(true)
            } else {
                self.tryRequest()
            }
        }

        req.failedBlock = {[weak self] resp in
            guard let self = self else {return }
            self.tryRequest()
        }
        LAMtopService.async_call(req, delegate: nil, startFilter: nil)
    }

    private func handleBiz(_ resp: MtopExtResponse?) -> Bool {
        // biz if else
        return true
    }
}
