//
//  ViewController.swift
//  LoopRequestDemo
//
//  Created by lian shan on 2021/4/1.
//

import UIKit

class ViewController: UIViewController {

    var successCount = 0
    var timerCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
    }

    func startTimer() {

        print("start timer...")

        if !LAGCDTimer.shared.isExistTimer(WithTimerName: "ipayRequest") {
            LAGCDTimer.shared.scheduledDispatchTimer(WithTimerName: "ipayRequest",
                                                     timeInterval: 1,
                                                     queue: .main,
                                                     repeats: true)
            {

                print(self.timerCount)

                if self.timerCount % 5 == 0 {
                    if self.networkRequest() {
                        self.successCount += 1
                    }
                    print("request...")
                }

                if self.timerCount == 15 {
                    print("end timer...")
                    LAGCDTimer.shared.cancelTimer(WithTimerName: "ipayRequest")
                    if self.successCount > 0 {
                        // success biz
                        print("request success")
                    } else {
                        // fail biz
                        print("time out")

                    }
                }

                self.timerCount += 1
            }
        }
    }

    func networkRequest() -> Bool {

        return NetworkRequest.requestData()
    }

}





