//
//  ViewController.swift
//  NativeCameraDemo
//
//  Created by Liu Tao on 2020/4/4.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import AVFoundation
 
class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIAlertViewDelegate {
 
    /// 摄像头授权状态
    var cameraAuthStatus: AVAuthorizationStatus!
    /// 预览Layer
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    /// Session
    var session: AVCaptureSession!
    
    /// 硬件Input
    var captureInput: AVCaptureDeviceInput!
    
    /// 数据Output
    var captureOutput: AVCaptureVideoDataOutput!
    
    var customImgView: UIImageView!
    
    /**
     跳转至设置
     */
    func openSettings() {
        
        let settingsURL:NSURL = NSURL(string: UIApplication.openSettingsURLString)!
        UIApplication.shared.canOpenURL(settingsURL as URL)
    
    }
    
    /**
     Check video authorization status
     */
    func checkVideoAuth() {
 
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        {
        case AVAuthorizationStatus.authorized://已经授权
            self.cameraAuthStatus = AVAuthorizationStatus.authorized
            break
        case AVAuthorizationStatus.notDetermined:
            
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                
                if(granted){
                    //受限制
                    self.cameraAuthStatus = AVAuthorizationStatus.restricted
                    exit(0)
                }
                
            })
            
            break
        case AVAuthorizationStatus.denied:
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
                
                if(!granted){
                    //否认
                    self.cameraAuthStatus = AVAuthorizationStatus.denied
                    
                    let warnMsg = UIAlertView(title: "提示",
                                             message: "摄像头权限未未开启,点击确认跳转至设置",
                                             delegate: self,
                                             cancelButtonTitle: "确认")
                    warnMsg.show()
                }
            })
            break
        default:
            break
        }
    }
    
    /**
     摄像头设置相关
     */
    func setupCamera() {
        
        self.session = AVCaptureSession()
        let device = AVCaptureDevice.default(for: AVMediaType.video)!
        self.captureOutput = AVCaptureVideoDataOutput()
        do {
            try self.captureInput = AVCaptureDeviceInput(device: device)
        } catch let error as NSError {
            print(error)
        }
        
        
        self.checkVideoAuth()
 
        self.session.beginConfiguration()
        // 画面质量设置
        self.session.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let dic = [kCVPixelBufferPixelFormatTypeKey: NSNumber(value: kCVPixelFormatType_32BGRA)]
        var videoSettings = AVCaptureVideoDataOutput().videoSettings
        videoSettings = dic as [String : Any]
        self.captureOutput.videoSettings = videoSettings
        if (self.session.canAddInput(self.captureInput)) {
            self.session.addInput(self.captureInput)
        }
        if (self.session.canAddOutput(self.captureOutput)) {
            self.session.addOutput(self.captureOutput)
        }
        
        let subQueue = DispatchQueue.init(label: "subQueue")
        captureOutput.setSampleBufferDelegate(self, queue: subQueue)
        
        //预览Layer设置
        self.captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        self.captureVideoPreviewLayer.frame = CGRect(x: self.view.frame.size.width / 2 - (320/2),
                                                          y: 100, width: 320, height: 240)
        self.captureVideoPreviewLayer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(self.captureVideoPreviewLayer)
        self.session.commitConfiguration()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCamera()
        
        customImgView = UIImageView(frame: CGRect(x: captureVideoPreviewLayer.frame.origin.x,
                                                       y: 350,
                                                       width: 320,
                                                       height: 240))
        customImgView.backgroundColor = UIColor.cyan
        view.addSubview(customImgView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.session.startRunning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.session.stopRunning()
        super.viewWillDisappear(animated)
    }
    
    /**
     数据流BufferRef转Image
     
     - parameter sampleBuffer: 数据流
     
     - returns: UIImage
     */
    func getImageData(sampleBuffer:CMSampleBuffer!) -> UIImage {
    
        let imageBuffer:CVImageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        CVPixelBufferLockBaseAddress(imageBuffer, [])
        
        let bytesPerRow: size_t = CVPixelBufferGetBytesPerRow(imageBuffer)
        let width: size_t  = CVPixelBufferGetWidth(imageBuffer)
        let height: size_t = CVPixelBufferGetHeight(imageBuffer)
        
        
        let safepoint: UnsafeMutableRawPointer = CVPixelBufferGetBaseAddress(imageBuffer)!
        
        let bitMapInfo:UInt32 = CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue
        
        //RGB
        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let context:CGContext = CGContext(data: safepoint, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitMapInfo)!
        
        let quartImage: CGImage = context.makeImage()!
        CVPixelBufferUnlockBaseAddress(imageBuffer, [])
        
        return UIImage(cgImage: quartImage, scale: 1, orientation: UIImage.Orientation.right)
    }
    
    //AVCaptureVideoDataOutputSampleBufferDelegate
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!){
        
        let localImg = self.getImageData(sampleBuffer: sampleBuffer)
        
        //GCD 主线程队列中刷新UI
        DispatchQueue.main.async {
            self.customImgView.image = localImg
        }
        
    }
    
    //UIAlertViewDelegate
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int){
        
        if(buttonIndex == 0){
            self.openSettings()
        }
        
    }
}