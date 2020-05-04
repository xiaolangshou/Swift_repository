//
//  ViewController.swift
//  VideoCaptureDemo
//
//  Created by Thomas Lau on 2020/4/30.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAudioVideo()
    }
    
    func initMicroPhone() {
        
        let session = AVCaptureSession()
        var audioInput: AVCaptureDeviceInput?
        
        guard let audioCaptureDevice = AVCaptureDevice.default(for: AVMediaType.audio) else { return }

        do {
            audioInput = try AVCaptureDeviceInput.init(device: audioCaptureDevice)
            session.beginConfiguration()
            session.sessionPreset = AVCaptureSession.Preset.photo
        } catch {
            print("error")
        }
        
        if (audioInput == nil) {
            session.commitConfiguration()
        }
        if session.canAddInput(audioInput!) {
            session.addInput(audioInput!)
        } else {
            session.commitConfiguration()
        }
    }
    
    func initAudioVideo() {
        
        let session = AVCaptureSession.init()
        
        
        /// video settings
        var videoInput: AVCaptureDeviceInput?
        session.beginConfiguration()
        
        guard let videoDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        do {
            videoInput = try AVCaptureDeviceInput.init(device: videoDevice)
        } catch {
            print("error")
        }
        if videoInput == nil {
            // handle configuration video device
        }
        let videoPort = videoInput?.ports[0]
        
        
        /// audio settings
        var audioInput: AVCaptureDeviceInput?
        guard let audioDevice = AVCaptureDevice.default(for: AVMediaType.audio) else { return }
        do {
            audioInput = try AVCaptureDeviceInput.init(device: audioDevice)
        } catch {
            print("error")
        }
        if audioInput == nil {
            // handle configuration audio device
        }
        let audioPort = audioInput?.ports[0]
    
        
        let inputPorts: [AVCaptureInput.Port] = [videoPort!, audioPort!]
        let videoDataOutput: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput.init()
        let connection: AVCaptureConnection = AVCaptureConnection.init(inputPorts: inputPorts, output: videoDataOutput)
        if session.canAddConnection(connection) {
            session.addConnection(connection)
        } else {
            // handle session can not add AVCaptureConnection
            session.commitConfiguration()
            return
        }
        session.commitConfiguration()
    }

}

