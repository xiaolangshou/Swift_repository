//
//  ViewController.swift
//  CameraDemo
//
//  Created by Thomas Lau on 2020/3/23.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var urlStr = "http://169.254.252.249:8080/?action=stream"
    var tcpMag = TCPManager.init()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //addWebView()
    }
    
    func addWebView() {
        let v = UIWebView.init(frame: CGRect.init(x: 50, y: 90, width: 200, height: 200))
        view.addSubview(v)
        v.loadRequest(URLRequest.init(url: URL.init(string: urlStr)!))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupConnection()
    }
    
    func setupConnection() {
        
        _ = tcpMag.connect(ip: "169.254.252.249", port: 8080)
        tcpMag.delegate = self
    }

}

extension ViewController: TCPManagerDelegate {
    
    func didConnectToHost(host: String, port: UInt16) {
        
    }
    
    func didReadData(data: Data, withTag tag: Int) {
        print("data = \(data), tag = \(tag)")
    }
    
    
}

