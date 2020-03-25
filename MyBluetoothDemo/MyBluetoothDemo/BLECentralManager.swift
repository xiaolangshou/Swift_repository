//
//  BLECentralManager.swift
//  TLBLEDemo
//
//  Created by Thomas Lau on 2020/3/16.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import CoreBluetooth

public protocol BLEDelegate: NSObjectProtocol {
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?)
    func startScanPeriphrals()
    func didDiscoverPeriphrals(name: String)
    func startConnectPeriphral(name: String)
    func connectSuccessful()
    func connectFail()
    func reconnect()
}

public class BLECentralManager: NSObject {
    
    public weak var delegate: BLEDelegate?
    
    public var serviceUUID = ""
    public var notifyWriteUUID = ""
    public var writeUUID = ""
    
    var centralManager: CBCentralManager?
    public var peripheral: CBPeripheral?
    public var characteristicCM: CBCharacteristic?
    
    func initCenMng() {
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    public override init() {
        super.init()
        
        initCenMng()
    }
    
    func cancelConnection() {
        if peripheral != nil {
            centralManager?.cancelPeripheralConnection(peripheral!)
        }
    }

}

extension BLECentralManager: CBCentralManagerDelegate, CBPeripheralDelegate {
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
            case .unknown:
                print("未知的")
            case .resetting:
                print("重置中")
            case .unsupported:
                print("不支持")
            case .unauthorized:
                print("未验证")
            case .poweredOff:
                print("未启动")
            case .poweredOn:
                print("可用，开始扫描外围设备...")
                delegate?.startScanPeriphrals()
                central.scanForPeripherals(withServices: [CBUUID(string: serviceUUID)], options: nil)
            @unknown default:
                fatalError("unknow error")
        }
    }
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
        print("发现周边设备...\(peripheral)")
        delegate?.didDiscoverPeriphrals(name: peripheral.name ?? "")
        self.peripheral = peripheral
        if peripheral.name == "BT18" {
            delegate?.startConnectPeriphral(name: peripheral.name ?? "")
            print("开始连接\(peripheral.name ?? "")")
            central.connect(peripheral, options: nil)
        }
    }
    
    
    public func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        self.centralManager?.stopScan()
        peripheral.delegate = self
        peripheral.discoverServices([CBUUID.init(string: serviceUUID)])
        delegate?.connectSuccessful()
        print("连接成功, 查找服务")
    }
    
    public func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        delegate?.connectFail()
        print("连接失败")
    }
    
    public func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("连接断开,重新连接")
        delegate?.reconnect()
        central.connect(peripheral, options: nil)
    }
    
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service: CBService in peripheral.services! {
            print("外设中的服务有:\(service)")
        }
        
        // 本例中的外设只有一个服务
        let service = peripheral.services?.last
        // 根据UUID寻找服务中的特征
        peripheral.discoverCharacteristics([CBUUID.init(string: notifyWriteUUID), CBUUID.init(string: writeUUID)], for: service!)
    }
    
    /** 发现特征 */
    public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        for characteristic: CBCharacteristic in service.characteristics! {
            print("外设中的特征有：\(characteristic)")
        }
        
        // 先测试第一个特征
        self.characteristicCM = service.characteristics?.first
        // 读取特征里的数据
        peripheral.readValue(for: self.characteristicCM!)
        // 订阅
        peripheral.setNotifyValue(true, for: self.characteristicCM!)
    }
    
    /** 订阅状态 */
    public func peripheral(_ peripheral: CBPeripheral,
                    didUpdateNotificationStateFor characteristic: CBCharacteristic,
                    error: Error?)
    {
        if let error = error {
            print("订阅失败: \(error)")
            return
        }
        if characteristic.isNotifying {
            print("订阅成功")
        } else {
            print("取消订阅")
        }
    }
    
    /** 接收到数据 */
    public func peripheral(_ peripheral: CBPeripheral,
                    didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?)
    {
        delegate?.peripheral(peripheral, didUpdateValueFor: characteristic, error: error)
    }

    /** 写入数据的回调 */
    public func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        print("写入了数据")
    }
}
