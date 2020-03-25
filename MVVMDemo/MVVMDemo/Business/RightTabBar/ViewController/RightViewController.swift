//
//  RightViewController.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/11/29.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import Charts
import RxCocoa
import RxSwift
import Starscream

class RightViewController: UIViewController {

    static let shared = RightViewController()
    
    var viewModel: RightViewModel!
    var yAxis = YAxis(position: .left)
    var yAxis2 = YAxis(position: .left)
    var yAxis3 = YAxis(position: .left)
    var xAixs = XAxis()
    var xAixs2 = XAxis()
    var xAixs3 = XAxis()
    var motorCount = 0
    var motorTempArr = [ChartDataEntry]()
    
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    let timeChartTitleView = TopTitleView()
    let timeChartView = LineChartView()
    let timeBackView = UIView()
    
    let frequencyTitleView = TopTitleView()
    let frequencyChartView = LineChartView()
    let frequencyBackView = UIView()
    
    let motorTitleView = TopTitleView()
    let motorTempView = LineChartView()
    let motorBackView = UIView()
    
    let realTimeDataView = RealDataView()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.connect()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.disconnect()
    }
    

    func setupViewModel() {
        
        viewModel = RightViewModel()
        viewModel.delegate = self
    }
    
    func setupView() {
        
        scrollView.becomeSubviewIn(view)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        containerView.becomeSubviewIn(scrollView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        // time chart view
        timeChartTitleView.title = "Time Domain Chart"
        timeChartTitleView.becomeSubviewIn(containerView)
        timeChartTitleView.snp.makeConstraints { (make) in
            make.top.equalTo(UIDevice.statusBarHeight)
            make.left.right.equalTo(0)
            make.height.equalTo(TopTitleView.size.h)
        }
        
        timeBackView.cornerRadius = 4.0
        timeBackView.borderColor = UIColor.red
        timeBackView.borderWidth = 1.0
        timeBackView.becomeSubviewIn(containerView)
        timeBackView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo((UIScreen.height - UIDevice.statusBarHeight) / 2)
            make.top.equalTo(timeChartTitleView.snp.bottom).offset(-10)
        }
        containerView.sendSubviewToBack(timeBackView)
        
        timeChartView.backgroundColor = UIColor.cyan
        timeChartView.noDataText = "Temporarily no time domain data"
        timeChartView.becomeSubviewIn(timeBackView)
        timeChartView.backgroundColor = UIColor.lightText
        timeChartView.snp.makeConstraints { (make) in
            make.top.equalTo(timeChartTitleView.snp.bottom)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(((UIScreen.height - UIDevice.statusBarHeight) / 2) - 5)
        }
        
        timeChartView.chartDescription?.enabled = false
        timeChartView.scaleXEnabled = false
        timeChartView.scaleYEnabled = false
        
        yAxis = timeChartView.leftAxis
        yAxis.removeAllLimitLines()
        yAxis.drawLimitLinesBehindDataEnabled = true
        
        xAixs = timeChartView.xAxis
        xAixs.labelPosition = .bottom
        
        timeChartView.rightAxis.enabled = false
        timeChartView.legend.form = .line
        timeChartView.animate(xAxisDuration: 0)
        
        // frequency chart view
        frequencyTitleView.title = "Frequency Domain Chart"
        frequencyTitleView.becomeSubviewIn(containerView)
        frequencyTitleView.snp.makeConstraints { (make) in
            make.top.equalTo(timeBackView.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(TopTitleView.size.h)
        }
        
        frequencyBackView.cornerRadius = 4.0
        frequencyBackView.borderColor = UIColor.red
        frequencyBackView.borderWidth = 1.0
        frequencyBackView.becomeSubviewIn(containerView)
        frequencyBackView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo((UIScreen.height - UIDevice.statusBarHeight) / 2)
            make.top.equalTo(frequencyTitleView.snp.bottom).offset(-10)
        }
        containerView.sendSubviewToBack(frequencyBackView)
        
        frequencyChartView.noDataText = "Temporarily no frequency domain data"
        frequencyChartView.becomeSubviewIn(frequencyBackView)
        frequencyChartView.backgroundColor = UIColor.lightText
        frequencyChartView.snp.makeConstraints { (make) in
            make.top.equalTo(frequencyTitleView.snp.bottom)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(((UIScreen.height - UIDevice.statusBarHeight) / 2) - 5)
        }
        
        frequencyChartView.chartDescription?.enabled = false
        frequencyChartView.scaleXEnabled = false
        frequencyChartView.scaleYEnabled = false
        
        yAxis2 = frequencyChartView.leftAxis
        yAxis2.removeAllLimitLines()
        yAxis2.drawLimitLinesBehindDataEnabled = true
        
        xAixs2 = frequencyChartView.xAxis
        xAixs2.labelPosition = .bottom
        
        frequencyChartView.rightAxis.enabled = false
        frequencyChartView.legend.form = .line
        frequencyChartView.animate(xAxisDuration: 0)
        
        // motor temper view
        motorTitleView.title = "Motor Temperature Chart"
        motorTitleView.becomeSubviewIn(containerView)
        motorTitleView.snp.makeConstraints { (make) in
            make.top.equalTo(frequencyBackView.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(TopTitleView.size.h)
        }
        
        motorBackView.cornerRadius = 4.0
        motorBackView.borderColor = UIColor.red
        motorBackView.borderWidth = 1.0
        motorBackView.becomeSubviewIn(containerView)
        motorBackView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo((UIScreen.height - UIDevice.statusBarHeight) / 2)
            make.top.equalTo(motorTitleView.snp.bottom).offset(-10)
        }
        containerView.sendSubviewToBack(motorBackView)
        
        motorTempView.noDataText = "Temporarily no motor temperature data"
        motorTempView.becomeSubviewIn(motorBackView)
        motorTempView.backgroundColor = UIColor.lightText
        motorTempView.snp.makeConstraints { (make) in
            make.top.equalTo(motorTitleView.snp.bottom)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(((UIScreen.height - UIDevice.statusBarHeight) / 2) - 5)
        }
        motorTempView.chartDescription?.enabled = false
        motorTempView.scaleXEnabled = false
        motorTempView.scaleYEnabled = false
        
        yAxis3 = motorTempView.leftAxis
        yAxis3.removeAllLimitLines()
        yAxis3.drawLimitLinesBehindDataEnabled = true
        
        xAixs3 = motorTempView.xAxis
        xAixs3.labelPosition = .bottom
        
        motorTempView.rightAxis.enabled = false
        motorTempView.legend.form = .line
        motorTempView.animate(xAxisDuration: 0)
        
        // otherData view
        realTimeDataView.becomeSubviewIn(containerView)
        realTimeDataView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(motorBackView.snp.bottom).offset(10)
            make.bottom.equalTo(-UIScreen.safeAreaBottomHeight)
            make.height.greaterThanOrEqualTo(13 * 30)
        }
    }
    
    func setDataCount(values: [ChartDataEntry]) {
        
        let set = LineChartDataSet(values: values, label: "time domain")
        set.drawIconsEnabled = false
        set.drawCirclesEnabled = false

        set.setColor(.red)
        set.lineWidth = 0.5
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineWidth = 1
        set.formSize = 15

        let data = LineChartData(dataSet: set)

        timeChartView.data = data
    }
    
    func setFFTDataCount(values: [ChartDataEntry]) {
        
        let set = LineChartDataSet(values: values, label: "frequency domain")
        set.drawIconsEnabled = false
        set.drawCirclesEnabled = false
        
        set.setColor(.red)
        set.lineWidth = 0.5
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineWidth = 1
        set.formSize = 15
        
        let data = LineChartData(dataSet: set)
        
        frequencyChartView.data = data
    }
    
    func setMotorTempData(values: [ChartDataEntry]) {

        let set = LineChartDataSet(values: values, label: "motor temperature")
        set.drawIconsEnabled = false
        set.drawCirclesEnabled = false
        
        set.setColor(.red)
        set.lineWidth = 0.5
        set.drawCircleHoleEnabled = false
        set.valueFont = .systemFont(ofSize: 9)
        set.formLineWidth = 1
        set.formSize = 15
        
        let data = LineChartData(dataSet: set)
        
        motorTempView.data = data
    }
    
}

