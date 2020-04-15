//
//  CaptureViewController.swift
//  NativeCameraDemo
//
//  Created by Thomas Lau on 2020/4/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureViewController: UIViewController {
    
    var h264Encoder = H264Encoder.init()
    var captureSession = AVCaptureSession.init()
    var currentVideoDeviceInput: AVCaptureDeviceInput?
    var currentAudioDeviceInput: AVCaptureDeviceInput?
    var videoOutput = AVCaptureVideoDataOutput.init()
    var previedLayer = AVCaptureVideoPreviewLayer.init()
    var videoConnection: AVCaptureConnection?
    var focusCursorImageView = UIImageView.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "视频采集"
        view.backgroundColor = UIColor.white
        
        setupCaputureVideo()
    }

    func setupCaputureVideo() {
        
        let captureSession = AVCaptureSession.init()
        self.captureSession = captureSession
        
        // 设置采集质量
        if captureSession.canSetSessionPreset(AVCaptureSession.Preset.hd1280x720) {
            captureSession.sessionPreset = AVCaptureSession.Preset.hd1280x720
        }
        
        // 获取摄像头设备
        let videoDevice = self.getVideoDevice(position: AVCaptureDevice.Position.back)
        
        // 获取声音设备
        let audioDevice = AVCaptureDevice.default(for: AVMediaType.audio)
        
        // 创建对视频设备输入对象
        var videoDeviceInput: AVCaptureDeviceInput?
        do {
            videoDeviceInput = try AVCaptureDeviceInput.init(device: videoDevice!)
        } catch {
            print("AVCaptureDeviceInput error")
        }
        currentVideoDeviceInput = videoDeviceInput
        
        // 创建对音频设备输入对象
        var audioDeviceInput: AVCaptureDeviceInput?
        do {
            audioDeviceInput = try AVCaptureDeviceInput.init(device: audioDevice!)
        } catch {
            print("AVCaptureDeviceInput error")
        }
        currentAudioDeviceInput = audioDeviceInput
        
        // 添加到会话中
        
    }
    
    func getVideoDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        var devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for i in devices {
            if i.position == position {
                return i
            }
        }
        return nil
    }
}
