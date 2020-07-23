//
//  TLPlayerView.swift
//  SmartCar
//
//  Created by Thomas Lau on 2020/7/18.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import AVKit

class TLPlayerView: UIView {

    var playerLayer: AVPlayerLayer?
    
    let pauseBtn = UIButton()
    let replayBtn = UIButton()

    override func layoutSubviews() {
        super.layoutSubviews()
        
        playerLayer?.frame = self.bounds
        
        self.addSubview(pauseBtn)
        pauseBtn.setTitle("P", for: .normal)
        pauseBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        pauseBtn.frame = CGRect(x: 20, y: self.frame.size.height - 20, width: 20, height: 20)
        pauseBtn.addTarget(self, action: #selector(pause), for: .touchUpInside)
        
        self.addSubview(replayBtn)
        replayBtn.setTitle("R", for: .normal)
        replayBtn.backgroundColor = UIColor(white: 0.6, alpha: 0.3)
        replayBtn.frame = CGRect(x: 50, y: self.frame.size.height - 20, width: 20, height: 20)
        replayBtn.addTarget(self, action: #selector(replay), for: .touchUpInside)
    }
    
    @objc func pause() {
        playerLayer?.player?.pause()
    }
    
    @objc func replay() {
        playerLayer?.player?.play()
    }
}
