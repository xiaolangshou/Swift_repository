//
//  ViewController.swift
//  TLBLEDemo
//
//  Created by Thomas Lau on 2020/3/16.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import CoreBluetooth
import BLESDK

class ViewController: UIViewController {
    
    let cenMng: BLECentralManager?
    
    var readedCMData = ""
    var writedCMData = ""
    
    let recieveTF = UITextField(frame: CGRect(x: 60, y: 60, width: UIScreen.main.bounds.width - 70, height: 40))
    let writeTF = UITextField(frame: CGRect(x: 70, y: 110, width: UIScreen.main.bounds.width - 70, height: 30))
    let readBtn = UIButton(frame: CGRect(x: 10, y: 60, width: 45, height: 35))
    let writeBtn = UIButton(frame: CGRect(x: 10, y: 110, width: 50, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cenMng = BLECentralManager.init()
        cenMng.serviceUUID = "FFE0"
        cenMng.notifyWriteUUID = "FFE1"
        cenMng.writeUUID = "FFE2"
        cenMng.delegate = self
    }
    

    func setupView() {
        if #available(iOS 13.0, *) {
            recieveTF.backgroundColor = UIColor.systemGroupedBackground
        } else {
            recieveTF.backgroundColor = UIColor.groupTableViewBackground
        }
        recieveTF.textColor = UIColor.black
        view.addSubview(recieveTF)
        
        readBtn.backgroundColor = UIColor.cyan
        readBtn.setTitle("read", for: .normal)
        readBtn.addTarget(self, action: #selector(readBtnTapped), for: .touchUpInside)
        view.addSubview(readBtn)
        
        writeTF.backgroundColor = UIColor.yellow
        view.addSubview(writeTF)
        
        writeBtn.backgroundColor = UIColor.green
        writeBtn.setTitle("write", for: .normal)
        writeBtn.addTarget(self, action: #selector(writeBtnTapped), for: .touchUpInside)
        view.addSubview(writeBtn)
    }
    
    @objc func readBtnTapped() {
        cenMng.peripheral?.readValue(for: cenMng.characteristicCM!)
    }
    
    @objc func writeBtnTapped() {
        writedCMData = writeTF.text ?? ""
        let data = writedCMData.data(using: .utf8)
        cenMng.peripheral?.writeValue(data!, for: cenMng.characteristicCM!, type: .withResponse)
    }
}

extension ViewController: BLEDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        let data = characteristic.value
        let tempStr = String.init(data: data ?? Data(), encoding: String.Encoding.utf8) ?? ""
        if tempStr == " " {
            self.recieveTF.text = readedCMData
            readedCMData = ""
        }
        readedCMData.append(tempStr)
        print("接受到数据: \(readedCMData)")
    }
    
    
}
