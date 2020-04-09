//
//  ViewController.swift
//  PiemontePlayer
//
//  Created by Thomas Lau on 2020/3/25.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import Player

class ViewController: UIViewController {
    
    var player = Player()
    let videoUrl = URL(string: "http://169.254.252.249:8080/?action=stream")
    let videoUrl2 = URL(string: "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.player.playFromBeginning()
    }
    
    deinit {
        self.player.willMove(toParent: nil)
        self.player.view.removeFromSuperview()
        self.player.removeFromParent()
    }

    func setupView() {
        
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        
        self.player.playerView.playerBackgroundColor = .black
        
        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
        
//        let localUrl = Bundle.main.url(forResource: "IMG_3267", withExtension: "MOV")
//        self.player.url = localUrl
        URLSessionConfiguration.default.multipathServiceType = .handover
        self.player.url = videoUrl2
        
        self.player.playbackLoops = true
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.player.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func playPause() {
        
        self.player.playFromBeginning()

    }
}

extension ViewController: PlayerDelegate, PlayerPlaybackDelegate {
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch self.player.playbackState {
        case .stopped:
            self.player.playFromBeginning()
            break
        case .paused:
            self.player.playFromCurrentTime()
            break
        case .playing:
            self.player.pause()
            break
        case .failed:
            self.player.pause()
            break
        }
    }
    
    func playerReady(_ player: Player) {
        print("\(#function) ready")
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        print("\(#function) \(player.playbackState.description)")
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        print("playerBufferingStateDidChange")
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        print("playerBufferTimeDidChange")
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        print("\(#function) error.description")
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
        
        let fraction = Double(player.currentTime) / Double(player.maximumDuration)
        print("progress: \(fraction)")
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        print("playerPlaybackWillStartFromBeginning")
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        print("playerPlaybackDidEnd")
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        print("playerPlaybackWillLoop")
    }
    
    
}
