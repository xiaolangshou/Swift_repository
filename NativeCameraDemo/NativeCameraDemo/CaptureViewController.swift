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
        if captureSession.canAddInput(videoDeviceInput) {
            captureSession.addInput(videoDeviceInput)
        }
        if captureSession.canAddInput(audioDeviceInput) {
            captureSession.addInput(audioDeviceInput)
        }
        
        // 获取视频数据输出设备
        let videoOutput = AVCaptureVideoDataOutput.init()
        self.videoOutput = videoOutput
        
        // 是否抛弃延迟的帧
        videoOutput.alwaysDiscardsLateVideoFrames = true
        
        // 7.1 设置代理，捕获视频样品数据
        // 注意：队列必须是串行队列，才能获取到数据，而且不能为空
        let videoQueue = DispatchQueue.init(label: "Video Capture Queue")
        videoOutput.setSampleBufferDelegate(self, queue: videoQueue)
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
        //  7.2设置采集格式
        videoOutput.videoSettings = NSDictionary.init(object: NSNumber.init(value: kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange), forKey: id(kCVPixelBufferPixelFormatTypeKey))
        
        // 8.获取音频数据输出设备
        let audioOutput = AVCaptureVideoDataOutput.init()
        
        // 8.2 设置代理，捕获视频样品数据
        // 注意：队列必须是串行队列，才能获取到数据，而且不能为空
        let audioQueue = DispatchQueue.init(label: "Audio Capture Queue")
        audioOutput.setSampleBufferDelegate(self, queue: audioQueue)
        if captureSession.canAddOutput(audioOutput) {
            captureSession.addOutput(audioOutput)
        }
        // 9.获取视频输入与输出连接，用于分辨音视频数据
        self.videoConnection = videoOutput.connection(with: AVMediaType.video)
        
        // 10. 设置方向
        self.videoConnection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        // 11.添加视频预览图层
        let previedLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        previedLayer.frame = self.view.bounds
        previedLayer.backgroundColor = UIColor.black.cgColor
        self.view.layer.insertSublayer(previedLayer, at: 0)
        self.previedLayer = previedLayer
        // 12.启动会话
        captureSession.startRunning()
    }
    
    // 指定摄像头方向获取摄像头
    func getVideoDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        var devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            if device.position == position {
                return device
            }
        }
        return nil
    }
}
