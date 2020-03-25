//
//  ViewController.swift
//  MyBluetoothDemo
//
//  Created by Thomas Lau on 2020/3/17.
//  Copyright © 2020 TLLTD. All rights reserved.
//
import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var cenMng: BLECentralManager? = nil
    var alert: UIAlertController? = nil
    
    var readedCMData = ""
    var writedCMData = ""
    
    let recieveTF = UITextField(frame: CGRect(x: 100, y: 200, width: UIScreen.main.bounds.width - 130, height: 30))
    let writeTF = UITextField(frame: CGRect(x: 100, y: 250, width: UIScreen.main.bounds.width - 130, height: 30))
    let readBtn = UIButton(frame: CGRect(x: 10, y: 200, width: 80, height: 35))
    let writeBtn = UIButton(frame: CGRect(x: 10, y: 250, width: 80, height: 30))
    let startBtn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: 100, width: 100, height: 40))
    let slider = UISlider.init(frame: CGRect(x: 80, y: 300, width: UIScreen.main.bounds.width - 100, height: 25))
    let sliderVLbl = UILabel.init(frame: CGRect.init(x: 10, y: 330, width: 50, height: 25))
    
//    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        
        startBtn.backgroundColor = UIColor.green
        startBtn.setTitle("启动蓝牙", for: .normal)
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        view.addSubview(startBtn)
        
        if #available(iOS 13.0, *) {
            recieveTF.backgroundColor = UIColor.systemGroupedBackground
        } else {
            recieveTF.backgroundColor = UIColor.groupTableViewBackground
        }
        recieveTF.textColor = UIColor.black
        view.addSubview(recieveTF)
        
        readBtn.backgroundColor = UIColor.cyan
        readBtn.setTitle("读取数据", for: .normal)
        readBtn.addTarget(self, action: #selector(readBtnTapped), for: .touchUpInside)
        view.addSubview(readBtn)
        
        writeTF.backgroundColor = UIColor.yellow
        view.addSubview(writeTF)
        
        writeBtn.backgroundColor = UIColor.green
        writeBtn.setTitle("发送数据", for: .normal)
        writeBtn.addTarget(self, action: #selector(writeBtnTapped), for: .touchUpInside)
        view.addSubview(writeBtn)
        
        view.addSubview(slider)
        slider.backgroundColor = UIColor.lightText
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(sliderBtnTapped), for: .valueChanged)
        
        view.addSubview(sliderVLbl)
        sliderVLbl.text = String(slider.value)
    }
    
    @objc func sliderBtnTapped() {
        writedCMData = String(Int(slider.value))//String(format:"%.1f", slider.value)
        print(writedCMData)
        let data = writedCMData.data(using: .utf8)
        cenMng!.peripheral?.writeValue(data!, for: cenMng!.characteristicCM!, type: .withResponse)
        sliderVLbl.text = String(slider.value)
    }
    
    @objc func startBtnTapped() {
        
        cenMng = BLECentralManager.init()
        cenMng!.serviceUUID = "FFE0"
        cenMng!.notifyWriteUUID = "FFE1"
        cenMng!.writeUUID = "FFE2"
        cenMng!.delegate = self
    }
    
    @objc func readBtnTapped() {
        cenMng!.peripheral?.readValue(for: cenMng!.characteristicCM!)
    }
    
    @objc func writeBtnTapped() {
        writedCMData = writeTF.text ?? ""
        let data = writedCMData.data(using: .utf8)
        cenMng!.peripheral?.writeValue(data!, for: cenMng!.characteristicCM!, type: .withResponse)
    }
}

extension ViewController: BLEDelegate {
    
    func startScanPeriphrals() {
        alert = UIAlertController(title: "电源开启, 开始扫描外围设备", message: nil, preferredStyle: .alert)
        self.present(alert!, animated: true, completion: nil)
    }
    
    func didDiscoverPeriphrals(name: String) {
        alert?.title = "发现设备:\(name)"
    }
    
    func startConnectPeriphral(name: String) {
        alert?.title = "开始连接外围设备:\(name)"
    }
    
    func connectSuccessful() {
        alert?.title = "连接成功"
        dismissing()
    }
    
    func connectFail() {
        alert?.title = "连接失败"
        dismissing()
    }
    
    func reconnect() {
        alert?.title = "连接断开, 重新连接中"
    }
    
    func dismissing() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [weak self] in
            if !(self?.alert!.isBeingDismissed)! {
                self?.alert?.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        let data = characteristic.value
        let tempStr = String.init(data: data ?? Data(), encoding: String.Encoding.utf8) ?? ""
        var temperature = ""
        var humdity = ""
        for (i, s) in tempStr.split(separator: " ").enumerated() {
            if i == 1 {
                humdity.append(String(s))
            } else {
                temperature.append(String(s))
            }
        }
        readedCMData = "温度:\(temperature)C  湿度: \(humdity)%"
        recieveTF.text = readedCMData
        print("接受到数据: \(tempStr)")
    }
}