extension RightViewController: RightViewModelDelegate {
    
    func updateData(data: LineChartView.showData) {
        
        var array = [ChartDataEntry]()
        var fArray = [ChartDataEntry]()
        
        let sortedArr = data.Content.Data.sorted()
        let fSortedArr = data.Content.FFTData.sorted()
        
        yAxis.axisMinimum = sortedArr.first ?? 0
        yAxis.axisMaximum = sortedArr.last ?? 0
        yAxis2.axisMinimum = fSortedArr.first ?? 0
        yAxis2.axisMaximum = fSortedArr.last ?? 0
        
        typealias Dic = (key: String, value: String)
        var dicArr: [Dic] = []
        let controlData = data.Content.ControlData
        dicArr.append((key: "开机时间", value: Date.timeStampToHHMMSS(controlData.BootingTime) + "s"))
        dicArr.append((key: "运行时间", value: Date.timeStampToHHMMSS(controlData.OperatingTime) + "s"))
        dicArr.append((key: "切削深度", value: controlData.CuttingDepth))
        dicArr.append((key: "切削时间", value: controlData.CuttingTime + "s"))
        dicArr.append((key: "进给速率", value: controlData.FeedRate + "%"))
        dicArr.append((key: "输入转速", value: controlData.InputSpeed + " rpm"))
        dicArr.append((key: "主轴电流", value: controlData.SpindleCurrent + " A"))
        dicArr.append((key: "主轴负载率", value: controlData.SpindleLoadRatio + "%"))
        dicArr.append((key: "主轴转速", value: controlData.SpindleSpeed + " rpm"))
        dicArr.append((key: "X轴位置", value: controlData.X_axisPosition + " mm"))
        dicArr.append((key: "Y轴位置", value: controlData.Y_axisPosition + " mm"))
        dicArr.append((key: "Z轴位置", value: controlData.Z_axisPosition + " mm"))
        
//        var arr: [String] = []
//
//        for i in 0..<6 {
//            let t = Date.timeStampToHHMMSS("\(data.Content.RecordTime + i * 10)")
//            arr.append(t)
//        }
//        xAixs.valueFormatter = IndexAxisValueFormatter(values: arr)
//        xAixs2.valueFormatter = IndexAxisValueFormatter(values: arr)
//        print("arr = \(arr)")
        
        for (index, item) in data.Content.Data.enumerated() {
            let time = index
            let dataEntry = ChartDataEntry(x: Double(time), y: item)
            array.append(dataEntry)
        }
        
        for (index, item) in data.Content.FFTData.enumerated() {
            let time = index
            
            let dataEntry = ChartDataEntry(x: Double(time), y: item)
            fArray.append(dataEntry)
        }
        
        
        if motorTempArr.count > 5 { motorTempArr.removeFirst() }
        motorTempArr.append(ChartDataEntry(x: Double(motorCount),
                                           y: Double(controlData.MotorTemperature) ?? 0))
        motorCount += 1
        print("motorTempArr = \(motorTempArr)")
        print("motorCount = \(motorCount)")
        
        setDataCount(values: array)
        setFFTDataCount(values: fArray)
        setMotorTempData(values: motorTempArr)
        realTimeDataView.dicArr = dicArr
    }
}

extension LineChartView {
    
    class ControlDataModel {
        
        var InputSpeed = ""
        var SpindleSpeed = ""
        var FeedRate = ""
        var SpindleLoadRatio = ""
        var SpindleCurrent = ""
        var MotorTemperature = ""
        var CuttingDepth = ""
        var CuttingTime = ""
        var BootingTime = ""
        var OperatingTime = ""
        var X_axisPosition = ""
        var Y_axisPosition = ""
        var Z_axisPosition = ""
    }
    
    class ContentModel {
        
        var RecordTime: Int = 0
        var Data: [Double] = []
        var FFTData: [Double] = []
        var ControlData = ControlDataModel()
    }
    
    class showData {
        
        var SenderID: Int = 0
        var ReceiverID: Int = 0
        var MessageType: Int = 0
        var Content = ContentModel()
    }
}

