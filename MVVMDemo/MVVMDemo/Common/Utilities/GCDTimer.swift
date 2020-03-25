//
//  GCDTimer.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation

typealias ActionBlock = () -> ()

class ZQGCDTimer {
    
    static let shared = ZQGCDTimer()
    
    lazy var timerContainer = [String: DispatchSourceTimer]()
    
    /// GCD定时器
    ///
    /// - Parameters:
    /// - name: 定时器名字
    /// - timeInterval: 时间间隔
    /// - queue: 队列
    /// - repeats: 是否重复
    /// - action: 执行任务的闭包
    func scheduledDispatchTimer(WithTimerName name: String?,
                                timeInterval: Double,
                                queue: DispatchQueue,
                                repeats: Bool,
                                action: @escaping ActionBlock)
    {
        
        guard let name = name else { return }
        
        var timer = timerContainer[name]
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
            timer?.resume()
            timerContainer[name] = timer
        }
        // 精度0.1秒
        timer?.schedule(deadline: .now(),
                        repeating: timeInterval,
                        leeway: DispatchTimeInterval.milliseconds(100))
        timer?.setEventHandler(handler: { [weak self] in
            action()
            if repeats == false {
                self?.cancelTimer(WithTimerName: name)
            }
        })
    }
    
    /// 取消定时器
    ///
    /// - Parameter name: 定时器名字
    func cancelTimer(WithTimerName name: String?) {
        guard let name = name else { return }
        let timer = timerContainer[name]
        if timer == nil { return }
        timerContainer.removeValue(forKey: name)
        timer?.cancel()
    }
    
    
    /// 检查定时器是否已存在
    ///
    /// - Parameter name: 定时器名字
    /// - Returns: 是否已经存在定时器
    func isExistTimer(WithTimerName name: String?) -> Bool {
        let name = name ?? ""
        if timerContainer[name] != nil { return true }
        
        return false
    }
    
}
