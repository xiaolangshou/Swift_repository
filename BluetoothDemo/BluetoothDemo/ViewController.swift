//
//  ViewController.swift
//  BluetoothDemo
//
//  Created by Liu Tao on 2020/3/1.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    var centralManager: CBCentralManager?
    var listTableView: UITableView?
    var serviceTableView: UITableView?
    var bleArr = [CBPeripheral]()
    var serviceArr = [CBService]()
    var btn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        
        btn = UIButton.init(frame: CGRect.init(x: 160, y: 20, width: 100, height: 28))
        btn?.setTitle("搜索外围设备", for: .normal)
        btn?.backgroundColor = UIColor.cyan
        btn?.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        view.addSubview(btn!)
        
        listTableView = UITableView.init(frame: CGRect.init(x: 0, y: 120, width: UIScreen.main.bounds.size.width, height: 200))
        listTableView?.tag = 0
        view.addSubview(listTableView ?? UITableView())
        listTableView?.backgroundColor = UIColor.white
        listTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        listTableView?.rowHeight = 50
        listTableView?.delegate = self
        listTableView?.dataSource = self
        
        serviceTableView = UITableView.init(frame: CGRect.init(x: 0, y: 330, width: UIScreen.main.bounds.size.width, height: 200))
        serviceTableView?.tag = 1
        view.addSubview(serviceTableView ?? UITableView())
        serviceTableView?.backgroundColor = UIColor.white
        serviceTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        serviceTableView?.rowHeight = 50
        serviceTableView?.delegate = self
        serviceTableView?.dataSource = self
    }
    
    @objc func btnTapped() {
        setupBLE()
        btn?.setTitle("...", for: .normal)
    }

    func setupBLE() {
        centralManager = CBCentralManager.init(delegate: self, queue: nil)
    }
    
}

extension ViewController: CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch (central.state) {
        case .unknown:
                print(">>>CBCentralManagerStateUnknown");
                break
        case .resetting:
                print(">>>CBCentralManagerStateResetting");
                break
        case .unsupported:
                print(">>>CBCentralManagerStateUnsupported");
                break
        case .unauthorized:
                print(">>>CBCentralManagerStateUnauthorized");
                break
        case .poweredOff:
                print(">>>CBCentralManagerStatePoweredOff");
                break
        case .poweredOn:
            print(">>>CBCentralManagerStatePoweredOn");
                // 开始扫描周围的外设。
                /*
                 -- 两个参数为Nil表示默认扫描所有可见蓝牙设备。
            --注意：第一个参数是用来扫描有指定服务的外设。然后有些外设的服务是相同的，比如都有FFF5服务，那么都会发现；而有些外设的服务是不可见的，就会扫描不到设备。
                 -- 成功扫描到外设后调用didDiscoverPeripheral
                 */
            self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
                break
            default:
                break
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Find device:%@", peripheral.name ?? "no name")
        bleArr.append(peripheral)
        listTableView?.reloadData()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("连接成功...")
        //连接成功后停止扫描，节省内存
        central.stopScan()
        peripheral.delegate = self
    
        //扫描外设的服务
        /**
         --     外设的服务、特征、描述等方法是CBPeripheralDelegate的内容，所以要先设置代理peripheral.delegate = self
         --     参数表示你关心的服务的UUID，比如我关心的是"FFE0",参数就可以为@[[CBUUID UUIDWithString:@"FFE0"]].那么didDiscoverServices方法回调内容就只有这两个UUID的服务，不会有其他多余的内容，提高效率。nil表示扫描所有服务
         --     成功发现服务，回调didDiscoverServices
         */
        peripheral.discoverServices(nil)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?)
    {
        print("FailToConnect, error: \(String(describing: error))")
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?)
    {
        print("did disconnect peripheral: \(String(describing: peripheral.name))")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?)
    {
        
        for sev in peripheral.services ?? [CBService]()  {
            if sev.uuid.uuidString == "9FA480E0-4967-4542-9390-D343DC5D04AE" {
                peripheral.discoverCharacteristics(nil, for: sev)
            }
        }
        serviceArr = peripheral.services!
        serviceTableView?.reloadData()
        print("did discover services, error:\(String(describing: error))")
        print("peripheral serverices = \(String(describing: peripheral.services))")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?)
    {
        for charc in service.characteristics! {
            print("charc.uuid = \(charc.uuid)")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.tag == 0 {
            return bleArr.count
        } else if tableView.tag == 1 {
            return serviceArr.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL") else {
            return UITableViewCell()
        }
        
        if tableView.tag == 0 {
            cell.textLabel?.text = "\(bleArr[indexPath.row].name ?? "")"
            print("cell text : \(cell.textLabel?.text! ?? "")")
        } else if tableView.tag == 1 {
            cell.textLabel?.text = "\(serviceArr[indexPath.row].uuid.uuidString)"
            print("cell text : \(cell.textLabel?.text! ?? "")")
        } else { }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        centralManager?.connect(bleArr[indexPath.row], options: nil)
    }
    
}
