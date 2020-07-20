//
//  ControllVC.swift
//  SmartCar
//
//  Created by Thomas Lau on 2020/7/18.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import AVKit
import SnapKit
import AVFoundation
import CocoaMQTT

class ControllVC: UIViewController {
    
    static let shared = ControllVC()
    
    let playerView = TLPlayerView()
    
    var mqttMng: MQTTMng?
    var stickView: StickView?
    var slider: UISlider?
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    var urlStr = "http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DirectionTool.topViewController = navigationController?.topViewController;
        DirectionTool.forceOrientationAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        initMQTT()
    }

    func setupView() {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setupLayer()
        
        stickView = StickView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.height, height: view.frame.width))
        view.addSubview(stickView ?? UIView())
        stickView?.frontBtnTap = {
            print(#function)
        }
        stickView?.backBtnTap = {
            print(#function)
        }
        stickView?.leftBtnTap = {
            print(#function)
        }
        stickView?.rightBtnTap = {
            print(#function)
        }
        
        slider = UISlider()
        view.addSubview(slider!)
        slider!.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.left.equalTo(10)
            make.top.equalTo(60)
        }
        slider!.minimumValue = 0
        slider!.maximumValue = 100
        slider!.addTarget(self, action: #selector(SliderChanged), for: .valueChanged)
    }
    
    @objc func SliderChanged(_ slider: UISlider) {
        print(slider.value)
    }
    
    func setupLayer() {
        guard let url = URL(string: urlStr) else { fatalError("连接错误") }
        
        playerItem = AVPlayerItem(url: url)
        // 监听缓冲进度改变
        playerItem?.addObserver(self, forKeyPath: "loadedTimeRanges", options: .new, context: nil)
        // 监听状态改变
        playerItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer?.contentsScale = UIScreen.main.scale
        playerView.playerLayer = self.playerLayer
        playerView.layer.insertSublayer(playerLayer!, at: 0)
    
        view.addSubview(playerView)
        playerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func initMQTT() {
//        self.mqttMng = MQTTMng.init(clientID: <#String#>,
//                                    host: <#String#>,
//                                    port: <#UInt16#>,
//                                    username: <#String#>,
//                                    password: <#String#>,
//                                    topic: <#String#>,
//                                    message: <#String#>,
//                                    keepAlive: 90)
        
        self.mqttMng?.mqtt!.delegate = self
    }
    
    deinit {
        playerItem?.removeObserver(self, forKeyPath: "loadedTimeRanges")
        playerItem?.removeObserver(self, forKeyPath: "status")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let playerItem = object as? AVPlayerItem else { return }
        if keyPath == "loadedTimeRanges"{
            // 缓冲进度 暂时不处理
        } else if keyPath == "status" {
            // 监听状态改变
            if playerItem.status == AVPlayerItem.Status.readyToPlay {
                // 只有在这个状态下才能播放
                self.player?.play()
            } else {
                print("加载异常")
            }
        }
    }
}

extension ControllVC: CocoaMQTTDelegate {

    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            mqtt.subscribe("topic", qos: CocoaMQTTQOS.qos1)
            mqtt.ping()
        }
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("didPublishMessage with message: \(String(describing: message.string))")
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("didPublishAck with id: \(id)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {

        print("didReceivedMessage: \(String(describing: message.string)) with id \(id)")

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MQTTMessageNotification"),
                                        object: self,
                                        userInfo: ["message": message.string!, "topic": message.topic])
    }

    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        print("didSubscribeTopic to \(topics)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
         print("didUnsubscribeTopic to \(topic)")
    }

    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print(#function)
    }

    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print(#function)
    }

    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print(#function)
    }

}
