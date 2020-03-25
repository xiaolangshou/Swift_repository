//
//  ViewController.swift
//  LiveVideoDemo
//
//  Created by Thomas Lau on 2018/6/23.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    let urlStr = "http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4"
    let urlStr2 = "http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"
    var playerView = ZQPlayerView()
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlayer()
    }

    func setupPlayer() {
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
    
        playerView.frame = CGRect.init(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 200)
        view.addSubview(playerView)
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
            if playerItem.status == AVPlayerItemStatus.readyToPlay {
                // 只有在这个状态下才能播放
                self.player?.play()
            } else {
                print("加载异常")
            }
        }
    }
}

