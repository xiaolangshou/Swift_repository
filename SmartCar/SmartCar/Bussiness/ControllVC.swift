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

class ControllVC: UIViewController {
    
    static let shared = ControllVC()
    
    let playerView = TLPlayerView()
    var stickView: StickView?
    
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
