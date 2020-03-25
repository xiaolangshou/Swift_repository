//
//  ViewController.swift
//  ChartDemo
//
//  Created by Thomas Lau on 2018/7/31.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit
import Charts
import Then
import SnapKit

class ViewController: UIViewController {

    // 柱状图
    let barChartView = BarChartView().then {

        $0.noDataText = "暂无统计数据" //无数据的时候显示

        $0.chartDescription?.enabled = false //是否显示描述
        $0.pinchZoomEnabled = false
        $0.doubleTapToZoomEnabled = false
        $0.highlightFullBarEnabled = false
        $0.highlightPerTapEnabled = false
        $0.highlightPerDragEnabled = false
        $0.scaleXEnabled = false
        $0.scaleYEnabled = false
        $0.drawBarShadowEnabled = false
        $0.drawGridBackgroundEnabled = false

        // x轴设置
        let xAxis = $0.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = UIColor.hex(0x333333)
        xAxis.drawGridLinesEnabled = false

        // 右侧y轴设置
        let yAxis = $0.rightAxis
        yAxis.labelPosition = .outsideChart
        yAxis.labelTextColor = UIColor.clear
        yAxis.drawGridLinesEnabled = false //不画线
        yAxis.enabled = false

        // 左侧y轴设置
        $0.leftAxis.drawGridLinesEnabled = false
        $0.leftAxis.axisMinimum = 0.0 // 最小数据
    }
    
//    let barChartView = BarChartView()
//    let array1 = ["17.2", "20.38", "36.65", "30.48", "26.45", "29.13"]
//    let array2 = ["17.85", "18.63", "29.3", "26.3", "26.75", "22.3"]
//    var array = [[String]]()
//
//    var dataSetMin = Double(0)
//    var dataSetMax = Double(0)
//
//    let groupSpace = 0.4
//    let barSpace = 0.15
//    let barWidth = 0.15
//
//    var dataSets = [IChartDataSet]()
//
//    var colors = [UIColor.hex(0xE94444),
//                  UIColor.hex(0x4467E9)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(barChartView)
        self.barChartView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(UIScreen.main.bounds.width - 20)
            $0.top.equalToSuperview().offset(100)
        }
//
//        array.append(array1)
//        array.append(array2)
//
//        for (i, item) in array.enumerated() {
//            var yVals = [ChartDataEntry]()
//            var set = BarChartDataSet()
//            let arr = item
//
//            for (j, item) in arr.enumerated() {
//                if let val = Double(item) {
//
//                    yVals.append(BarChartDataEntry.init(x: Double(j), y: val))
//                    set = BarChartDataSet.init(values: yVals, label: "\(i)")
//                    set.setColor(colors[i])
//                    set.valueColors = colors
//                }
//            }
//            dataSets.append(set)
//        }
//
//        let data = BarChartData(dataSets: dataSets)
//        data.setValueFont(NSUIFont.boldSystemFont(ofSize: 8.0))
//        data.barWidth = Double(self.barWidth)
//        barChartView.xAxis.axisMinimum = 0
////        barChartView.xAxis.axisMaximum = 0 + data.groupWidth(groupSpace: Double(groupSpace), barSpace: Double(barSpace)) * 6
//        data.groupBars(fromX: 0, groupSpace: Double(groupSpace), barSpace: Double(barSpace))
//
//        barChartView.data = nil
//        barChartView.data = data
//        barChartView.animate(yAxisDuration: 1.0, easingOption: .easeInBack)
//        barChartView.notifyDataSetChanged()
        
        setBarChartViewData()
        
    }
    
    /// 设置柱状图数据
    ///
    /// - Parameter model: 数据
    func setBarChartViewData() {

        let entry1 = BarChartDataEntry(x: 1.0, y: Double(2))
        let entry2 = BarChartDataEntry(x: 2.0, y: Double(4))
        let entry3 = BarChartDataEntry(x: 3.0, y: Double(6))
        let entry4 = BarChartDataEntry(x: 4.0, y: Double(7))
        let entry5 = BarChartDataEntry(x: 5.0, y: Double(8))
        let entry6 = BarChartDataEntry(x: 6.0, y: Double(8))
        let entry7 = BarChartDataEntry(x: 7.0, y: Double(8))
        let entry8 = BarChartDataEntry(x: 8.0, y: Double(8))
        let entry9 = BarChartDataEntry(x: 9.0, y: Double(8))

        let dataEntris = [entry1, entry2, entry3, entry4, entry5, entry6, entry7, entry8, entry9]


        let chartDataSet = BarChartDataSet(values: dataEntris, label: "半全场胜平负")
        chartDataSet.colors = [UIColor.hex(0xE94444, 0.3),
                               UIColor.hex(0xE94444, 0.3),
                               UIColor.hex(0xE94444, 0.3),
                               UIColor.hex(0x4467E9, 0.3),
                               UIColor.hex(0x4467E9, 0.3),
                               UIColor.hex(0x4467E9, 0.3),
                               UIColor.hex(0x49D04F, 0.3),
                               UIColor.hex(0x49D04F, 0.3),
                               UIColor.hex(0x49D04F, 0.3)]
        chartDataSet.valueColors = [UIColor.hex(0xE94444),
                                    UIColor.hex(0xE94444),
                                    UIColor.hex(0xE94444),
                                    UIColor.hex(0x4467E9),
                                    UIColor.hex(0x4467E9),
                                    UIColor.hex(0x4467E9),
                                    UIColor.hex(0x49D04F),
                                    UIColor.hex(0x49D04F),
                                    UIColor.hex(0x49D04F)]

        let chartData = BarChartData(dataSet: chartDataSet)
        self.barChartView.data = chartData
        self.barChartView.animate(yAxisDuration: 1.0, easingOption: .easeInBack)
        self.barChartView.notifyDataSetChanged()
    }
}

extension UIColor {
    
    static func hex(_ rgb: UInt,
                    _ alpha: CGFloat = 1.0) -> UIColor {
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let greed = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((rgb & 0x0000FF)) / 255.0
        
        return UIColor.init(red: red, green: greed, blue: blue, alpha: alpha)
    }
}

