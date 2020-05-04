//
//  ViewController.swift
//  GCDDemo_Semaphore
//
//  Created by Thomas Lau on 2020/5/2.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        semaphoreSync()
    }

    // signal加一，wait减一，为零时等待，大于零时执行往后操作
    func semaphoreSync() {
        
        var number = 0
        let semaphoreSignal = DispatchSemaphore(value: 0)
        let globalQueue = DispatchQueue.global()
        
        let workItem = DispatchWorkItem {
            Thread.sleep(forTimeInterval: 1)
            print("change number, thread = \(Thread.current)")
            number = 100
            semaphoreSignal.signal()
        }
        
        print("semaphore begin")
        print("number = \(number), thread =\(Thread.current)")
        globalQueue.async(execute: workItem)
        semaphoreSignal.wait()
        print("number = \(number)")
        print("semaphore end")
    }
}

